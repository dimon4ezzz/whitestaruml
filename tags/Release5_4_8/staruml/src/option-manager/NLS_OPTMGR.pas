unit NLS_OPTMGR;

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
  // OptionMgrAux
  C_ERR_NOT_INITIALIZED = 'Option manager is not initialized.';

  // OptionNodes
  C_TXT_UNSPECIFIED = '(Unspecified)';

  // OptionRows
  C_TXT_EDIT_VALUE = 'Edit text';
  C_TXT_TEXT = '(Text)';
  C_TXT_COLOR_CUSTOM = 'Custom colors..';

  // PVariants
  C_TXT_COLOR_BLACK = 'Black';
  C_TXT_COLOR_MAROON = 'Maroon';
  C_TXT_COLOR_GREEN = 'Green';
  C_TXT_COLOR_OLIVE = 'Olive';
  C_TXT_COLOR_NAVY = 'Navy';
  C_TXT_COLOR_PURPLE = 'Purple';
  C_TXT_COLOR_TEAL = 'Teal';
  C_TXT_COLOR_GRAY = 'Gray';
  C_TXT_COLOR_SILVER = 'Silver';
  C_TXT_COLOR_RED = 'Red';
  C_TXT_COLOR_LIME = 'Lime';
  C_TXT_COLOR_YELLOW = 'Yellow';
  C_TXT_COLOR_BLUE = 'Blue';
  C_TXT_COLOR_FUCHSIA = 'Fuchsia';
  C_TXT_COLOR_AQUA = 'Aqua';
  C_TXT_COLOR_WHITE = 'White';
  C_TXT_COLOR_MONEYGREEN = 'Moneygreen';
  C_TXT_COLOR_SKYBLUE = 'Skyblue';
  C_TXT_COLOR_CREAM = 'Cream';
  C_TXT_COLOR_MEDGRAY = 'Medgray';

var
  ERR_NOT_INITIALIZED: string;
  TXT_UNSPECIFIED: string;
  TXT_EDIT_VALUE: string;
  TXT_TEXT: string;
  TXT_COLOR_CUSTOM: string;
  TXT_COLOR_BLACK: string;
  TXT_COLOR_MAROON: string;
  TXT_COLOR_GREEN: string;
  TXT_COLOR_OLIVE: string;
  TXT_COLOR_NAVY: string;
  TXT_COLOR_PURPLE: string;
  TXT_COLOR_TEAL: string;
  TXT_COLOR_GRAY: string;
  TXT_COLOR_SILVER: string;
  TXT_COLOR_RED: string;
  TXT_COLOR_LIME: string;
  TXT_COLOR_YELLOW: string;
  TXT_COLOR_BLUE: string;
  TXT_COLOR_FUCHSIA: string;
  TXT_COLOR_AQUA: string;
  TXT_COLOR_WHITE: string;
  TXT_COLOR_MONEYGREEN: string;
  TXT_COLOR_SKYBLUE: string;
  TXT_COLOR_CREAM: string;
  TXT_COLOR_MEDGRAY: string;

implementation

uses
  OptionMgrAux, NLS;

const
  NLS_STR_SECTION = 'Strings';

initialization
  // Translation.
  //NLSManager.SetExportMode;
  NLSManager.SetImportMode;
  // Translate Strings
  NLSManager.SetFile(GetDllPath + '\OPTMGR.LNG');
  NLSManager.TranslateString(NLS_STR_SECTION, 'ERR_NOT_INITIALIZED', ERR_NOT_INITIALIZED, C_ERR_NOT_INITIALIZED);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_UNSPECIFIED ', TXT_UNSPECIFIED , C_TXT_UNSPECIFIED );
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_EDIT_VALUE', TXT_EDIT_VALUE, C_TXT_EDIT_VALUE);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_TEXT', TXT_TEXT, C_TXT_TEXT);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_COLOR_CUSTOM', TXT_COLOR_CUSTOM, C_TXT_COLOR_CUSTOM);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_COLOR_BLACK', TXT_COLOR_BLACK, C_TXT_COLOR_BLACK);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_COLOR_MAROON', TXT_COLOR_MAROON, C_TXT_COLOR_MAROON);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_COLOR_GREEN', TXT_COLOR_GREEN, C_TXT_COLOR_GREEN);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_COLOR_OLIVE', TXT_COLOR_OLIVE, C_TXT_COLOR_OLIVE);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_COLOR_NAVY', TXT_COLOR_NAVY, C_TXT_COLOR_NAVY);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_COLOR_PURPLE', TXT_COLOR_PURPLE, C_TXT_COLOR_PURPLE);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_COLOR_TEAL', TXT_COLOR_TEAL, C_TXT_COLOR_TEAL);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_COLOR_GRAY', TXT_COLOR_GRAY, C_TXT_COLOR_GRAY);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_COLOR_SILVER', TXT_COLOR_SILVER, C_TXT_COLOR_SILVER);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_COLOR_RED', TXT_COLOR_RED, C_TXT_COLOR_RED);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_COLOR_LIME', TXT_COLOR_LIME, C_TXT_COLOR_LIME);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_COLOR_YELLOW', TXT_COLOR_YELLOW, C_TXT_COLOR_YELLOW);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_COLOR_BLUE', TXT_COLOR_BLUE, C_TXT_COLOR_BLUE);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_COLOR_FUCHSIA', TXT_COLOR_FUCHSIA, C_TXT_COLOR_FUCHSIA);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_COLOR_AQUA', TXT_COLOR_AQUA, C_TXT_COLOR_AQUA);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_COLOR_WHITE', TXT_COLOR_WHITE, C_TXT_COLOR_WHITE);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_COLOR_MONEYGREEN', TXT_COLOR_MONEYGREEN, C_TXT_COLOR_MONEYGREEN);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_COLOR_SKYBLUE', TXT_COLOR_SKYBLUE, C_TXT_COLOR_SKYBLUE);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_COLOR_CREAM', TXT_COLOR_CREAM, C_TXT_COLOR_CREAM);
  NLSManager.TranslateString(NLS_STR_SECTION, 'TXT_COLOR_MEDGRAY', TXT_COLOR_MEDGRAY, C_TXT_COLOR_MEDGRAY);
end.
