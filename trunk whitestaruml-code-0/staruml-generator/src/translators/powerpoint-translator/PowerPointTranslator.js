////////////////////////////////////////////////////////////////////////////////
//                                                                              
//                StarUML - The Open Source UML/MDA Platform.                   
//                                                                              
//              Copyright (C) 2002-2005 - Plastic Software, Inc.                
//                                                                              
//                                                                              
// This program is free software; you can redistribute it and/or modify it      
// under the terms of the GNU General Public License as published by the Free   
// Software Foundation; either version 2 of the License, or (at your option)    
// any later version.                                                           
//                                                                              
// This program is distributed in the hope that it will be useful, but WITHOUT  
// ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or        
// FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for     
// more details.                                                                
//                                                                              
// You should have received a copy of the GNU General Public License along with 
// this program; if not, write to the Free Software Foundation, Inc., 51        
// Franklin St, Fifth Floor, Boston, MA 02110-1301 USA                          
//                                                                              
// Linking StarUML statically or dynamically with other modules is making a     
// combined work based on StarUML. Thus, the terms and conditions of the GNU    
// General Public License cover the whole combination.                          
//                                                                              
// In addition, as a special exception, Plastic Software give you permission to 
// combine StarUML program with free software programs or libraries that are    
// released under the GNU LGPL/Mozilla/Apache/BSD and with code included in the 
// standard release of ExpressBar, ExpressNavBar, ExpressInspector,             
// ExpressPageControl, ProGrammar, NextGrid under the commercial license (or    
// modified versions of such code, with unchanged license). You may copy and    
// distribute such a system following the terms of the GNU GPL for StarUML and  
// the licenses of the other code concerned, provided that you include the      
// source code of that other code when and as the GNU GPL requires distribution 
// of source code. Plastic Software also give you permission to combine StarUML 
// program with dynamically linking plug-in (or add-in) programs that are       
// released under the GPL-incompatible and proprietary license.                 
//                                                                              
// Note that people who make modified versions of StarUML are not obligated to  
// grant this special exception for their modified versions; it is their choice 
// whether to do so. The GNU General Public License gives permission to release 
// a modified version without this exception; this exception also makes it      
// possible to release a modified version which carries forward this exception. 
////////////////////////////////////////////////////////////////////////////////

// global variables
var templateFilename, outputFilename, commentstate;
var app, prj;
var pptApp, pptPresentation;
var dLogger = null;
var inGenerating = false;

var currentItem = null;
var currentPos = 1;

/////////////////////////////////////////////////
// Execute :
//
function Execute(Args){
  try
  {
    templateFilename = Args.Get('TemplateFile');
    outputFilename = Args.Get('OutputFile');
    commentstate = Args.Get('Keep Comments');
    if (commentstate != null)
      commentstate = commentstate.toLowerCase();
      
    main();
  }
  catch(e)
  {
    return false;
  }
  return true;
}

/////////////////////////////////////////////////
// SetLogger :
//
function SetLogger(logger){
  dLogger = logger;
}

/////////////////////////////////////////////////
// log :
//
function log(message) {
  if (dLogger != null)
    dLogger.log(message);
}

/////////////////////////////////////////////////
// progress :
//
function progress(progressvalue, maxvalue) {
  if (dLogger != null)
    dLogger.Progress(progressvalue, maxvalue);
}

/////////////////////////////////////////////////
// Abort :
//
function Abort(){
  inGenerating = false;
}   

/////////////////////////////////////////////////
// main : starting point
//
function main() {
  // initProperties();
  
  // 1. create StarUML Object
  connectToStarUMLApplication();
  
  // 2. create Powerpoint COM Object
  connectToPPTApplication();
  
  inGenerating = true;
  
  try
  {
    // 3. duplicate template document
    clonePPTDocument();
    
    // 4. open cloned template document
    openClonedPPTDocument();
    
    // 5. generate document with template document
    generateDocument();
  }
  catch (e)
  {
    if(e=="user termination")
      log("Teminated by user request.");
    else
      log("Error : " + e);
    throw e;
  }
  finally {
    // 6 remove memos from generated doucment
    if (commentstate != 'true') 
      deleteAllComments();
    
    // 7. store generated document
    savePPTDocument();
    
    // 8. release Powerpoint COM Object
    disconnectToPPTApplication();
    
    // 9.release StarUML COM Object
    disconnectToStarUMLApplication();
    
    inGenerating = false;
  }
}


/////////////////////////////////////////////////
// initArguments : initialize variables
//
function initProperties() {
  // 1. template file name
  templateFilename = "C:\\Documents and Settings\\Administrator\\바탕 화면\\ppt-20050512(2)\\aaa--.ppt";
  
  // 2. output file name
  outputFilename = "C:\\Documents and Settings\\Administrator\\바탕 화면\\ppt-20050512(2)\\aaa--1.ppt";
}

/////////////////////////////////////////////////
// connectToStarUMLApplication : create StarUML COM Object
//
function connectToStarUMLApplication() {
  app = new ActiveXObject("StarUML.StarUMLApplication");
  prj = app.GetProject();
  log("Connected to StarUML.");
}

/////////////////////////////////////////////////
// connectToStarUMLApplication : create Powerpoint COM Object
//
function connectToPPTApplication() {
  pptApp = new ActiveXObject("PowerPoint.Application");
  pptApp.visible = true;
  pptApp.WindowState = 2;
  log("Connected to MS PowerPoint.");
}

/////////////////////////////////////////////////
// clonePPTDocument : clone template document
//
function clonePPTDocument() {
  pptPresentation = pptApp.Presentations.Open(templateFilename);
  // pptPresentation.ReadOnly = false;
  pptPresentation.SaveAs(outputFilename);
  pptPresentation.Close();
  log("Copied template document.");
}

/////////////////////////////////////////////////
// openClonedPPTDocument : open cloned template document
//
function openClonedPPTDocument() {
  // open template document
  pptPresentation = pptApp.Presentations.Open(outputFilename);
  // pptPresentation.visible = 0;
  notify("Open cloned template document.");
}

/////////////////////////////////////////////////
// generateDocument : 
//
function generateDocument() {
  log("Start to generate.");
  // 1. get all memos in template document
  var commentArray = getAllComments(1, pptPresentation.slides.count);
  
  // 2. to do: process slide master
  
  // 3. invoke templte handler with all memos
  traverseTemplate(prj, commentArray, false);
  
  // 4. create TOC
  
  // 5. select first slide
  pptPresentation.slides.item(1).Select();
}

/////////////////////////////////////////////////
// getAllComments :
//
function getAllComments(startSlideIndex, endSlideIndex) {
  // 1. create array
  var result = new Array();
  var c = 0;
  
  // 2. repeat all slides
  for (var i = startSlideIndex; i <= endSlideIndex; i++) {
    // 2.1 select a slide, in which get all comments
    var comments = pptPresentation.slides.item(i).comments;
    
    // 2.2 add comment to array
    for (var j = 1; j <= comments.count; j++, c++)
      result[c] = comments.item(j);
  }
  
  // 3. retrieve array
  return result;   
}

/////////////////////////////////////////////////
// trim :
//
function trim(str) {
  return str.replace(/(^\s*)|(\s*$)/g, "");
}

/////////////////////////////////////////////////
// createArray :
//
function createArray(collection) {
  var result = new Array(collection.count);
  
  for (var i = 1; i <= collection.count; i++)
    result[i-1] = collection.item(i);
  
  return result;
}

/////////////////////////////////////////////////
// createSubArray :
//
function createSubArray(collection, startIndex, endIndex) {
  var result = new Array(endIndex - startIndex + 1);
  
  for (var i = startIndex+1, j = 0; i <= (endIndex+1); i++, j++)
    result[j] = collection.item(i);
  
  return result;
}

/////////////////////////////////////////////////
// createSubArrayFromArray :
//
function createSubArrayFromArray(arr, startIndex, endIndex) {
  var result = new Array(endIndex - startIndex + 1);
  
  for (var i = startIndex, j = 0; i <= (endIndex); i++, j++)
    result[j] = arr[i];
  
  return result;
}

/////////////////////////////////////////////////
// indexOfIn :
//
function indexOfIn(collection, obj) {
  for (var i = 1; i < collection.count; i++) {
    if (collection.item(i).AuthorIndex == obj.AuthorIndex)
      return i - 1;
  }
  return -1;
}

/////////////////////////////////////////////////
// getCommandName :
//
function getCommandName(comment) {
  var commentTexts = comment.text.split("\n");
  var memoType = trim(commentTexts[0]);
  
  var startPos = memoType.indexOf("<<");
  var endPos = memoType.indexOf(">>");
  
  if ((startPos >= 0) && (endPos >= 0)) {
    startPos = 2;
    memoType = memoType.substring(startPos, endPos);
  }
  
  return memoType;
}

/////////////////////////////////////////////////
// getCommandArgStrs :
//
function getCommandArgStr(comment) {
  var commentTexts = comment.text.split("\n");
  var argStr = trim(commentTexts[1]);
  
  return argStr;
}

/////////////////////////////////////////////////
// traverseTemplate :
//
function traverseTemplate(rootElem, commentArray, isSub) {
  
  // set current
  currentItem = rootElem;
  //	currentPos = 1;
  notify("Generating contents...");
  for (var i = 0; i < commentArray.length; i++) {
    if (inGenerating) {
      var memoType = getCommandName(commentArray[i]);
      if (memoType == "REPEAT") {
        notify("Processing REPEAT command...");
        var j = getMatchComment(commentArray, "REPEAT", "ENDREP", i);
  
        if (j < i)
          break;
  
        var repeatCommentArray = createSubArrayFromArray(commentArray, i, j);
        traverseRepeatTemplate(rootElem, repeatCommentArray);
  
        i = j;
      } else if (memoType == "DISPLAY-TEXT") {
        notify("Processing DISPLAY-TEXT command...");
        traverseDisplayTextTempate(rootElem, commentArray[i]);
      } else if (memoType == "DISPLAY-IMAGE") {
        notify("Processing DISPLAY-IMAGE command...");
        traverseDisplayImageTempate(rootElem, commentArray[i]);
      } else if (memoType == "SCRIPT") {
        notify("Processing SCRIPT command...");
        traverseScriptTemplate(rootElem, commentArray[i]);
      } else {
        // do nothing
      }
      
      if (!isSub)
        progress(i + 1, commentArray.length);   
    } else {
      throw "user termination"; 
    }
  }
}

/////////////////////////////////////////////////
// selectRange : 
//
function selectRange(startSlideIndex, endSlideIndex) {
  var slideIndexArray = new Array();
  for (var i=startSlideIndex,c=0; i<=endSlideIndex; i++, c++) {
    slideIndexArray[c] = i;
  }
  
  pptPresentation.slides.Range(new VBArray(a)).Select();
  
  return endSlideIndex;
}

/////////////////////////////////////////////////
// getMatchComment : 
//
function getMatchComment(commentArray, startStr, endStr, index) {
  for (var i = index+1, c = 1; i < commentArray.length; i++) {
    var commandName = getCommandName(commentArray[i]);
    
    if (commandName == startStr) {
      c++;
    } else if (commandName.indexOf(endStr) >= 0) {
      c--;
      if (c == 0) 
        return i;
    }
  }
  return -1;
}

/////////////////////////////////////////////////
// stripEscape : 
//
function stripEscape(str) {
  var result = "";
  
  for (var p=0; p<str.length; p++) {
    if (str.charAt(p) >= ' ')
    result = result + str.charAt(p);
  }
  
  return result;
}

/////////////////////////////////////////////////
// traverseRepeatTemplate : 
//
function traverseRepeatTemplate(rootElem, commentArray) {
  if (inGenerating) {
  
    // set current
    currentItem = rootElem;
    currentPos = 0;
  
    // 1. memorize original block
    var startComment = commentArray[0];
    var endComment = commentArray[commentArray.length-1];
  
    // 2. get command argument
    var argStr = stripEscape(getCommandArgStr(startComment));
    var argStrArray = argStr.split(";");
  
    // 2.1 path
    var path = argStrArray[0];
    var isFullpath = false;
    var isRecursive = false;
  
    // 2.1.1 Recursive
    if (path.substr(0, 3) == "{R}") {
      isRecursive = true;
      path = path.substr(3, path.length-3);
    }
  
    // 2.1.2 absolute path
    if (path.substr(0, 2) == "::") {
      isFullpath = true;
    }
    // 2.2 filter type
    var itemType = argStrArray[1];
  
    // 2.3 Collection name
    var collectionName = argStrArray[2];
    var wholeConds = argStrArray[3];
  
    // 3.repeat elements for satisfying condition
    // for ( ... ) 
    // 3.0 search path
    var parentElem;
  
    if (path != "") {
      if (path == "::")
        parentElem = prj;
      else if (isFullpath)
        parentElem = app.findBypathname(path);
      else
        parentElem = rootElem.findByRelativePathname(path);
    } else
      parentElem = rootElem;
  
    if (itemType != "") {
      // 3.1 get all elements whose type is same as parentElem's type in parentElem's sub elements
      var filtedElems = getAllRecursiveElements(isRecursive, parentElem, itemType);
  
      var count = filtedElems.length;
  
      for (var i = count-1; i >= 0; i--) {
        var item = filtedElems[i];
  
        // set current
        currentItem = item;
        currentPos = i;
  
        // 3.2.1 in case of not existing collectionName
  
        // 3.2.1.1 check item to satisfy
        var cond = IsItemTrue(wholeConds);
  
        // 3.2.1.2 in case of not satisfying condition
        if (cond)
          traverseItemTemplate(item, startComment, endComment, commentArray, "ENDREPEAT", "ENDREPTR");
      }
    } else if (collectionName != "") {
      // 3.2 repeat elements in Collection
      var count = parentElem.MOF_GetCollectionCount(collectionName);
  
      for (var i = count-1; i >= 0; i--) {
        var item = parentElem.MOF_GetCollectionItem(collectionName, i);
  
        // set current
        currentItem = item;
        currentPos = i;
  
        var cond = IsItemTrue(wholeConds);
  
        if (cond)
          traverseItemTemplate(item, startComment, endComment, commentArray, "ENDREPEAT", "ENDREPTR");
  
      }
    }
  
    // 4. delete original slide 
    var S = endComment.Parent.SlideIndex;
    var E = startComment.Parent.SlideIndex;
    for (var i=S; i>=E; i--)
      pptPresentation.slides.item(i).Delete();
  }
}

/////////////////////////////////////////////////
// getAllRecursiveElements :
//
function getAllRecursiveElements(isRecursive, rootElem, filterType) {
  // 1. elem's type
  var rootElemPathname = rootElem.pathname;
  
  // 2.get all elements whose type is same as filterType in MetaClass
  var metaClass = app.MetaModel.FindMetaClass(filterType);
  var count = metaClass.getInclusiveInstanceCount();
  var elemArray = new Array();
  
  var rc = rootElemPathname.split("::").length;
  
  for (var i = 0; i < count; i++) {
    var elem = metaClass.getInclusiveInstanceAt(i);
  
    // 3.0 in case of existing filterType
    if (elem.IsKindOf(filterType)) {
      if (elem.pathname.indexOf(rootElemPathname + "::") == 0) {
        // 3.1 in case of gathering sub elements recursively
        if (isRecursive) {
          // 3. inserting sort by name
          elemArray = insertElementArray(elem, elemArray);
        }
    
        // 3.2 in case of gahering child elements
        else {
        // 3.2.1 no. of separator of pathname of selected element == no. of separator of pathname of rootElem + 1
          if (elem.pathname.split("::").length == (rc+1)) {
            elemArray = insertElementArray(elem, elemArray);
          }
          // 3.2.2 unless
          else {
            // do nothing
          }
        }
      }
    }
  }
  
  return elemArray;
}

/////////////////////////////////////////////////
// insertElementArray :
//
function insertElementArray(elem, arr) {
  var len = arr.length;
  
  // 1.search insertion position
  var p = 0;
  for (p = 0; p < len; p++) {
    if (elem.pathname < arr[p].pathname) {
      break;
    }
  }
  
  // 2.create new array
  var newArr = new Array();
  
  // 3.add previos elements before insertion position to new array
  if (p != 0)
    for (var i = 0; i < p ; i++)
      newArr[i] = arr[i];
  
  // 4. add elem to new array
  newArr[p] = elem;
  
  // 5. add last elements to new array
  if ((len != 0) && p < len)
    for (var i = p; i < len; i++) {
      newArr[i+1] = arr[i];
    }
  
  return newArr;
}

/////////////////////////////////////////////////
// IsItemTrue :
//
function IsItemTrue(wholeConds) {
  var cond = true;
  
  if (wholeConds != "") {
    eval("var cond = "+ wholeConds);
    return cond;
  } else {
    return true;
  }
}

/////////////////////////////////////////////////
// deleteComment :
//
function deleteComment(slideIndex, commandName, isReverse) {
  // delete parameter comment in selected slide
  
  var slide = pptPresentation.slides.item(slideIndex);
  
  if (!isReverse) {
    for (var i=1; i<=slide.comments.count; i++)
      if (slide.comments.item(i).text.indexOf("<<"+commandName+">>") > -1) {
        slide.comments.item(i).Delete();
        return;
      }
  } else {
    for (var i=slide.comments.count; i>=1; i--)
      if (slide.comments.item(i).text.indexOf("<<"+commandName+">>") > -1) {
        slide.comments.item(i).Delete();
        return;
      }
  }
}

/////////////////////////////////////////////////
// deleteAllComments :
//
function deleteAllComments() {
  // delete all comment in selected slide
  for (var slideIndex=1; slideIndex<=pptPresentation.slides.count; slideIndex++) {
    var slide = pptPresentation.slides.item(slideIndex);
  
    for (var commentIndex=slide.comments.count; commentIndex>=1; commentIndex--)
      if (slide.comments.item(commentIndex).text.indexOf("<<") > -1)
        slide.comments.item(commentIndex).Delete();
  }
}

/////////////////////////////////////////////////
// traverseItemTemplate :
//
function traverseItemTemplate(item, startComment, endComment, commentArray, mark1, mark2) {
  if (inGenerating) {
    // set current
    currentItem = item;
    
    var S = endComment.Parent.SlideIndex+1;
    var E = S+endComment.Parent.SlideIndex-startComment.Parent.SlideIndex;
    
    // select from REPEAT to ENDREPEAT
    for (var i=endComment.Parent.SlideIndex; i>=startComment.Parent.SlideIndex; i--)
    {
    notify("Analyzing model element...");
    
    pptPresentation.slides.item(i).Copy();
    pptPresentation.slides.Paste(S);
    notify("Transforming model element to document...");
    }
    
    // remove first REPEAT and last ENDREPEAT comment in cloned slide
    deleteComment(S, "REPEAT", false);
    deleteComment(E, "ENDREPEAT", true);
    
    
    // invoke traverseTemplate을 for comments in cloned slide
    //    selectRange(S, E);
    
    var subCommentArray = getAllComments(S, E);
    traverseTemplate( item, subCommentArray, true);
  }
}

/////////////////////////////////////////////////
// traverseDisplayTextTempate :
//
function traverseDisplayTextTempate(elem, comment) {
  if (inGenerating) {
    try
    {
      var slideIndex = comment.Parent.SlideIndex;
      var rootElem = elem;
      // 1.get comand argument
      var argStr = stripEscape(getCommandArgStr(comment));
      var argStrArray = argStr.split(";");
  
      // 2.1 path
      var path = argStrArray[0];
      var isFullpath = false;
      var isRecursive = false;
  
      // 2.1.1 Recursive
      if (path.substr(0, 3) == "{R}") {
        isRecursive = true;
        path = path.substr(3, path.length-3);
      }
  
      // 2.1.2 absolute path
      if (path.substr(0, 2) == "::")
        isFullpath = true;
  
      // 2.2 attribute name
      var attrExpr = argStrArray[1];
  
      // 2.3 index?
      //var indexed = argStrArray[3];
  
      // 3. reconfigure rootElement
      if (path != "") {
        if (path == "::")
          rootElem = prj;
        else if (isFullpath)
          rootElem = app.findBypathname(path);
        else
          rootElem = rootElem.findByRelativePathname(path);
      }
  
      // 4. set current
      currentItem = rootElem;
  
      // 5. get property value
  
      // 5.1 initialize value
      var value = null;
  
      if (attrExpr != "") {
        // 5.2 evaluate expression
        var evalExpr = "value = " + attrExpr
        eval(evalExpr);
      }
  
      // 6. determine position in which value is inserted
  
      // 6.1 get comment's left, top value
      var commentLeft = comment.Left;
      var commentTop = comment.Top;
  
      // 6.2 for shape in current slide's shapes
      var shapes = pptPresentation.slides.item(slideIndex).Shapes;
  
      for (var i = 1; i <= shapes.count; i++) {
        var shape = shapes.item(i);
  
        // 6.2.1 if shape's boundary contains comment's left, top
        if (isIn(shape, commentLeft, commentTop)) {
          // 6.2.1.1 finde $$ position in shape.textFrame.textRange.text
          var startPos = shape.textFrame.textRange.text.indexOf("$$");
          var len = 2;
    
          // 6.2.1.2 if $$ doesn't exist, insertion position is last of text
          if (startPos == -1) {
            startPos = shape.textFrame.textRange.text.length;
            len = 0;
          }
    
          // 6.2.1.3 insert text at insertion position
          pptPresentation.slides.item(slideIndex).Select();
          
/*
          var tmp = "";
          tmp = shape.TextFrame.TextRange.Characters(startPos, len).Text;
          if (tmp != null && tmp.length == 2) {
            if (tmp.charAt(0) != '$' && tmp.charAt(1) == '$')
              shape.TextFrame.TextRange.Characters(startPos+1, len).Select();
            else if (tmp.charAt(0) == '$' && tmp.charAt(1) != '$')
              shape.TextFrame.TextRange.Characters(startPos-1, len).Select();
            else
              shape.TextFrame.TextRange.Characters(startPos, len).Select();
          }
          pptApp.ActiveWindow.Selection.TextRange.Text = value;
*/
          shape.TextFrame.TextRange.Replace("$$", value, false);
          
          // 6.2.1.4 exit repeat block
          return;
        }
      }
    }
    catch(e)
    {
      throw e;
    }
  }
}

/////////////////////////////////////////////////
// traverseDisplayImageTempate :
//
function traverseDisplayImageTempate(elem, comment) {
  if (inGenerating) {
    var slideIndex = comment.Parent.SlideIndex;
    var rootElem = elem;
  
    // 1.get command argument
    var commentText = comment.text.split("\n");
    var commandName = trim(commentText[0]);
    var argStr = trim(commentText[1]);
  
    var argStrArray = argStr.split(";");
  
    // 2.1 path
    var path = argStrArray[0];
    var isFullpath = false;
    var isRecursive = false;
  
    // 2.1.1 Recursive
    if (path.substr(0, 3) == "{R}") {
      isRecursive = true;
      path = path.substr(3, path.length-3);
    }
  
    // 2.1.2 absolute path
    if (path.substr(0, 2) == "::")
      isFullpath = true;
  
    // 2.2 attribute name
    var attrExpr = argStrArray[1];
  
    // 2.3 is indexed
  
    // 3. reconfigure rootElement
    if (path != "") {
      if (path == "::")
        rootElem = prj;
      else if (isFullpath)
        rootElem = app.findBypathname(path);
      else
        rootElem = rootElem.findByRelativePathname(path);
    }
  
    // 4. set current
    currentItem = rootElem;
  
    // 5. get property value
    if (rootElem.IsKindOf("Diagram") && ((attrExpr == null) || (attrExpr == ""))) {
      // 5.1 copy diagram image to clipboard
      rootElem.DiagramView.CopyDiagram();
    }
  
    // 6. determine position to insert value
  
    // 6.1 get comment's left, top value
    var commentLeft = comment.Left;
    var commentTop = comment.Top;
  
    // 6.2 for shape in current slide's shapes
    var shapes = pptPresentation.slides.item(slideIndex).Shapes;
  
    for (var i = 1; i <= shapes.count; i++) {
      var shape = shapes.item(i);
  
      // 6.2.1 if shape's boundary contains comment's left, top
      if (isIn(shape, commentLeft, commentTop)) {
  
        // 6.2.1.1 paste image
        pptPresentation.slides.item(slideIndex).Select();
        pptApp.ActiveWindow.View.Paste();
  
        // 6.2.1.2 get shape size
        var shapeLeft = shape.Left;
        var shapeTop =  shape.Top;
        var shapeWidth = shape.Width;
        var shapeHeight = shape.Height;
        
        pptApp.ActiveWindow.Selection.ShapeRange.Left = shapeLeft;
        pptApp.ActiveWindow.Selection.ShapeRange.Top = shapeTop;
  
        // 6.2.1.3 resize image by shape's ratio
        var xratio = pptApp.ActiveWindow.Selection.ShapeRange.Width / shapeWidth;
        var yratio = pptApp.ActiveWindow.Selection.ShapeRange.Height / shapeHeight;
  
        if (xratio > yratio)
          pptApp.ActiveWindow.Selection.ShapeRange.Width = shapeWidth;
        else
          pptApp.ActiveWindow.Selection.ShapeRange.Height = shapeHeight;
  
        // 6.2.1.3 delete shape
        shape.Delete();
  
        // 6.2.1.4 exit repeat block
        return;
      }
    }
  }
}

/////////////////////////////////////////////////
// isIn : Is point in shape?
//
function isIn(shape, left, top) {
  var shapeLeft = shape.Left;
  var shapeTop =  shape.Top;
  var shapeRight = shapeLeft + shape.Width;
  var shapeBottom = shapeTop + shape.Height;
  
  if ((shapeLeft <= left) && (left <= shapeRight) &&
    (shapeTop <= top) && (top <= shapeBottom))
    return true;
  else
    return false;
}

/////////////////////////////////////////////////
// traverseIfTemplate :
//
function traverseIfTemplate(rootElem, ifCommentArray) {
  // set current
  currentItem = rootElem;
  // currentPos = 0;
  
  // 1.memorize original block
  var startComment = ifCommentArray[0];
  var endComment = ifCommentArray[ifCommentArray.length-1];
  
  // 2.get command argument
  var str = startComment.range.text;
  var argStr = stripEscape(str);
  var argStrArray = argStr.split(";");
  
  var wholeConds = argStrArray[0];
  
  // 3.2.1.1 check item to satisfy
  var cond = IsItemTrue(wholeConds);
  
  // 3.2.1.2 in case of for item satisfying condition
  if (cond)
    traverseItemTemplate(rootElem, startComment, endComment, ifCommentArray, "ENDIF", "ENDIFTR");
  
  selectRange(startComment.Parent.SlideIndex, endComment.Parent.SlideIndex);
  
  if (endComment.author == "ENDIF")
    pptApp.selection.Delete();
  else if (endComment.author == "ENDIFTR")
    pptApp.selection.Rows.Delete();
}

/////////////////////////////////////////////////
// traverseScriptTemplate :
//
function traverseScriptTemplate(elem, comment) {
  var rootElem = elem;
  
  // get command arguemnt
  var str = comment.range.text;
  var scripts = stripEscape(str);
  
  // set current
  currentItem = rootElem;
  
  // evaluate script
  eval(scripts);
}

/////////////////////////////////////////////////
// savePPTDocument : store generated Powerpoint document
//
function savePPTDocument() {
  pptPresentation.Save();
  pptApp.visible = true;
  pptPresentation.Close();
  log("Stored generated document.");
}

/////////////////////////////////////////////////
// disconnectToPPTApplication : 워드 객체 해제한다
//
function disconnectToPPTApplication() {
  pptApp.quit();
  log("Released Powerpoint.");
}

/////////////////////////////////////////////////
// disconnectToStarUMLApplication : 플라스틱 객체를 해제한다
//
function disconnectToStarUMLApplication() {
  // to do
  log("Released StarUML.");
}

/////////////////////////////////////////////////
// utilities
//

/////////////////////////////////////////////////
// findByFullpath(path): elem
//
function findByFullpath(path) {
  return app.findBypathname("::"+path);
}

/////////////////////////////////////////////////
// findByLocalpath(rootElem, path): elem
//
function findByLocalpath(rootElem, path) {
  return rootElem.findByRelativePathname(path);
}

/////////////////////////////////////////////////
// itemCount(rootElem, collectionName): int
//
function itemCount(rootElem, collectionName) {
  return rootElem.MOF_GetCollectionCount(collectionName);
}

/////////////////////////////////////////////////
// item(rootElem, collectionName, index): elem
//
function item(rootElem, collectionName, index) {
  return rootElem.MOF_GetCollectionItem(collectionName, index);
}

/////////////////////////////////////////////////
// attr(elmm, attrName): value or object
//
function attr(rootElem, attrName) {
  try
  {
    var value = rootElem.MOF_GetAttribute(attrName);
    return value;
  }
  catch (e)
  {
    // do none
  }
  
  try
  {
    var value = rootElem.MOF_GetReference(attrName);
    return value;
  }
  catch (e)
  {
    // do none
  }
  
  return null;
}

/////////////////////////////////////////////////
// current(): elem   
//
function current() {
  return currentItem;
}

/////////////////////////////////////////////////
// pos(): int   
//
function pos() {
  return currentPos;
}

/////////////////////////////////////////////////
// StarUMLApp(): app   
//
function StarUMLApp() {
  return app;
}

/////////////////////////////////////////////////
// MSPPT(): pptApp   
//
function MSPPT() {
  return pptApp;
}
