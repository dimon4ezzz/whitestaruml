unit Symbols;

{******************************************************************************}
{                                                                              }
{                StarUML - The Open Source UML/MDA Platform.                   }
{                                                                              }
{              Copyright (C) 2002-2005 - Plastic Software, Inc.                }
{                                                                              }
{                                                                              }
{ This program is free software; you can redistribute it and/or modify it      }
{ under the terms of the GNU General Public License as published by the Free   }
{ Software Foundation; either version 2 of the License, or (at your option)    }
{ any later version.                                                           }
{                                                                              }
{ This program is distributed in the hope that it will be useful, but WITHOUT  }
{ ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or        }
{ FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for     }
{ more details.                                                                }
{                                                                              }
{ You should have received a copy of the GNU General Public License along with }
{ this program; if not, write to the Free Software Foundation, Inc., 51        }
{ Franklin St, Fifth Floor, Boston, MA 02110-1301 USA                          }
{                                                                              }
{ Linking StarUML statically or dynamically with other modules is making a     }
{ combined work based on StarUML. Thus, the terms and conditions of the GNU    }
{ General Public License cover the whole combination.                          }
{                                                                              }
{ In addition, as a special exception, Plastic Software give you permission to }
{ combine StarUML program with free software programs or libraries that are    }
{ released under the GNU LGPL/Mozilla/Apache/BSD and with code included in the }
{ standard release of ExpressBar, ExpressNavBar, ExpressInspector,             }
{ ExpressPageControl, ProGrammar, NextGrid under the commercial license (or    }
{ modified versions of such code, with unchanged license). You may copy and    }
{ distribute such a system following the terms of the GNU GPL for StarUML and  }
{ the licenses of the other code concerned, provided that you include the      }
{ source code of that other code when and as the GNU GPL requires distribution }
{ of source code. Plastic Software also give you permission to combine StarUML }
{ program with dynamically linking plug-in (or add-in) programs that are       }
{ released under the GPL-incompatible and proprietary license.                 }
{                                                                              }
{ Note that people who make modified versions of StarUML are not obligated to  }
{ grant this special exception for their modified versions; it is their choice }
{ whether to do so. The GNU General Public License gives permission to release }
{ a modified version without this exception; this exception also makes it      }
{ possible to release a modified version which carries forward this exception. }
{******************************************************************************}

interface

const
  PATTERN_REP_FOLDER_NAME = 'Pattern Repository';

  XOD_ELEMENT_PATTERN = 'PATTERN';
  XOD_ELEMENT_PARAMETERS = 'PARAMETERS';
  XOD_ELEMENT_PARAMETER = 'PARAMETER';
  XOD_ELEMENT_DESCRIPTION = 'DESCRIPTION';
  XOD_ELEMENT_DEFAULTVALUE = 'DEFAULTVALUE';
  XOD_ELEMENT_LITERALS = 'LITERALS';
  XOD_ELEMENT_LITERAL = 'LITERAL';
  XOD_ATTRIBUTE_VERSION = 'version';
  XOD_ATTRIBUTE_NAME = 'name';
  XOD_ATTRIBUTE_HELP = 'help';
  XOD_ATTRIBUTE_SCRIPT = 'script';
  XOD_ATTRIBUTE_ID = 'id';
  XOD_ATTRIBUTE_CAPTION = 'caption';
  XOD_ATTRIBUTE_CATEGORY = 'category';
  XOD_ATTRIBUTE_TYPE = 'type';
  XOD_ATTRIBUTE_ELEMENTKIND = 'elementKind';

  JSCRIPT_HEADER = 'var app = new ActiveXObject("WhiteStarUML.WhiteStarUMLApplication");' + #13#10 +
                   'var factory = app.UMLFactory;' + #13#10 +
                   'var metaModel = app.MetaModel;' + #13#10 +
                   'var dgm = app.SelectionManager.ActiveDiagram;' + #13#10 +
                   'var owner = dgm.DiagramOwner;' + #13#10 + #13#10 +
                   'try{' + #13#10 +
                   'app.BeginGroupAction();';
  JSCRIPT_TAIL =    'app.EndGroupAction();' + #13#10 +
                    '} // End of try' + #13#10 + #13#10 +
                   'finally{' + #13#10 +
                   '  app = null;' + #13#10 +
                   '}';
  JSCRIPT_NEW_INTEGER_VAL =
                   'var %s = %s;';
  JSCRIPT_NEW_BOOLEAN_VAL =
                   'var %s = %s;';
  JSCRIPT_NEW_STRING_VAL =
                   'var %s = "%s";';
  JSCRIPT_NEW_ELEM_VAL =
                   'var %s = factory.Create%s(owner);' + #13#10 +
                   '%s.Name = "%s";' + #13#10;
  JSCRIPT_EXIST_ELEM_VAL =
                   'var %s = metaModel.FindInstanceByGuid("%s");';
  JSCRIPT_ELEM_LIST_NULL =
                   'var %s = new Array(0);';
  JSCRIPT_NEW_LIST_VAL =
                   'var %s = new Array(%s);';
  JSCRIPT_EXIST_LIST_ITEM_VAL =
                   '%s[%s] = metaModel.FindInstanceByGuid("%s");';
  JSCRIPT_NEW_LIST_ITEM_VAL =
                   '%s[%s] = factory.Create%s(owner);' + #13#10 +
                   '%s[%s].Name = "%s";' + #13#10;
  JSCRIPT_ADD_MESSAGE = 'app.AddMessageItem(0, "%s", %s);';
  JSCRIPT_ADD_MESSAGE2 = 'app.AddMessageItem(0, "%s", %s[%s]);';

  VALUE_TRUE = 'True';
  VALUE_FALSE = 'False';

implementation

end.
