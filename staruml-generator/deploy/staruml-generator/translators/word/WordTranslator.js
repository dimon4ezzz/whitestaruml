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

var templateFilename, outputFilename;
var commentstate, ShowGenerationProcess, GeneratingIndex, NormalGeneration;
var app, prj;
var wordApp, wordDoc;
var dLogger = null;
var inGenerating = false;
var currentItem = null;
var currentPos = 1;

function Execute(Args){
  try 
  {
    templateFilename = Args.Get('TemplateFile');
    outputFilename = Args.Get('OutputFile');

    commentstate = Args.Get('Keep Comments');
    if (commentstate != null)
      commentstate = commentstate.toLowerCase();

    ShowGenerationProcess = Args.Get('ShowGenerationProcess');
    if (ShowGenerationProcess != null)
      ShowGenerationProcess = ShowGenerationProcess.toLowerCase();

    GeneratingIndex = Args.Get('Generate Index');
    if (GeneratingIndex != null)
      GeneratingIndex = GeneratingIndex.toLowerCase();

    NormalGeneration = Args.Get('Normal Generation');
    if (NormalGeneration != null)
      NormalGeneration = NormalGeneration.toLowerCase();

    main();
  }
  catch(e)
  {
    return false;
  }
  return true;
}

function SetLogger(logger){
  dLogger = logger;
}

function log(message) {
  if (dLogger != null)
    dLogger.log(message);
}

function notify(message) {
  if (dLogger != null)
    dLogger.notify(message);
}

function progress(progressvalue, maxvalue) {
  if (dLogger != null)
    dLogger.Progress(progressvalue, maxvalue);
}

function Abort(){
  inGenerating = false;
}   

//main(inputFilename, outputFilename); 
//main(); 

/////////////////////////////////////////////////
// main : starting point for whole process
//  
function main() {
  // 0.set parameters used in program
  //    initProperties();

  // 1.create StarUML COM Object
  connectToStarUMLApplication();

  // 2.create Word COM Object
  connectToWordApplication();

  inGenerating = true;
  
	try
	{
    // 3.duplicate original document template
    cloneWordDocument();
    
    // 4.open cloned document template
    openClonedWordDocument();
    
    // 5.start generating
    log('Start to generate.');
    
    generateDocument();
  }
  catch(e)
  {
    if(e=="user termination")
    log("Terminated by user request.");
    else
    log("Error : " + e);
    throw e;
  }
  finally
  {
    if (commentstate != 'true') 
    deleteAllComments();
    
    // 6.store result word document
    saveWordDocument();
    
    // log('Document generation is done.');
    // 7.release Word COM Object
    disconnectToWordApplication();
    
    // 8.release StarUML COM Object
    disconnectToStarUMLApplication();
    
    inGenerating = false;
  }
}

/////////////////////////////////////////////////
// initProperties : initialize variables for program
//
function initProperties() {
  // to do : variable value must be parameterized...
  
  // 1. set template file name
  templateFilename = "temp.doc";
  
  // 2. set output file name
  outputFilename = "out.doc";
}

/////////////////////////////////////////////////
// connectToStarUMLApplication : create StarUML COM Object
//
function connectToStarUMLApplication() {
  app = new ActiveXObject("StarUML.StarUMLApplication");
  if (NormalGeneration == 'false') 
    prj = app.SelectionManager.GetSelectedModelAt(0);
  else
    prj = app.GetProject();
  log("Connected to StarUML.");
}

/////////////////////////////////////////////////
// connectToStarUMLApplication : creat Word COM Object
//
function connectToWordApplication() {
  wordApp = new ActiveXObject("Word.Application");
  wordApp.visible = ShowGenerationProcess;
  log("Connected to MS WORD.");
}

/////////////////////////////////////////////////
// cloneWordDocument : copy word template document
//
function cloneWordDocument() {
  try
  {
    wordDoc = wordApp.Documents.Open(templateFilename, false, true);
    wordApp.ActiveWindow.View.ShowFieldCodes = false;
    wordDoc.ReadOnlyRecommended = false;
    wordDoc.SaveAs(outputFilename);
    log("Word template document is cloned.");
  }
  finally
  {
    wordDoc.Close();  
  }  
}

/////////////////////////////////////////////////
// openClonedWordDocument : open cloned word template document
//
function openClonedWordDocument() {
  // open document template
  try
  {
    wordDoc = wordApp.Documents.Open(outputFilename);
    //log('Opening template document....');
    notify("Connecting template document...");
    
    // set document view style to 'print view style'
    if (wordApp.ActiveWindow.View.SplitSpecial == 0) /*wdPaneNone*/
    wordApp.ActiveWindow.ActivePane.View.Type = 3; /*wdPrintView*/
    else
    wordApp.ActiveWindow.View.Type = 3; /*wdPrintView*/
  }
  catch(e)
  {
    throw e;
  }
}

/////////////////////////////////////////////////
// generateDocument : 
//
function generateDocument() {
  // 1.get all memos in document
  notify("Analyzing template docuement...");
  var commentArray = getAllComments(wordDoc);

  // 2.process Header/Footer
  notify("Generating header/footer of document...");
  traversePageSetupTemplate(prj);

  // 3.call handler with all memos
  traverseTemplate(prj, commentArray, false);

  // 4.update table of contents
  var count = wordDoc.Fields.Count;

  // 5.1 update index source
  if (inGenerating) {
    var log_string = '';
  
    notify("Start to update field.");
    for (var i=1; i<=wordDoc.Fields.Count; i++) {
      notify("Updating fields...");
      var item = wordDoc.Fields.item(i);
      if (item.Type == 4) {
        item.showCodes = false;
        item.code.showAll = false;
      }
      else if (item.Type == 12) {
        item.Update();
      }
    }
  
    // 5.2 update TOC, Index
    for (var i=1; i<=wordDoc.Fields.Count; i++) {
      var item = wordDoc.Fields.item(i);
      // determine whether to generate index by external parameter...
      if ((item.Type == 8) && (GeneratingIndex.toLowerCase() == "true")) {
        notify("Updating document index...");
        item.Update();
      }
      else if (item.Type == 13) {
        item.Update();
      }
    }
  }
  wordApp.selection.setRange(0, 0);
}

/////////////////////////////////////////////////
// traversePageSetupTemplate : 
//
function traversePageSetupTemplate(rootElem) {
  currentItem = rootElem;

  var sections = wordDoc.Sections;
  for (var i=1; i<=sections.Count; i++)
  {
    notify("Updating header/footer in "+i+" th section...");
    var section = sections.Item(i);
    section.Range.SetRange(0, 0);
    section.Range.Select();

    currentItem = rootElem;

    traverseHeaderFooterTemplate(rootElem, 9 /*wdSeekCurrentPageHeader*/);
    // process Footer
    traverseHeaderFooterTemplate(rootElem,  10/*wdSeekCurrentPageFooter*/);
  }
}

/////////////////////////////////////////////////
// traversePageSetupTemplate : 
//
function traverseHeaderFooterTemplate(rootElem, target) {
  currentItem = rootElem;
  
  wordApp.ActiveWindow.ActivePane.View.SeekView = target /*wdSeekCurrentPageHeader*/;
  
  wordApp.Selection.WholeStory();
  
  var count = wordApp.Selection.Fields.Count;
  
  for (var i=1; i<=count; i++) {
    var field = wordApp.Selection.Fields.Item(i);
  
    if (field.Code.Text.indexOf("COMMENTS") != -1) {
      var command = trim(stripEscape(wordApp.Selection.Fields.Item(i).Result.Text));
  
      if ((command != null) && (command != "")) {
        eval("var result = " + command + ";");
        field.Result.Text = result;
        field.Code.Text = "COMMENTS " + result;
      }
    }
  }
  
  wordApp.ActiveWindow.ActivePane.View.SeekView = 0 /*wdSeekMainDocument*/;
}

/////////////////////////////////////////////////
// trim : 
//
function trim(str) {
  return str.replace(/(^\s*)|(\s*$)/g, "");
}

/////////////////////////////////////////////////
// getAllComments : 
//
function getAllComments(document) {
  return createArray(document.comments);
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
// indexOfIn : 
//
function indexOfIn(collection, obj) {
  for (var i = 1; i < collection.count; i++) {
    if (collection.item(i).index == obj.index)
      return i - 1;
  }

  return -1;
}

/////////////////////////////////////////////////
// traverseTemplate : 
//
function traverseTemplate(rootElem, commentArray, isSub) {
  // set current
  currentItem = rootElem;
  //currentPos = 1;
  
  notify("generating contents...");
  
  for (var i = 0; i < commentArray.length; i++) {
    if (inGenerating) {
      var memoType = commentArray[i].author;
      if (memoType == "REPEAT") {
        var j = getMatchComment(commentArray, "REPEAT", "ENDREP", i);
        notify("Processing repeat command...");
  
        if (j < i)
          break;
        selectRange(commentArray[i], commentArray[j], "ENDREPEAT", "ENDREPTR");
        var repeatCommentArray = createArray(wordApp.selection.comments);
        traverseRepeatTemplate(rootElem, repeatCommentArray);
        i = j;
      } else if (memoType == "DISPLAY") {
        traverseDisplayTempate(rootElem, commentArray[i]);
        notify("Wring contents...");
  
      } else if (memoType == "IF") {
        var j = getMatchComment(commentArray, "IF", "ENDIF", i);
        if (j < i)
          break;
        selectRange(commentArray[i], commentArray[j], "ENDIF", "ENDIFTR");
        var ifCommentArray = createArray(wordApp.selection.comments);
        traverseIfTemplate(rootElem, ifCommentArray);
        i = j;
      } else if (memoType == "SCRIPT") {
        traverseScriptTemplate(rootElem, commentArray[i]);
      } else {
        // do nothing
      }
      if (!isSub)
        progress(i + 1, commentArray.length + 5);         
    } else { 
      throw "user termination"; 
    }
  }
}

/////////////////////////////////////////////////
// selectRange : 
//  
function  selectRange(startComment, endComment, mark1, mark2) {
  if (endComment.author == mark1) {
    wordApp.selection.setRange(endComment.scope.end+1, endComment.scope.end + 2);
    var w = 0;
  
    if (wordApp.selection.Text == "\r")
      w = 1;
  
    wordApp.selection.setRange(
      startComment.scope.start,
      endComment.scope.end + 1 + w
    );
  
    return endComment.scope.end + 1 + w;
  } else if (endComment.author == mark2) {
    wordApp.selection.setRange(endComment.scope.end+2, endComment.scope.end + 3);
    var w = 0;
  
    if (wordApp.selection.Text.charCodeAt(0) == 13) 
      w = 1;
  
    wordApp.selection.setRange(
      startComment.scope.start,
      endComment.scope.end + 2 + w
    );
  
    return endComment.scope.end + 2 + w;
  }
}

/////////////////////////////////////////////////
// getMatchComment : 
//  
function getMatchComment(commentArray, startStr, endStr, index) {
  for (var i = index+1, c = 1; i < commentArray.length; i++) {
    if (commentArray[i].author == startStr) {
    c++;
    } else if (commentArray[i].author.indexOf(endStr) >= 0) {
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
  
  if (str == null)
    return result;
  
  for (var p=0; p<str.length; p++) 
    if (str.charAt(p) >= ' ')
      result = result + str.charAt(p);
  
  return result;
}

/////////////////////////////////////////////////
// traverseRepeatTemplate : 
//  
function traverseRepeatTemplate(rootElem, commentArray) {
  if (inGenerating) {
    try
    {
      // set current
      currentItem = rootElem;
      currentPos = 0;
    
      // 1.memorize original block
      var startComment = commentArray[0];
      var endComment = commentArray[commentArray.length-1];
    
      // 2.get command's arguments
      var str = startComment.range.text;
      var argStr = stripEscape(str);
      var argStrArray = argStr.split(";");
    
      // 2.1 path
      var path = argStrArray[0];
      var isFullpath = false;
      var isRecursive = false;
    
      // 2.1.1 determine Recursive
      if (path.substr(0, 3) == "{R}") {
        isRecursive = true;
        path = path.substr(3, path.length-3);
      }
    
      // 2.1.2 is absolute path
      if (path.substr(0, 2) == "::")
        isFullpath = true;
    
      // 2.2 filter type
      var itemType = argStrArray[1];
    
      // 2.3 Collection name
      var collectionName = argStrArray[2];

      // 2.4 conditions    
      var wholeConds = argStrArray[3];
    
      // 3.repeat commands for satisfying condition
      // 3.0 find path
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
    
      if ((itemType != "") && (collectionName != "")) {
        // 3.1 get all elements which are same type as parentElem's type in parentElem's sub element.
        var filtedElems = getAllRecursiveElements(isRecursive, parentElem, itemType);
    
        var count = filtedElems.length;
    
        for (var i = count-1; i >= 0; i--) {
          var item = filtedElems[i];
    
          // set current
          currentItem = item;
          currentPos = i;
    
          var _count = item.MOF_GetCollectionCount(collectionName);
    
          for (var _i = _count-1; _i >= 0; _i--) {
            var _item = item.MOF_GetCollectionItem(collectionName, _i);
    
            // set current
            currentItem = _item;
            currentPos = _i;
    
            var _cond = IsItemTrue(wholeConds);
    
            if (_cond)
              traverseItemTemplate(_item, startComment, endComment, commentArray, "ENDREPEAT", "ENDREPTR");
          }
        }
      } else if (itemType != "") {
        // 3.1 get all elements which are same type as parentElem's type in parentElem'sub elements.
        var filtedElems = getAllRecursiveElements(isRecursive, parentElem, itemType);
    
        var count = filtedElems.length;
    
        for (var i = count-1; i >= 0; i--) {
          var item = filtedElems[i];
    
          // set current
          currentItem = item;
          currentPos = i;
    
          // 3.2.1 doesn't exist collectionName
    
          // 3.2.1.1 check that item is in this case
          var cond = IsItemTrue(wholeConds);
    
          // 3.2.1.2 if in this case, process repeating item
          if (cond)
            traverseItemTemplate(item, startComment, endComment, commentArray, "ENDREPEAT", "ENDREPTR");
        }
      } else if (collectionName != "") {
        // 3.2 repeat elements of Collection
    
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
    
      // 4.delete original block
      selectRange(startComment, endComment, "ENDREPEAT", "ENDREPTR");
    
      if (endComment.author == "ENDREPEAT")
        wordApp.selection.Delete();
      else if (endComment.author == "ENDREPTR")
        wordApp.selection.Rows.Delete();
    }
    catch(e)
    {
      if (e == "user termination")
        throw e;
      else {
        wordApp.Selection.Font.Size = 14;
        wordApp.Selection.Font.Bold = true;
        wordApp.Selection.Font.Underline = true;
        wordApp.Selection.Font.Italic = true;
        wordApp.Selection.Font.Color = 255;
        wordApp.selection.typeText("[ERROR : Error occurs in REPEAT command.]");
        log("[Error occurs in REPEAT command.]");
      }
    }
  }
}

/////////////////////////////////////////////////
// getAllRecursiveElements : 
//  
function getAllRecursiveElements(isRecursive, rootElem, filterType) {
  // 1. get elem's type
  var rootElemPathname = rootElem.pathname;
  
  // 2.get all elements which is same type as filterType in MetaClass.
  var metaClass = app.MetaModel.FindMetaClass(filterType);
  var count = metaClass.getInclusiveInstanceCount();
  var elemArray = new Array();
  
  var rc = rootElemPathname.split("::").length;
  
  for (var i = 0; i < count; i++) {
    var elem = metaClass.getInclusiveInstanceAt(i);
  
    // 3.0 in case of filterType
    if (elem.IsKindOf(filterType)) {
  
      if (elem.pathname.indexOf(rootElemPathname + "::") == 0) {
  
        // 3.1 get sub elements recursively
        if (isRecursive)
          // insertion sort for gathered elements
          elemArray = insertElementArray(elem, elemArray);
  
        // 3.2 get child elements
        else {
          // 3.2.1 if the number or separator of selected element's pathname ==  the number or separator of pathname of rootElem + 1
          if (elem.pathname.split("::").length == (rc+1))
            elemArray = insertElementArray(elem, elemArray);
          // 3.2.2 unless
          else
            ; // do nothing
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
  for (p = 0; p < len; p++)
    if (elem.pathname < arr[p].pathname)
      break;
  
  // 2.create new array
  var newArr = new Array();
  
  // 3.add previous elements at insertion position in new array
  if (p != 0)
    for (var i = 0; i < p ; i++)
      newArr[i] = arr[i];
  
  // 4.insert elem at insertion position
  newArr[p] = elem;
  
  // 5.append last elements to new array
  if ((len != 0) && p < len)
    for (var i = p; i < len; i++)
      newArr[i+1] = arr[i];
  
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
  } else
    return true;
}

/////////////////////////////////////////////////
// traverseItemTemplate : 
//  
function traverseItemTemplate(item, startComment, endComment, commentArray, mark1, mark2) {
  if (inGenerating) {
    // set current
    currentItem = item;
    var E;
    
    if (endComment.author == mark1) {
      // select from REPEAT to ENDREPEAT
      E = selectRange(startComment, endComment, mark1, mark2);
      
      // copy and paste selected contents
      wordApp.selection.copy();
      wordApp.selection.setRange(E, E);
      wordApp.selection.paste();
      notify("Transforming model element to document...");
    } else if (endComment.author == mark2) {
      // REPEAT에서 ENDREPEAT까지 선택한다
      E = selectRange(startComment, endComment, mark1, mark2);
      notify("Transforming model element to document...");
      // copy and paste selected contents
      wordApp.selection.copy();
      wordApp.selection.setRange(E, E);
      wordApp.selection.paste();
    }
    
    // for cloned REPEAT+1, cloned ENDREPEAT-1, call traverseTemplate
    var K = (indexOfIn(wordDoc.comments, endComment) + 1) + 1;	// cloned REPEAT+1
    var L = (K + commentArray.length - 1) - 1;					// cloned ENDREPEAT-1
    
    var subCommentArray;
    
    if (K <= L) {
      subCommentArray = createSubArray(wordDoc.comments, K, L);
      traverseTemplate( item, subCommentArray , true);
    }
  }
}

/////////////////////////////////////////////////
// traverseDisplayTempate : 
//  
function traverseDisplayTempate(elem, comment) {
  if (inGenerating) {
    try
    {
      var rootElem = elem;
    
      // 1.get command argument
      var str = comment.range.text;
      var argStr = stripEscape(str);
    
      var argStrArray = argStr.split(";");
    
      // 2.1 pathname
      var path = argStrArray[0];
      var isFullpath = false;
      var isRecursive = false;
    
      // 2.1.1 Recursively?
      if (path.substr(0, 3) == "{R}") {
        isRecursive = true;
        path = path.substr(3, path.length-3);
      }
    
      // 2.1.2 is absolute pathname
      if (path.substr(0, 2) == "::")
        isFullpath = true;
    
      // 2.2 attribute name
      var attrExpr = argStrArray[1];
    
      // 2.3 is indexed?
      var indexed = argStrArray[2];
    
      // 3. reset rootElement
      if (path != "") {
        if (path == "::")
          rootElem = prj;
        else if (isFullpath)
          rootElem = app.findBypathname(path);
        else
          rootElem = rootElem.findByRelativePathname(path);
      }   
    
      // set current
      currentItem = rootElem;
    
      // 4. set insertion position
      var S = comment.scope.start;
      var E = comment.scope.end; 
      wordApp.selection.setRange(E+1, E+1);
    
      // 5. insert value
      if (rootElem.IsKindOf("Diagram") && (attrExpr == "")) {
        // 4.2.1 copy image to clipboard
        rootElem.DiagramView.CopyDiagram();
    
        // 4.2.2 insert image
        wordApp.selection.paste();
      } else {
        // 4.2.1 get property value
        var value = null;
    
        if (attrExpr != "") {
          var evalExpr = "value = " + attrExpr
          eval(evalExpr);
        }
    
        // 4.2.2 insert text
        wordApp.selection.typeText("" + value);
    
        // 4.2.3 insert index
        if (indexed == "I")
          wordApp.selection.Fields.Add( wordApp.selection.Range, -1, "XE \""+ value +"\"", false );
      }
    }
    catch(e)
    {
      var E = comment.scope.end;
      wordApp.selection.setRange(E+1, E+1);
      wordApp.Selection.Font.Size = 14;
      wordApp.Selection.Font.Bold = true;
      wordApp.Selection.Font.Underline = true;
      wordApp.Selection.Font.Italic = true;
      wordApp.Selection.Font.Color = 255;
      wordApp.selection.typeText("[ERROR : Error occurs in DISPLAY command.]");
      log("[ERROR : Error occurs in DISPLAY command.]");
    }
  }   
}

/////////////////////////////////////////////////
// traverseIfTemplate : 
//  
function traverseIfTemplate(rootElem, ifCommentArray) {
  try
  {
    // set current.
    currentItem = rootElem;
    //	currentPos = 0;
    
    // 1.memorize original block
    var startComment = ifCommentArray[0];
    var endComment = ifCommentArray[ifCommentArray.length-1];
    
    // 2.get command argument
    var str = startComment.range.text;
    var argStr = stripEscape(str);
    var argStrArray = argStr.split(";");
    
    var wholeConds = argStrArray[0];
    
    // 3.2.1.1 check for item to satisfy condition
    var cond = IsItemTrue(wholeConds);
    
    // 3.2.1.2 repeating items for satisfying condition
    if (cond)
      traverseItemTemplate(rootElem, startComment, endComment, ifCommentArray, "ENDIF", "ENDIFTR");
    
    // 4.delete original block
    selectRange(startComment, endComment, "ENDIF", "ENDIFTR");
    
    if (endComment.author == "ENDIF")
      wordApp.selection.Delete();
    else if (endComment.author == "ENDIFTR")
      wordApp.selection.Rows.Delete();
  }
  catch(e)
  {
    var E = comment.scope.end;
    wordApp.selection.setRange(E+1, E+1);
    wordApp.Selection.Font.Size = 30;
    wordApp.selection.typeText("[Error occurs in IF command.]");
    log("[ERROR : Error occurs in IF command.]");
  }
}

/////////////////////////////////////////////////
// traverseScriptTemplate : 
//  
function traverseScriptTemplate(elem, comment) {
  try
  {
    var rootElem = elem;
    
    // get command arguments
    var str = comment.range.text;
    var scripts = stripEscape(str);
    
    // set current
    currentItem = rootElem;
    
    // execute jscript
    eval(scripts);
  }
  catch(e)
  {
    var E = comment.scope.end;
    wordApp.selection.setRange(E+1, E+1);
    wordApp.Selection.Font.Size = 14;
    wordApp.Selection.Font.Bold = true;
    wordApp.Selection.Font.Underline = true;
    wordApp.Selection.Font.Italic = true;
    wordApp.Selection.Font.Color = 255;
    wordApp.selection.typeText("[ERROR : Error occurs in SCRIPT command.]");
    log("[ERROR : Error occurs in SCRIPT command.]");
  }
}

/////////////////////////////////////////////////
// deleteAllComments : 
//  
function deleteAllComments() {
  // delete all memos from generated document
  wordDoc.DeleteAllComments();
}

/////////////////////////////////////////////////
// saveWordDocument : save generated word document
//
function saveWordDocument() {
  wordApp.ActiveWindow.View.ShowComments = false;
  wordApp.ActiveWindow.View.ShowAll = false;

  wordApp.ActiveWindow.View.ShowRevisionsAndComments = false;
  wordApp.ActiveWindow.View.RevisionsView = 0;  // wdRevisionsViewFinal

  wordDoc.Save();
  wordApp.visible = false;
  wordDoc.Close();
  
  wordDoc = null;
  log('Stored generated document.');
}

/////////////////////////////////////////////////
// disconnectToWordApplication : release Word COM Object
//
function disconnectToWordApplication() {
  wordApp.quit(true);
  log("Release Word COM Object");
  
  if(inGenerating)
    progress(100, 100);   
}

/////////////////////////////////////////////////
// disconnectToStarUMLApplication : Release StarUML COM Object
//
function disconnectToStarUMLApplication() {
  log("Release StarUML COM");
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
// current(): elem   current selected element's path
//
function current() {
  return currentItem;
}

/////////////////////////////////////////////////
// pos(): int   current selected element's position
//
function pos() {
  return currentPos;
}

/////////////////////////////////////////////////
// StarUMLApp(): app   StarUML COM Object
//
function StarUMLApp() {
  return app;
}

/////////////////////////////////////////////////
// MSWord(): wordApp   word COM Object
//
function MSWord() {
  return wordApp;
}
