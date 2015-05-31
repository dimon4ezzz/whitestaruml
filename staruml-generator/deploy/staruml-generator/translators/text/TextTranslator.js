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
var xmtlGrammarFilename, templateFilename, outputFilename, jsFilename;
var app, prj;
var parser;
var scriptStr;
var fileObject;
var is, os;
var dLogger = null;
var inGenerating = false;

var outputStreamStack;
var nameIndex = 0;
var targetPath;
var currentItem = null;
var currentPos = 0;
var currentItemStack;

var lineStack;
var identCount = 0;
var tabCount = 4;

var fileExceptionOccurred;


/////////////////////////////////////////////////////////////////////////////////////////////
// Script initialization through script handler object provided by Documantation Generator

Init()

function Init()
{
  var Shell = new ActiveXObject("WScript.Shell")
  var scriptHandlerContainer = WScript.CreateObject("WhiteStarUML.ScriptHanderContainer")
  if ( scriptHandlerContainer != null)
  {
      var scriptHandler = scriptHandlerContainer.FindScriptHandler("WSGenerator.GeneratorApplication")
      if ( scriptHandler != null)
      {
          WScript.ConnectObject(scriptHandler, "ScriptHandler_")
          SetLogger(scriptHandler.Logger())
          return Execute(scriptHandler.Args())
      }
      else
        Shell.Popup("Getting generator script handler object failed!")
        
  }
  else
    Shell.Popup("Getting script handler container object failed!")
  
  return false // Script connection did not go properly
}

function ScriptHandler_Abort(Code)
{
  Abort()
}

// End of script initialization code
////////////////////////////////////////////////////////////////////////////////////////////////


/////////////////////////////////////////////////
// Execute : 
//
function Execute(Args){
  try
  {
    templateFilename = Args.Get('TemplateFile');
    outputFilename = Args.Get('OutputFile');
    jsFilename = Args.Get('intermediate');
    targetPath = Args.Get('target');
    main();
  } catch(e) {
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
// notify : 
//
function notify(message) {
  if (dLogger != null)
    dLogger.notify(message);
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

//main(); 

/////////////////////////////////////////////////
// main : starting point
//
function main() {
  inGenerating = true;
  
  try
  {
    // initialize variables
    initProperties();
    
    // create WhiteStarUML COM Object
    connectToWhiteStarUMLApplication();
    
    // generate document from template document
    generateDocument();
  } 
  catch (e)
  {
    if(e=="user termination")
    log("Terminated by user request.");
    else
    log("Error : " + e.number + "," + e.description);
    throw e;
  }
  finally
  {
    // release WhiteStarUML COM Object
    disconnectFromWhiteStarUMLApplication();
    inGenerating = false;
  }
}

/////////////////////////////////////////////////
// initProperties : initialize variables
//
function initProperties() {
  fileObject = new ActiveXObject("Scripting.FileSystemObject");
  
  outputStreamStack = new Array();
  lineStack = new Array();
  currentItemStack = new Array();
  
  // initialize JScript String
  scriptStr = "";
  
  fileExceptionOccurred = false;
}

/////////////////////////////////////////////////
// connectToWhiteStarUMLApplication : create WhiteStarUML COM Object
//
function connectToWhiteStarUMLApplication() {
  app = new ActiveXObject("WhiteStarUML.WhiteStarUMLApplication");
  prj = app.GetProject();
  log("Connected to WhiteStarUML.");
}

/////////////////////////////////////////////////
// write : 
//
function write(str) {
  scriptStr += str;
}

/////////////////////////////////////////////////
// writeln : 
//
function writeln(str) {
  for (var i=0; i<identCount; i++)
    scriptStr += '    ';
  scriptStr += str + "\r\n"
}

/////////////////////////////////////////////////
// print : 
//
function print(str) {
  if(inGenerating){
    notify("Writing contents...");
    os.write(str);
  } else{
    throw "user termination"; 
  }    
}

/////////////////////////////////////////////////
// println : 
//
function println(str) {
  notify("Writing contents...");
  os.writeLine(str);
}

/////////////////////////////////////////////////
// generateDocument : 
//
function generateDocument() {
  if (inGenerating) {
    notify("Analyzing template file...");
    log("Starting document generation");

    // initialize variables
    is = fileObject.OpenTextFile(templateFilename, 1, 0, 0);
  
    writeln("currentItem = prj;");
    writeln("currentItemStack.push(prj);");
  
    lineStack.push(is.Line);    
  
    // make JScript string by preprocessor
    while (!is.AtEndOfStream) {
      var s = is.ReadLine();
      parseString(s);
    }
    progress(40, 100); 
  
    // store preprocessed JScript
    os = fileObject.CreateTextFile(jsFilename, 1, 1);
    os.write(scriptStr);
    os.close();
  
    // evaluate preprocessed JScript
    os = fileObject.CreateTextFile(outputFilename, 1, 1);

    try{
      eval(scriptStr);
    }
    catch (e)
    {
      throw e;      
    }
  
    os.close();
  }
  progress(100, 100); 
}

/////////////////////////////////////////////////
// parseString : 
//
function parseString(str) {
  if (inGenerating) {
    // 0.if str is starting with "<@=", parseExpr
    // 1.if str is starting with "<@", parseMacroExpr
    // 2.else parseTextExpr
    
    if (str.indexOf("<@REPEAT") == 0) {
      notify('Analyzing REPEAT command...');
      parseRepeatExpr(str);
    }
    else if (str.indexOf("<@ENDREPEAT") == 0) {
      notify('Analyzing ENDREPEAT command...');
      parseEndRepeatExpr(str);
    }
    else if (str.indexOf("<@IF") == 0) {
      notify('Analyzing IF command...');
      parseIfExpr(str);
    }
    else if (str.indexOf("<@ENDIF") == 0) {
      notify('Analyzing ENDIF command...');
      parseEndIfExpr(str);
    }
    else if (str.indexOf("<@DISPLAY") == 0) {
      notify('Analyzing DISPLAY command...');
      parseDisplayExpr(str);
    }
    else if (str.indexOf("<@SCRIPT") == 0) {
      notify('Analyzing SCRIPT command...');
      parseScriptExpr(str);
    }
    else if (str.indexOf("<@=") == 0) {
      notify('Analyzing template...');
      parseExpr(str);
    }
    else if (str.indexOf("<@") == 0) { 
      notify('Analyzing template...');
      parseMacroExpr(str);
    }
    else {
      notify('Analyzing template...');
      parseTextExpr(str);
    }
  }
}

/////////////////////////////////////////////////
// parseRepeatExpr : 
//
function parseRepeatExpr(str) {
  if (inGenerating) {
    var lineNo = is.Line;
    lineStack.push(lineNo-1);
    
    var endPos = str.indexOf("@>");
    
    while ((endPos == -1) && (!is.AtEndOfStream)) {
      str += is.ReadLine();
      endPos = str.indexOf("@>");
    }
    
    nameIndex++;
    var argArr = GetArgumentArray(str);
    
    writeln("");
    writeln("// REPEAT");
    writeln("currentItemStack.push(currentItem);");
//writeln("print('repeat push '+currentItem.Name+'\\r\\n');");
    
    if (argArr.length == 1) {
      var arr = argArr[0];
      
      writeln("try {");
      writeln("    eval('var elemArr"+nameIndex+" = "+AddEscape(arr)+"');");
      writeln("}catch (ex) {");
      writeln("    log('"+GetErrorPos()+":<@REPEAT@> "+AddEscape(arr)+" Error occurs in path expression.');");
      writeln("    throw ex");
      writeln("}");
      
      writeln("try {");
      writeln("    for (var i"+nameIndex+" = 0, c"+nameIndex+" = elemArr"+nameIndex+".length; i"+nameIndex+" < c"+nameIndex+"; i"+nameIndex+"++ ) {");
      writeln("        currentItem = elemArr"+nameIndex+"[i"+nameIndex+"];");
    } else if (argArr.length == 4) {
      var isRecursive = GetRecursive(argArr[0]);
      var path = trim(GetPath(argArr[0]));
      var rootElem = GetPathElemString(path);
      var filterType = trim(argArr[1]);
      var collectionName = trim(argArr[2]);
      var wholeCond = AddEscape(trim(argArr[3]));
      
      writeln("");
//      writeln("// REPEAT");
//      writeln("currentItemStack.push(currentItem);");
//writeln("print('push '+currentItem.Name+'\\r\\n');");
      
      writeln("try {");
      writeln("    eval('var rootElem = "+AddEscape(rootElem)+"');");
      writeln("}catch (ex) {");
      writeln("    log('"+GetErrorPos()+":<@REPEAT@> Error exists in "+path+" path expression.');");
      writeln("    throw ex");
      writeln("}");
      
      writeln("try {");
      writeln("    eval('"+AddEscape("var elemArr"+nameIndex+" = getAllElements("+isRecursive+", rootElem, '"+filterType+"', '"+collectionName+"', '"+wholeCond+"')")+"');");
      writeln("}catch (ex) {");
      writeln("    log('"+GetErrorPos()+":<@REPEAT@> Error exists in path, type, collection name.');");
      writeln("    throw ex");
      writeln("}");
      
      writeln("try {");
      writeln("    for (var i"+nameIndex+" = 0, c"+nameIndex+" = elemArr"+nameIndex+".length; i"+nameIndex+" < c"+nameIndex+"; i"+nameIndex+"++ ) {");
      writeln("        currentItem = elemArr"+nameIndex+"[i"+nameIndex+"];");
    }
    else {
      log(GetErrorPos()+":"+str+" argument count is neither 1 nor 4.");
      throw str+" argument count is neither 1 nor 4.";
    }
    
    identCount++;
    identCount++;
    
    parseIgnoreWhitespace(str.substr(endPos+2));
  }    
}

/////////////////////////////////////////////////
// parseIgnoreWhitespace(str)
function parseIgnoreWhitespace(str) {
  for (var i=0; i<str.length; i++)
    if (str.charAt(i) == '\n') {
      if (i == str.length-1)
        str = "";
      else
        str = str.substr(i+1);
      break;
    }
  parseString(str);
}

/////////////////////////////////////////////////
// parseEndRepeatExpr : 
//
function parseEndRepeatExpr(str) {
  if (inGenerating) {
    var lineNo = lineStack.pop();
    
    identCount--;
    identCount--;
    
    writeln("");
    writeln("    }");
    writeln("} catch (ex) {");
    writeln("    log('"+GetErrorPos()+":<@REPEAT@> Error exists in command.');");
    writeln("    throw ex;");
    writeln("}");
    writeln("currentItem = currentItemStack.pop();");
//writeln("print('endrepeat pop '+currentItem.Name+'\\r\\n');");
    
    writeln("// END OF REPEAT");
    
    parseIgnoreWhitespace(str.substr(str.indexOf("@>")+2));
  }
}

/////////////////////////////////////////////////
// parseIfExpr : 
//
function parseIfExpr(str) {
  if (inGenerating) {
    var lineNo = is.Line;
    lineStack.push(lineNo-1);
    
    var endPos = str.indexOf("@>");
    
    while ((endPos == -1) && (!is.AtEndOfStream)) {
      str += is.ReadLine();
      endPos = str.indexOf("@>");
    }
    
    var argArr = GetArgumentArray(str);
    var wholeCond = trim(argArr[0]);
    
    writeln("");
    writeln("// IF");
    writeln("currentItemStack.push(currentItem);");
//writeln("print('if push '+currentItem.Name+'\\r\\n');");
    
    writeln("try {");
    writeln("    eval('var value = "+AddEscape(wholeCond)+"');");
    writeln("} catch (ex) {");
    writeln("    log('"+GetErrorPos()+":<@IF@> Error exists in condition.');");
    writeln("    throw ex;");
    writeln("}");
    
    writeln("try {");
    writeln("    if (value) {");
    
    identCount++;
    identCount++;
    
    parseIgnoreWhitespace(str.substr(endPos+2));
  }    
}

/////////////////////////////////////////////////
// parseEndIfExpr : 
//
function parseEndIfExpr(str) {
  if (inGenerating) {
    var lineNo = lineStack.pop();
    
    identCount--;
    identCount--;
    
    writeln("");
    writeln("    }");
    writeln("} catch (ex) {");
    writeln("    log('"+GetErrorPos()+":<@IF@> Error occurs in command.');");
    writeln("    throw ex;");
    writeln("}");
    writeln("currentItem = currentItemStack.pop();");
//writeln("print('endif pop '+currentItem.Name+'\\r\\n');");
    
    writeln("// END OF IF");
    
    parseIgnoreWhitespace(str.substr(str.indexOf("@>")+2));
  }
}

/////////////////////////////////////////////////
// parseDisplayExpr : 
//
function parseDisplayExpr(str) {
  if (inGenerating) {
    var lineNo = is.Line;
    lineStack.push(lineNo-1);
    
    var endPos = str.indexOf("@>");
    
    while ((endPos == -1) && (!is.AtEndOfStream)) {
      str += is.ReadLine();
      endPos = str.indexOf("@>");
    }
    
    var argArr = GetArgumentArray(str);
    var path = trim(GetPath(argArr[0]));
    var rootElem = GetPathElemString(path);
    var expr = trim(argArr[1]);
    
    writeln("");
    writeln("// DISPLAY");
    writeln("currentItemStack.push(currentItem);");
//writeln("print('display push '+currentItem.Name+'\\r\\n');");
    
    writeln("try {");
    writeln("    eval('currentItem = "+AddEscape(rootElem)+"');");
    writeln("} catch (ex) {");
    writeln("    log('"+GetErrorPos()+":<@DISPLAY@> Error exists in path expression.');");
    writeln("    throw ex;");
    writeln("}");
    
    writeln("var value;");
    writeln("try {");
    writeln("    eval('value = "+AddEscape(expr)+"');");
    writeln("} catch (ex) {");
    writeln("    log('"+GetErrorPos()+":<@DISPLAY@> Error exists in arguments.');");
    writeln("    throw ex;");
    writeln("}");
    
    writeln("try {");
    writeln("   print(value);");
    writeln("} catch (ex) {");
    writeln("    log('"+GetErrorPos()+":<@DISPLAY@> Error exists in command.');");
    writeln("    throw ex;");
    writeln("}");
    writeln("currentItem = currentItemStack.pop();");
//writeln("print('display pop '+currentItem.Name+'\\r\\n');");
    
    writeln("// END OF DISPLAY");
    
    parseString(str.substr(endPos+2));
  }    
}

/////////////////////////////////////////////////
// parseScriptExpr : 
//
function parseScriptExpr(str) {
  if (inGenerating) {
    var lineNo = is.Line;
    lineStack.push(lineNo-1);
    
    var endPos = str.indexOf("@>");
    
    while ((endPos == -1) && (!is.AtEndOfStream)) {
      str += is.ReadLine() + "\n";
      endPos = str.indexOf("@>");
    }
    
    var sp = 8;
    var ep = str.indexOf("@>");
    var statements = str.substr(sp, ep-sp);
    
    writeln("");
    writeln("// SCRIPT");
    writeln("currentItemStack.push(currentItem);");
//writeln("print('script push '+currentItem.Name+'\\r\\n');");
    
    writeln(statements);
    writeln("currentItem = currentItemStack.pop();");
//writeln("print('scirpt pop '+currentItem.Name+'\\r\\n');");
    
    writeln("// END OF SCRIPT");
    
    parseIgnoreWhitespace(str.substr(str.indexOf("@>")+2));
//    parseString(str.substr(endPos+2));
    parseIgnoreWhitespace(str.substr(endPos+2));
  }    
}

/////////////////////////////////////////////////
// parseExpr : 
//
function parseExpr(str) {
  var endPos = str.indexOf("@>");
  write("print("+trim(str.substr(3, endPos-3))+");");
  parseString(str.substr(endPos+2));
}

/////////////////////////////////////////////////
// parseMacroExpr : 
//
function parseMacroExpr(str) {
  var endPos = str.indexOf("@>");
  
  while ((endPos == -1) && (!is.AtEndOfStream)) {
    str += is.ReadLine();
    endPos = str.indexOf("@>");
  }
  
  write(trim(str.substr(2, endPos-2)));
  parseString(str.substr(endPos+2));
}

/////////////////////////////////////////////////
// parseTextExpr : 
//
function parseTextExpr(str) {
  if (inGenerating) {
    var endPos = str.indexOf("<@");
    
    while ((endPos == -1) && (!is.AtEndOfStream)) {
      str += is.ReadLine() + "\n";
      endPos = str.indexOf("<@");
    }
    
    var text = "";
    if (endPos == -1)
      text = str;
    else if (endPos > -1)
      text = str.substr(0, endPos);
    
    var s = AddEscape(text);
    
    writeln("");
    writeln("// TEXT");
    writeln("print(\"" + s + "\");");
    
    if (endPos != -1)
      parseString(str.substr(endPos));
  }
}

/////////////////////////////////////////////////
// GetErrorPos : 
//
function GetErrorPos() {
  var lineNo = lineStack[lineStack.length-1];
  return fileObject.GetFileName(templateFilename)+"("+lineNo+")";
}

/////////////////////////////////////////////////
// GetArgumentArray : 
//
function GetArgumentArray(str) {
  try
  {
    var sp = str.indexOf(" ");
    var ep = str.indexOf("@>");
    var argStr = trim(str.substr(sp, ep-sp));
    var result = argStr.split(";");
    return result;
  }
  catch (ex)
  {
    log(GetErrorPos()+": Error exists in "+argStr+" argument.');");
    throw ex;
  }
}

/////////////////////////////////////////////////
// GetRecursive : 
//
function GetRecursive(path) {
  try {
    var result = false;
    if (path.substr(0, 3) == "{R}") {
      result = true;
    }
    return result;
  }
  catch (ex)
  {
    log(GetErrorPos()+": Error exists in Recursive setting of "+path+" path expression.');");
    throw ex;
  }
}

/////////////////////////////////////////////////
// GetPath : 
//
function GetPath(path) {
  try {
    path = trim(path);
    var result = path;
    if (path.substr(0, 3) == "{R}") {
      result = path.substr(3, path.length-3);
    }
    return result;
  }
  catch (ex)
  {
    log(GetErrorPos()+": Error exists in "+path+" expression.');");
    throw ex;
  }
}

/////////////////////////////////////////////////
// GetPathElemString : 
//
function GetPathElemString(path) {
  try {
    path = trim(path);
    var result = "";
    
    if (path != "") {
      if (path == "::")
        result = "prj";
      else if (path.indexOf("::")==0)
        result = "app.findBypathname('"+path+"')";
      else
        result = "currentItem.findByRelativePathname('"+path+"')";
    } else
      result = "currentItem";
    return result;
  } catch (ex) {
    log(GetErrorPos()+": Error exists in "+path+" expression.');");
    throw ex;
  }
}

/////////////////////////////////////////////////
// AddEscape : 
//
function AddEscape(str) {
  var result = "";
  for (var i=0; i<str.length; i++) {
    var c = str.charAt(i);
    if (c == "\"")
      result += "\\\"";
    else if (c == "\'")
      result += "\\\'";
    else if (c == "\\")
      result += "\\\\";
    else if (c == "\n")
      result += "\\n";
    else if (c == "\r")
      result += "\\r";
    else if (c == "\t")
      result += "\\t";
    else
      result += c;
  }
  
  return result;
}

/////////////////////////////////////////////////
// replaceEscape : 
//
function replaceEscape(str) {
  var result = "";
  
  for (var p=0; p<str.length; p++) {
    if (str.charAt(p) == '\\')
      result = result + "\\\\";
    else if (str.charAt(p) == '\"')
      result = result + "\\\"";
    else
      result = result + str.charAt(p);
  }
  
  return result;
}

/////////////////////////////////////////////////
// trim : 
//
function trim(str) {
  return str.replace(/(^\s*)|(\s*$)/g, "");
}

/////////////////////////////////////////////////
// disconnectfromWhiteStarUMLApplication : release WhiteStarUML COM Object
//
function disconnectFromWhiteStarUMLApplication() {
  // to do
  log("Release WhiteStarUML.");
}

/////////////////////////////////////////////////
// getAllElements : 
//
function getAllElements(isRecursive, rootElem, filterType, collectionName, wholeConds){
  var result = new Array();
  
  if ((filterType != "") && (collectionName != "")) {
    // 1.get all elements whose type is same as parentElem's type in parentElem's sub elements
    var filtedElems = getAllRecursiveElements(isRecursive, rootElem, filterType);
    var count = filtedElems.length;
  
    for (var i = 0; i < count; i++) {
      var item = filtedElems[i];
      var colCount = item.MOF_GetCollectionCount(collectionName);
  
      for (var j = 0; j < colCount; j++) {
        currentItem = item.MOF_GetCollectionItem(collectionName, j);
        currentPos = j;
  
        if (IsItemTrue(wholeConds))
          result.push(currentItem);
      }
    }
  } else if (filterType != "") {
    // 2.get all elements whose type is same as filterType in parentElem's sub elements
    var filtedElems = getAllRecursiveElements(isRecursive, rootElem, filterType);
    var count = filtedElems.length;
  
    for (var i = 0; i < count; i++) {
      currentItem = filtedElems[i];
      currentPos = i;
  
      if (IsItemTrue(wholeConds))
        result.push(currentItem);
    }
  } else if (collectionName != "") {
  // 3.repeat elements in Collection
    var count = rootElem.MOF_GetCollectionCount(collectionName);
  
    for (var i = 0; i < count; i++) {
      currentItem = rootElem.MOF_GetCollectionItem(collectionName, i);
      currentPos = i;
  
      if (IsItemTrue(wholeConds))
        result.push(currentItem);
    }
  }
  
  return result;
}

/////////////////////////////////////////////////
// getAllRecursiveElements : 
//
function getAllRecursiveElements(isDeep, rootElem, filterType) {
  // 1.get elem's type
  var rootElemPathname = rootElem.pathname;
  
  // 2.get all elements whose type is filterType in MetaClass
  var metaClass = app.MetaModel.FindMetaClass(filterType);
  var count = metaClass.getInclusiveInstanceCount();
  
  var elemArray = new Array();
  var rc = rootElemPathname.split("::").length;
  
  for (var i = 0; i < count; i++) {
    var elem = metaClass.getInclusiveInstanceAt(i);
  
    // 3.0 in case of filterType
    if (elem.IsKindOf(filterType)) {
      if (elem.pathname.indexOf(rootElemPathname + "::") == 0) {
        // 3.1 in case of recursive option
        if (isDeep) {
          // 3.insertion sort by name
          elemArray = insertElementArray(elem, elemArray);
        }
  
        // 3.2 in case of not recursive option
        else {
          // 3.2.1 if no. of separator of pathname of selected element == no. of separator of pathname of rootElem + 1
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
// IsItemTrue : 
//
function IsItemTrue(wholeConds) {
  var cond = true;
  
  try
  {
    if ((wholeConds != "") && (wholeConds != null)) {
      eval("var cond = "+ wholeConds);
      return cond;
    } else {
      return true;
    }
  }
  catch (ex)
  {
    log(GetErrorPos()+": Error exists in "+wholeConds+" condition argument.");
    throw ex;
  }
}

/////////////////////////////////////////////////
// insertElementArray : 
//
function insertElementArray(elem, arr) {
  var len = arr.length;
  
  var p = 0;
  for (p = 0; p < len; p++) {
    if (elem.pathname < arr[p].pathname) {
      break;
    }
  }
  
  var newArr = new Array();
  
  if (p != 0)
  for (var i = 0; i < p ; i++)
  newArr[i] = arr[i];
  
  newArr[p] = elem;
  
  if ((len != 0) && p < len)
    for (var i = p; i < len; i++) {
      newArr[i+1] = arr[i];
    }
  
  return newArr;
}

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
// StarUMLApp(): app 
//
function StarUMLApp() {
  return app;
}

/////////////////////////////////////////////////
// StarUMLProject(): prj   
//
function StarUMLProject() {
  return prj;
}

/////////////////////////////////////////////////
// current(): elem   
//
function current() {
  return currentItem;
}

/////////////////////////////////////////////////
// setCurrent(): elem   
//
function setCurrent(newCurrentItem) {
  currentItemStack.push(newCurrentItem);
  currentItem = newCurrentItem;
}

/////////////////////////////////////////////////
// unsetCurrent(): elem   
//
function unsetCurrent() {
  currentItem = currentItemStack.pop();
}

/////////////////////////////////////////////////
// pos(): int   
//
function pos() {
  return currentPos;
}

/////////////////////////////////////////////////
// createFile :
//
function createFile(path) {
  notify('Creating file '+ path + '...');
  return fileObject.CreateTextFile(path, 1, 1);
}

/////////////////////////////////////////////////
// deleteFile :
//
function deleteFile(path) {
  notify('Deleting file '+ path + '...');
  fileObject.DeleteFile(path, false);
}

/////////////////////////////////////////////////
// createFolder :
//
function createFolder(path) {
  notify('Creating folder '+ path + '...');
  return fileObject.CreateFolder(path);
}

/////////////////////////////////////////////////
// deleteFolder :
//
function deleteFolder(path) {
  notify('Deleting folder '+ path + '...');
  fileObject.deleteFolder(path);
}

/////////////////////////////////////////////////
// fileExists :
//
function fileExists(path) {
  return fileObject.FileExists(path);
}

/////////////////////////////////////////////////
// fileExists :
//
function folderExists(path) {
  return fileObject.FolderExists(path);
}

/////////////////////////////////////////////////
// fileBegin :
//
function fileBegin(path) {
  fileExceptionOccurred = false;
  
  try
  {
    var cs;
    if (fileExists(path)) {
      cs = fileObject.openTextFile(path, 2);
    } else {
      var ep = path.lastIndexOf("\\");
      if (ep > -1) {
        var folder = path.substr(0, ep);
        if (!folderExists(folder))
            createFolder(folder);
      }
  
      cs = createFile(path);
    }
  
    outputStreamStack.push(os);
    os = cs;
  }
  catch (ex)
  {
    fileExceptionOccurred = true;
  }
}

/////////////////////////////////////////////////
// fileEnd :
//
function fileEnd() {
  if (!fileExceptionOccurred)  {
    os.close();
    os = outputStreamStack.pop();
  } else {
    // ...?
  }
}

/////////////////////////////////////////////////
// getTarget() :
//
function getTarget() {
  return targetPath;
}

