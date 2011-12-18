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
var templateFilename, outputFilename;
var commentstate, ShowGenerationProcess;
var app, prj;
var excelApp, excelWorkbook, excelSheet;
var inGenerating = false;

var currentItem = null;
var currentPos = 1;

var isLog = false;
var isDebug = false;
var isConsole = true;

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
    
    ShowGenerationProcess = Args.Get('ShowGenerationProcess');
    if (ShowGenerationProcess != null)
      ShowGenerationProcess = ShowGenerationProcess.toLowerCase();
  
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

//main(inputFilename, outputFilename); 
//main(); 

/////////////////////////////////////////////////
// main : starting poing
//
function main() {
  // initProperties();
  
  // 1.create StarUML COM Object
  connectToStarUMLApplication();
  
  // 2.create Word COM Object
  connectToExcelApplication();
  
  progress(20, 100);      
  
  inGenerating = true;
  
  try
  {
    // 3.duplicate excel template document
    cloneExcelDocument();
    
    // 4.open cloned template document and generate document
    openClonedExcelAndGenerateDocument();
  }
  catch (e)
  {
    if(e=="user termination")
      log("Terminated by user request.");
    else
      log("Error : " + e);
    throw e;
  }
  finally
  {
    // 7.release Excel COM Object
    
    if (commentstate != 'true'){ 
      deleteAllComments();
    }
  
    // 6.store generated document
    saveExcelDocument();		
    
    disconnectToExcelApplication();
    
    // 8.release StarUML COM Object
    disconnectToStarUMLApplication();
    if(inGenerating)
    progress(100, 100);
    inGenerating = false;
  }
}

/////////////////////////////////////////////////
// initArguments : initialize variables
//
function initProperties() {
  // 1. template file name
  templateFilename = "C:\\Program Files\\StarUML Software\\DirectMDA\\GenerationUnits\\UseCaseReport\\template.xls";
  
  // 2. output file name
  outputFilename = "C:\\Program Files\\StarUML Software\\DirectMDA\\GenerationUnits\\UseCaseReport\\template1.xls";
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
// connectToExcelApplication : create Excel COM Object
//
function connectToExcelApplication() {
  excelApp = new ActiveXObject("Excel.Application");
  excelApp.visible = ShowGenerationProcess;
  log("Connected to MS EXCEL");
}

/////////////////////////////////////////////////
// cloneExcelDocument : copy excel template document
//
function cloneExcelDocument() {
  try
  {
    excelWorkbook = excelApp.Workbooks.Open(templateFilename);
    //excelWorkbook.ReadOnlyRecommended = false;
//    excelWorkbook.SaveCopyAs(outputFilename);
    
    // xlNormal = -4143 (&HFFFFEFD1)
    excelWorkbook.SaveAs(outputFilename, -4143, "", "", false, false);
    
    
    log("Copied excel template document.");
  }
  finally
  {
    excelWorkbook.Close();
  }
}

/////////////////////////////////////////////////
// openClonedExcelAndGenerateDocument : open cloned template document and generate document
//
function openClonedExcelAndGenerateDocument() {
  // open template document
  if(inGenerating){
    try
    {
      excelWorkbook = excelApp.Workbooks.Open(outputFilename);
      notify("Connected to Workbook.");
      log("Generating...");
      var k = excelWorkbook.Sheets.Count;
      var j = 60 / k;
      for(var i = 1; i <= excelWorkbook.Sheets.Count; i++) {
        notify("Connecting to Excel Sheet...");
        excelSheet = excelWorkbook.Sheets(i);
        excelSheet.Select();
        generateDocument()
        progress(20 + j * k, 100);
      }
    }
    catch(e)
    {
      if (inGenerating)
        log("[ERROR : Error occurs in connecting to Excel Sheet.]");
      throw "user termination";
    }
  }
  else 
    throw "user termination";    
}

/////////////////////////////////////////////////
// generateDocument : 
//
function generateDocument() {
  // 1.get all memos in the template document
  var commentArray = getAllComments(excelSheet);
  
  // 2.invoke handler with all memos as parameter
  traverseTemplate(prj, commentArray, false);
  
  // 3.select most left and top cell
  excelApp.Range("A1").Select;
}

/////////////////////////////////////////////////
// trim
//
function trim(str) {
  return str.replace(/(^\s*)|(\s*$)/g, "");
}

/////////////////////////////////////////////////
// getAllComments
//
function getAllComments(sheet) {
  //    return createArray(sheet.comments);
  notify("Analyzing template document...");
  var result = new Array(sheet.comments.count);
  
  for (var i = 1; i <= sheet.comments.count; i++) {
    result[i-1] = sheet.comments.item(i);
  }
  
  return result;
}

/////////////////////////////////////////////////
// createArray
//
function createArray(collectionArray, startIndex, endIndex) {
  var result = new Array(endIndex - startIndex + 1);
  
  for (var i = startIndex, j = 0; i <= endIndex; i++, j++) {
    result[j] = collectionArray[i];
  }
  
  return result;
}

/////////////////////////////////////////////////
// createSubArray
//
function createSubArray(collection, startIndex, endIndex) {
  var result = new Array();
  
  for (var i = startIndex+1, j = 0; i <= (endIndex+1); i++, j++) {
    result[j] = collection.item(i);
  }
  
  return result;
}

/////////////////////////////////////////////////
// indexOfIn
//
function indexOfIn(collection, obj) {
  for (var i = 1; i < collection.count; i++) {
    if ( (collection.item(i).parent.row == obj.parent.row) &&
      (collection.item(i).parent.column == obj.parent.column)) {
      return i - 1;
    }
  }
  
  return -1;
}

/////////////////////////////////////////////////
// traverseTemplate
//
function traverseTemplate(rootElem, commentArray, isSub) {
  // set current
  currentItem = rootElem;
  //	currentPos = 1;
  notify("Generating contents...");

  for (var i = 0; i < commentArray.length; i++) {
    if (inGenerating) {
      var commandType = getCommandType(commentArray[i].Text());
      if (commandType == "REPEAT") {
        notify("Processing REPEAT command...");
        var j = getMatchComment(commentArray, "REPEAT", "ENDREP", i);
  
        if (j < i)
          break;
  
        selectRange(commentArray[i], commentArray[j], "ENDREPEAT", "ENDREPTR");
  
        var repeatCommentArray = createArray(commentArray, i, j);
        traverseRepeatTemplate(rootElem, repeatCommentArray);
        i = j;
      } else if (commandType == "DISPLAY") {
        notify("Processing DISPLAY command...");
        traverseDisplayTempate(rootElem, commentArray[i]);
      } else if (commandType == "IF") {
        notify("Processing IF command...");
        var j = getMatchComment(commentArray, "IF", "ENDIF", i);
 
        if (j < i)
          break;
    
        selectRange(commentArray[i], commentArray[j], "ENDIF", "ENDIFTR");
        var ifCommentArray = createArray(commentArray, i, j);
        traverseIfTemplate(rootElem, ifCommentArray);
    
        i = j;
      } else if (commandType == "SCRIPT") {
        notify("Processing SCRIPT command...");
        traverseScriptTemplate(rootElem, commentArray[i]);
      } else {
        // do nothing
      }
    } else {
      throw "user termination"; 
    }
  }
}

/////////////////////////////////////////////////
// getCommandType
//
function getCommandType(str) {
	var args = str.split(";");
	return args[0];
}

/////////////////////////////////////////////////
// selectRange
//
function  selectRange(startComment, endComment, mark1, mark2, isParentCopy) {
  var startRow, startCol;
  
  try
  {
    startRow = startComment.Parent.Row;
    startCol = startComment.Parent.Column;
  
    if (isParentCopy)
      startCol = 1;
  }
  catch (ex)
  {
    startRow = endComment.Parent.Row;
    startCol = 1;
  }
  
  var endRow = endComment.Parent.Row;
  var endCol = endComment.Parent.Column;
  
  excelSheet.Range( excelSheet.Cells(startRow, startCol),
  excelSheet.Cells(endRow, endCol).End(-4161)).Select(); // Const xlToRight = -4161 (&HFFFFEFBF)
}

/////////////////////////////////////////////////
// getMatchComment
//
function getMatchComment(commentArray, startStr, endStr, index) {
  for (var i = index+1, c = 1; i < commentArray.length; i++) {
    var commandType = getCommandType(commentArray[i].Text());
  
    if (commandType == startStr) {
      c++;
    } else if (commandType.indexOf(endStr) >= 0) {
      c--;
      if (c == 0) 
        return i;
    }
  }
  return -1;
}

/////////////////////////////////////////////////
// stripEscape
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
// traverseRepeatTemplate
//
function traverseRepeatTemplate(rootElem, commentArray) {
  if(inGenerating) {
    // set current
    currentItem = rootElem;
    currentPos = 0;
  
    // 1.memorize original block
    var startComment = commentArray[0];
    var endComment = commentArray[commentArray.length-1];
  
    // 2.get command argument
    var str = startComment.Text();
    var argStr = stripEscape(str);
    var argStrArray = argStr.split(";");
  
    // 2.1 pathname
    var path = argStrArray[1];
    var isFullpath = false;
    var isRecursive = false;
  
    // 2.1.1 Recursively?
    if (path.substr(0, 3) == "{R}") {
      isRecursive = true;
      path = path.substr(3, path.length-3);
    }
  
    // 2.1.2 is absolute path
    if (path.substr(0, 2) == "::") {
      isFullpath = true;
    }
  
    // 2.2 filter type
    var itemType = argStrArray[2];
  
    // 2.3 Collection name
    var collectionName = argStrArray[3];

    var wholeConds = argStrArray[4];

    var isSubRepeat = argStrArray[5];
  
    // 3.repeat elements for satisfying condition
    // for ( ... ) {
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
      // 3.1 get all elements which are same type as parentElem's type in parentElem's sub elements
      var filtedElems = getAllRecursiveElements(isRecursive, parentElem, itemType);
  
      var count = filtedElems.length;
  
      for (var i = count-1; i >= 0; i--) {
        var item = filtedElems[i];
  
        // set current
        currentItem = item;
        currentPos = i;
  
        // 3.2.1 in case of not existing collectionName
  
        // 3.2.1.1 check item to satisfy condition
        var cond = IsItemTrue(wholeConds);
        // 3.2.1.2 if item satisfy conditoin, process...
        if (cond)
          traverseItemTemplate(item, startComment, endComment, commentArray, "ENDREPEAT", "ENDREPTR", isSubRepeat);
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
          traverseItemTemplate(item, startComment, endComment, commentArray, "ENDREPEAT", "ENDREPTR", isSubRepeat);
      }
    }
  
    // 4.delete original block
    selectRange(startComment, endComment, "ENDREPEAT", "ENDREPTR");
  
    if ((isSubRepeat != "") && (isSubRepeat != null))
      excelApp.selection.Delete(-4162); //Const xlUp = -4162 (&HFFFFEFBE)
    else
      excelApp.selection.EntireRow.Delete();
  }
}

/////////////////////////////////////////////////
// getAllRecursiveElements
//
function getAllRecursiveElements(isRecursive, rootElem, filterType) {
  // 1.get elem'type
  var rootElemPathname = rootElem.pathname;
  
  // 2.get all elements whose type is same as filterType in MetaClass
  var metaClass = app.MetaModel.FindMetaClass(filterType);
  var count = metaClass.getInclusiveInstanceCount();
  var elemArray = new Array();
  
  var rc = rootElemPathname.split("::").length;
  
  for (var i = 0; i < count; i++) {
    var elem = metaClass.getInclusiveInstanceAt(i);
  
    // 3.0 in case of satisfying filterType
    if (elem.IsKindOf(filterType)) {
  
      if (elem.pathname.indexOf(rootElemPathname + "::") == 0) {
  
        // 3.1 for all recursive sub elements
        if (isRecursive)
          // 3.insertion sort by name
          elemArray = insertElementArray(elem, elemArray);
  
        // 3.2 for only child elements
        else {
          // 3.2.1 no. of separator of selected elements == no. of separator of rootElem's pathname + 1
          if (elem.pathname.split("::").length == (rc+1))
            elemArray = insertElementArray(elem, elemArray);
          // 3.2.2 unless, do nothing
          else 
            ; // do nothing
        }
      }
    }
  }
  
  return elemArray;
}

/////////////////////////////////////////////////
// insertElementArray
//
function insertElementArray(elem, arr) {
  var len = arr.length;
  
  // 1.find insertion position
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
  
  // 4.put elem into new array
  newArr[p] = elem;
  
  // 5.append last elements to new array
  if ((len != 0) && p < len)
    for (var i = p; i < len; i++)
      newArr[i+1] = arr[i];
  
  return newArr;
}

/////////////////////////////////////////////////
// IsItemTrue
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
// deleteAllComments :
//
function deleteAllComments() {
  // delete comments in Sheet
  
  log('Deleting all comments...');

  for(var i = 1; i <=excelApp.ActiveWorkBook.Sheets.Count; i++) {
    notify("Deleting comments in "+i+" th Excel Sheet...");
    excelApp.ActiveWorkBook.Sheets.item(i).Select();
    excelApp.Cells.Select();
    excelApp.Selection.ClearComments();
  }
  
  excelApp.ActiveWorkBook.Sheets.item(1).Select();
  excelApp.Range("A1").Select;
}

/////////////////////////////////////////////////
// traverseItemTemplate
//
function traverseItemTemplate(item, startComment, endComment, commentArray, mark1, mark2, isSubRepeat){
  if (inGenerating) {
    // set current
    currentItem = item;
  
    var E;
    var commandType = getCommandType(endComment.Text());
  
    // select from REPEAT to ENDREPEAT
  
    if ((isSubRepeat != "") && (isSubRepeat != null)){
      selectRange(startComment.Previous(), endComment, mark1, mark2, true);
      notify("Transforming model element to docuement.");
    } else {
      selectRange(startComment, endComment, mark1, mark2, false);
      notify("Transforming model element to document.");
    }
  
    // copy and paste selected cells
    excelApp.selection.copy();
  
    // startComment's col and endComment's row+1
    var row, col;
  
    if ((isSubRepeat != "") && (isSubRepeat != null)) {
      row = endComment.Parent.Row+1;
      col = 1;
    } else {
      row = endComment.Parent.Row+1;
      col = startComment.Parent.Column;
    }
  
    // select and insert at copying position 
    var cell = excelSheet.Cells(row, col);
    excelSheet.Range( cell, cell ).Select();
    excelApp.selection.Insert( -4121 ); // Const xlDown = -4121 (&HFFFFEFE7)
  
    // for range at cloned REPEAT+1, cloned ENDREPEAT-1, invoke traverseTemplate
    // current selection is starting position of cloned cells
    // therefore if K is isSubRepeat, K is next memo at current selected position
  
    // var K = (indexOfIn(excelSheet.comments, endComment) + 1) + 1;	// cloned REPEAT+1
    // var L = (K + commentArray.length - 1) - 1 - 1;					// cloned ENDREPEAT-1
  
    var K, L;

    if ((isSubRepeat != "") && (isSubRepeat != null))
      cell = excelSheet.Cells(row, startComment.Parent.Column);
    else
      cell = excelApp.selection;
  
    K = indexOfIn(excelSheet.comments, cell.comment) + 1;	// cloned REPEAT+1
    L = (K + commentArray.length - 1) - 1;					// cloned ENDREPEAT-1
  
    if (K <= L) {
      var subCommentArray = createSubArray(excelSheet.comments, K, L);
      traverseTemplate( item, subCommentArray, true);
    }
  }
}

/////////////////////////////////////////////////
// traverseDisplayTempate
//
function traverseDisplayTempate(elem, comment) {
  var rootElem = elem;
  
  // 1.get command argument
  var str = comment.Text();
  var argStr = stripEscape(str);
  var argStrArray = argStr.split(";");
  
  // 2.1 path
  var path = argStrArray[1];
  var isFullpath = false;
  var isRecursive = false;
  
  // 2.1.1 Recursively?
  if (path.substr(0, 3) == "{R}") {
    isRecursive = true;
    path = path.substr(3, path.length-3);
  }
  
  // 2.1.2 is absolute path?
  if (path.substr(0, 2) == "::")
    isFullpath = true;
  
  // 2.2 attribute name
  var attrExpr = argStrArray[2];
  
  // 2.3 is indexed?
  var indexed = argStrArray[3];
  
  // 3. reconfigure rootElement
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
  
  // 5. insert value
  // 4.2.1 get property vlaue
  var value = null;
  
  if (attrExpr != "") {
    var evalExpr = "value = " + attrExpr
    eval(evalExpr);
  }
  
  // 4.2.2 insert value to cell
  comment.Parent.FormulaR1C1 = value;
}

/////////////////////////////////////////////////
// traverseIfTemplate
//
function traverseIfTemplate(rootElem, ifCommentArray) {
  try
  {
    // set current
    currentItem = rootElem;
    //	currentPos = 0;
    // 1.memorize original block
    var startComment = ifCommentArray[0];
    var endComment = ifCommentArray[ifCommentArray.length-1];
  
    // 2.get command argument
    var str = stripEscape(startComment.Text());
    var p = str.indexOf(";");
    var wholeConds = str.substr(p+1,str.length-(p+2));
  
    // 3.2.1.1 check item to satisfy condition
    var cond = IsItemTrue(wholeConds);
  
    // 3.2.1.2 if item satisfies condition, process ...
    if (cond){
      traverseItemTemplate(rootElem, startComment, endComment, ifCommentArray, "ENDIF", "ENDIFTR");
    }
    // 4.delete original block
    selectRange(startComment, endComment, "ENDIF", "ENDIFTR");
  
    if (endComment.author == "ENDIF")
      excelApp.selection.Delete();
    else if (endComment.author == "ENDIFTR")
      excelApp.selection.Rows.Delete();
  }
  catch(e)
  {
    comment.Parent.FormulaR1C1 = "Error: Error occurs in IF command.";
  }
}

/////////////////////////////////////////////////
// traverseScriptTemplate
//
function traverseScriptTemplate(elem, comment) {
  try
  {
    var rootElem = elem;
  
    // 1.get command argument
    var str = stripEscape(comment.Text());
    var p = str.indexOf(";");
    var scripts = str.substr(p+1,str.length-(p+1));
  
    // set current
    currentItem = rootElem;
  
    // execute script
    eval(scripts);
  }
  catch(e)
  {
    comment.Parent.FormulaR1C1 = "Error: Error occurs in SCRIPT command.";
  }
}

/////////////////////////////////////////////////
// saveExcelDocument : store generated document
//
function saveExcelDocument() {
  excelWorkbook.Save()
  excelApp.visible = false;
  excelWorkbook.Close();
  log('Stored generate document.');
}

/////////////////////////////////////////////////
// disconnectToExcelApplication : release excel COM Object
//
function disconnectToExcelApplication() {
  excelApp.quit();
  log("Released Excel.");
}

/////////////////////////////////////////////////
// disconnectToStarUMLApplication : release StarUML COM Object
//
function disconnectToStarUMLApplication() {
  // to do
  log("Release StarUML.");
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
// current(): elem   current selected path
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
// MSExcel(): excelApp   Excel COM Object
//
function MSExcel() {
  return excelApp;
}
