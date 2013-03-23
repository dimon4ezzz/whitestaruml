unit NXMgr;

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

// interface declaration

interface

uses
  Graphics, Core, SysUtils, GraphicClasses, IniFiles, Variants;

type
  { class declarations }

  PNXManager = class;
  PNXExpr = class;
  PNXSymbolTable = class;

  // PNXManager
  PNXManager = class
  private
    FGraphicList: THashedStringList;
    FFilename: String;
  public
    constructor Create;
    destructor Destroy; override;
    function ReadExpr(FilePath: String): PNXExpr;
    procedure DrawExpr(Canvas: PCanvas; View: PView; Expr: PNXExpr);

    function ExistGraphic(Key: String): Boolean;
    procedure AddGraphic(Key: String; Value: TGraphic);
    function GetGraphic(Key: String): TGraphic;
  end;

  // PNXExpr
  PNXExpr = class
  protected
    FPos: Integer;
    FPrimitiveValue: Variant; // for value type
    FObjectValue: TObject; // for reference type
    FType: Boolean;
  public
    constructor Create(Position: Integer); virtual;
    class function NewValue(Position: Integer; Value: Variant): PNXExpr; // for value type
    class function NewRef(Position: Integer; Value: TObject): PNXExpr; // for value type

    procedure Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable); virtual;
    function IsValueType: Boolean;
    procedure SetValue(Value: Variant);
    procedure SetReference(Value: TObject);
    procedure SetValueType(Value: Boolean);    
    function GetValue: Variant;
    function GetReference: TObject;

    property Position: Integer read FPos;
  end;

  // PNXException
  PNXException = class(Exception)
  end;

  // PNXSymbolTable
  PNXSymbolTable = class(TObject)
  private
    FList: THashedStringList;
  public
    Constructor Create;
    Destructor Destroy; override;
    function Exist(Key: String): Boolean;
    procedure Add(Key: String; Value: PNXExpr);
    procedure Remove(Key: String);
    function GetValue(Key: String): PNXExpr;
    procedure SetValue(Key: String; Value: PNXExpr);
  end;

var
  NXManager: PNXManager;

// implementation declaration

implementation

uses
 (* System, *)
  Types,
  Classes,
  StrUtils,
  Math,
  XMLDoc,
  XMLIntf,
  Forms,
  PGMR101Lib_TLB,
{  StarUMLApp,}
  LogMgr,
  ExtCore,
  ViewCore;

const
  NOT_EXISTS = 0;

const
  EMF_FILE = '.emf';
  WMF_FILE = '.wmf';
  BMP_FILE = '.bmp';

procedure ERaise(Condition: Boolean; LineNo: Integer; Message: String); forward;
function SimilarType(V1, V2: Variant): Boolean; forward;

type
  PNXGroupExpr = class;

  // Controller Classes ........................................................

  // PNXReader
  PNXReader = class
  private
    Pgmr: TPgmr;
    FErrorLine: Integer;
    FErrorLinePos: Integer;
    FErrorNumChars: Integer;
    FErrorDescription: String;
    FFilepath: String;

    function FindChild(Node: Integer; OperName: String): Integer;
    function FindChildAt(Node: Integer; At: Integer): Integer;
    function ChildCount(Node: Integer): Integer;
    function NodeName(Node: Integer): String;
    function NodeValue(Node: Integer): String;
    function OperName(Node: Integer): String;
    function ExprNodeValue(Node: Integer): String;
    function StripQuote(S: String): String;
    function GetPos(Node: Integer): Integer;

    function TraverseNode(Node: Integer): PNXExpr;
    function TraverseNotationNode(Node: Integer): PNXExpr;
    function TraverseSequenceNode(Node: Integer): PNXExpr;

    function TraverseIntNode(Node: Integer): PNXExpr;
    function TraverseFloatNode(Node: Integer): PNXExpr;
    function TraverseStringNode(Node: Integer): PNXExpr;
    function TraverseBooleanNode(Node: Integer): PNXExpr;
    function TraverseNilNode(Node: Integer): PNXExpr;
    function TraverseGetNode(Node: Integer): PNXExpr;

    function TraverseSetNode(Node: Integer): PNXExpr;
    function TraverseIfNode(Node: Integer): PNXExpr;
    function TraverseForNode(Node: Integer): PNXExpr;

    function TraverseListNode(Node: Integer): PNXExpr;
    function TraverseAppendNode(Node: Integer): PNXExpr;
    function TraverseItemAtNode(Node: Integer): PNXExpr;
    function TraverseItemCountNode(Node: Integer): PNXExpr;
    function TraverseTokenizeNode(Node: Integer): PNXExpr;

    function TraverseOperandNodes(OpExpr: PNXGroupExpr; Node: Integer): PNXExpr;
    function TraverseAddNode(Node: Integer): PNXExpr;
    function TraverseSubtractNode(Node: Integer): PNXExpr;
    function TraverseMultiplyNode(Node: Integer): PNXExpr;
    function TraverseDivideNode(Node: Integer): PNXExpr;
    function TraverseAndNode(Node: Integer): PNXExpr;
    function TraverseOrNode(Node: Integer): PNXExpr;
    function TraverseConcatNode(Node: Integer): PNXExpr;
    function TraverseSinNode(Node: Integer): PNXExpr;
    function TraverseCosNode(Node: Integer): PNXExpr;
    function TraverseTanNode(Node: Integer): PNXExpr;
    function TraverseTruncNode(Node: Integer): PNXExpr;
    function TraverseRoundNode(Node: Integer): PNXExpr;
    function TraverseTrimNode(Node: Integer): PNXExpr;
    function TraverseLengthNode(Node: Integer): PNXExpr;
    function TraverseTextHeightNode(Node: Integer): PNXExpr;
    function TraverseTextWidthNode(Node: Integer): PNXExpr;
    function TraverseNotNode(Node: Integer): PNXExpr;
    function TraverseEQNode(Node: Integer): PNXExpr;
    function TraverseNEQNode(Node: Integer): PNXExpr;
    function TraverseGTNode(Node: Integer): PNXExpr;
    function TraverseGENode(Node: Integer): PNXExpr;
    function TraverseLTNode(Node: Integer): PNXExpr;
    function TraverseLENode(Node: Integer): PNXExpr;

    function TraverseMOFAttrNode(Node: Integer): PNXExpr;
    function TraverseMOFSetAttrNode(Node: Integer): PNXExpr;
    function TraverseMOFRefNode(Node: Integer): PNXExpr;
    function TraverseMOFColAtNode(Node: Integer): PNXExpr;
    function TraverseMOFColCountNode(Node: Integer): PNXExpr;

    function TraverseConstraintValNode(Node: Integer): PNXExpr;

    function TraverseTagValNode(Node: Integer): PNXExpr;
    function TraverseTagRefNode(Node: Integer): PNXExpr;
    function TraverseTagRefAtNode(Node: Integer): PNXExpr;
    function TraverseTagRefCountNode(Node: Integer): PNXExpr;

    function TraverseSetPenStyleNode(Node: Integer): PNXExpr;
    function TraverseSetPenColorNode(Node: Integer): PNXExpr;
    function TraverseSetBrushStyleNode(Node: Integer): PNXExpr;
    function TraverseSetBrushColorNode(Node: Integer): PNXExpr;
    function TraverseSetFontFaceNode(Node: Integer): PNXExpr;
    function TraverseSetFontSizeNode(Node: Integer): PNXExpr;
    function TraverseSetFontColorNode(Node: Integer): PNXExpr;
    function TraverseSetFontStyleNode(Node: Integer): PNXExpr;
    function TraverseSetDefaultStyleNode(Node: Integer): PNXExpr;

    function TraversePointNode(Node: Integer): PNXExpr;
    function TraversePtAtXNode(Node: Integer): PNXExpr;
    function TraversePtAtYNode(Node: Integer): PNXExpr;
    function TraversePtCountNode(Node: Integer): PNXExpr;

    function TraverseMoveToNode(Node: Integer): PNXExpr;
    function TraverseLineToNode(Node: Integer): PNXExpr;
    function TraverseTextOutNode(Node: Integer): PNXExpr;
    function TraverseTextBoundNode(Node: Integer): PNXExpr;
    function TraverseLineNode(Node: Integer): PNXExpr;
    function TraverseRectNode(Node: Integer): PNXExpr;
    function TraverseFillRectNode(Node: Integer): PNXExpr;
    function TraverseEllipseNode(Node: Integer): PNXExpr;
    function TraverseRoundRectNode(Node: Integer): PNXExpr;
    function TraverseTextRectNode(Node: Integer): PNXExpr;
    function TraverseArcNode(Node: Integer): PNXExpr;
    function TraversePieNode(Node: Integer): PNXExpr;

    function TraverseDrawEdgeNode(Node: Integer): PNXExpr;
    function TraverseDrawObjectNode(Node: Integer): PNXExpr;
    function TraverseArrangeObjectNode(Node: Integer): PNXExpr;

    function TraversePolylineNode(Node: Integer): PNXExpr;
    function TraversePolygonNode(Node: Integer): PNXExpr;
    function TraversePolyBezierNode(Node: Integer): PNXExpr;

    function TraverseDrawBitmapNode(Node: Integer): PNXExpr;

  public
    function Read(FilePath: String): PNXExpr;
  end;

  // PNXEvaluator
  PNXEvaluator = class
  public
    procedure Evaluate(Canvas: PCanvas; View: PView; Expr: PNXExpr);
  end;

  // Base Expression Classes ...................................................

  // PNXGroupExpr
  PNXGroupExpr = class(PNXExpr)
  private
    FExprList: TList;
    function GetExprs(Index: Integer): PNXExpr;
    function GetExprCount: Integer;
  protected
  public
    constructor Create(Position: Integer); override;
    destructor Destroy; override;
    procedure Add(Expr: PNXExpr);
    procedure Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable); override;
    property Exprs[Index: Integer]: PNXExpr read GetExprs;
    property Count: Integer read GetExprCount;
  end;

  // PNXNotationExpr
  PNXNotationExpr = class(PNXGroupExpr)
  private
    FFilename: String;
  public
    constructor Create(Position: Integer; Filepath: String);
    procedure Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable); override;
    property Filename: String read FFilename write FFilename;
  end;

  // N-ary Expression Classes ..................................................

  // PNXAddExpr
  PNXAddExpr = class(PNXGroupExpr)
  public
    procedure Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable); override;
  end;

  // PNXSubtractExpr
  PNXSubtractExpr = class(PNXGroupExpr)
  public
    procedure Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable); override;
  end;

  // PNXMultiplyExpr
  PNXMultiplyExpr = class(PNXGroupExpr)
  public
    procedure Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable); override;
  end;

  // PNXDivideExpr
  PNXDivideExpr = class(PNXGroupExpr)
  public
    procedure Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable); override;
  end;

  // PNXAndExpr
  PNXAndExpr = class(PNXGroupExpr)
  public
    procedure Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable); override;
  end;

  // PNXOrExpr
  PNXOrExpr = class(PNXGroupExpr)
  public
    procedure Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable); override;
  end;

  // PNXConcatExpr
  PNXConcatExpr = class(PNXGroupExpr)
  public
    procedure Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable); override;
  end;

  // Unary Expression Classes ..................................................

  // PNXSinExpr
  PNXSinExpr = class(PNXGroupExpr)
  public
    procedure Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable); override;
  end;

  // PNXCosExpr
  PNXCosExpr = class(PNXGroupExpr)
  public
    procedure Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable); override;
  end;

  // PNXTanExpr
  PNXTanExpr = class(PNXGroupExpr)
  public
    procedure Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable); override;
  end;

  // PNXTruncExpr
  PNXTruncExpr = class(PNXGroupExpr)
  public
    procedure Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable); override;
  end;

  // PNXRoundExpr
  PNXRoundExpr = class(PNXGroupExpr)
  public
    procedure Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable); override;
  end;

  // PNXTrimExpr
  PNXTrimExpr = class(PNXGroupExpr)
  public
    procedure Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable); override;
  end;

  // PNXLengthExpr
  PNXLengthExpr = class(PNXGroupExpr)
  public
    procedure Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable); override;
  end;

  // PNXTokenizeExpr
  PNXTokenizeExpr = class(PNXGroupExpr)
  public
    procedure Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable); override;
  end;

  // PNXTextHeightExpr
  PNXTextHeightExpr = class(PNXGroupExpr)
  public
    procedure Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable); override;
  end;

  // PNXTextWidthExpr
  PNXTextWidthExpr = class(PNXGroupExpr)
  public
    procedure Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable); override;
  end;

  // PNXNotExpr
  PNXNotExpr = class(PNXGroupExpr)
  public
    procedure Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable); override;
  end;

  // Binary Expression Classes .................................................

  // PNXEQExpr
  PNXEQExpr = class(PNXGroupExpr)
  public
    procedure Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable); override;
  end;

  // PNXNEQExpr
  PNXNEQExpr = class(PNXGroupExpr)
  public
    procedure Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable); override;
  end;

  // PNXGTExpr
  PNXGTExpr = class(PNXGroupExpr)
  public
    procedure Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable); override;
  end;

  // PNXGEExpr
  PNXGEExpr = class(PNXGroupExpr)
  public
    procedure Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable); override;
  end;

  // PNXLTExpr
  PNXLTExpr = class(PNXGroupExpr)
  public
    procedure Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable); override;
  end;

  // PNXLEExpr
  PNXLEExpr = class(PNXGroupExpr)
  public
    procedure Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable); override;
  end;

  // MOF Expression Classes ....................................................

  // PNXMOFAttrExpr
  PNXMOFAttrExpr = class(PNXGroupExpr)
  public
    procedure Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable); override;
  end;

  // PNXMOFSetAttrExpr
  PNXMOFSetAttrExpr = class(PNXGroupExpr)
  public
    procedure Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable); override;
  end;

  // PNXMOFRefExpr
  PNXMOFRefExpr = class(PNXGroupExpr)
  public
    procedure Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable); override;
  end;

  // PNXMOFColAtExpr
  PNXMOFColAtExpr = class(PNXGroupExpr)
  public
    procedure Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable); override;
  end;

  // PNXMOFColCountExpr
  PNXMOFColCountExpr = class(PNXGroupExpr)
  public
    procedure Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable); override;
  end;

  // Tag Expression Classes ....................................................

  // PNXConstraintValExpr
  PNXConstraintValExpr = class(PNXGroupExpr)
  public
    procedure Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable); override;
  end;

  // PNXTagValExpr
  PNXTagValExpr = class(PNXGroupExpr)
  public
    procedure Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable); override;
  end;

  // PNXTagRefExpr
  PNXTagRefExpr = class(PNXGroupExpr)
  public
    procedure Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable); override;
  end;

  // PNXTagRefAtExpr
  PNXTagRefAtExpr = class(PNXGroupExpr)
  public
    procedure Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable); override;
  end;

  // PNXTagRefCountExpr
  PNXTagRefCountExpr = class(PNXGroupExpr)
  public
    procedure Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable); override;
  end;

  // Syntax Expression Classes .................................................

  // PNXSetExpr
  PNXSetExpr = class(PNXGroupExpr)
  public
    procedure Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable); override;
  end;

  // PNXGetExpr
  PNXGetExpr = class(PNXGroupExpr)
  public
    procedure Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable); override;
  end;

  // PNXIfExpr
  PNXIfExpr = class(PNXGroupExpr)
  public
    procedure Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable); override;
  end;

  // PNXForExpr
  PNXForExpr = class(PNXGroupExpr)
  public
    procedure Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable); override;
  end;

  // List Expression Classes ...................................................

  // PNXListExpr
  PNXListExpr = class(PNXGroupExpr)
  protected
    FEvaluated: Boolean;
  public
    constructor Create(Position: Integer); override;
    procedure Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable); override;
  end;

  // PNXAppendExpr
  PNXAppendExpr = class(PNXGroupExpr)
  public
    procedure Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable); override;
  end;

  // PNXItemAtExpr
  PNXItemAtExpr = class(PNXGroupExpr)
  public
    procedure Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable); override;
  end;

  // PNXItemCountExpr
  PNXItemCountExpr = class(PNXGroupExpr)
  public
    procedure Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable); override;
  end;

  // Graphic Expression Classes ................................................

  // PNXSetPenColorExpr
  PNXSetPenColorExpr = class(PNXGroupExpr)
  public
    procedure Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable); override;
  end;

  // PNXSetPenStyleExpr
  PNXSetPenStyleExpr = class(PNXGroupExpr)
  public
    procedure Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable); override;
  end;

  // PNXSetBrushColorExpr
  PNXSetBrushColorExpr = class(PNXGroupExpr)
  public
    procedure Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable); override;
  end;

  // PNXSetBrushStyleExpr
  PNXSetBrushStyleExpr = class(PNXGroupExpr)
  public
    procedure Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable); override;
  end;

  // PNXSetFontFaceExpr
  PNXSetFontFaceExpr = class(PNXGroupExpr)
  public
    procedure Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable); override;
  end;

  // PNXSetFontColorExpr
  PNXSetFontColorExpr = class(PNXGroupExpr)
  public
    procedure Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable); override;
  end;

  // PNXSetFontStyleExpr
  PNXSetFontStyleExpr = class(PNXGroupExpr)
  public
    procedure Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable); override;
  end;

  // PNXSetFontSizeExpr
  PNXSetFontSizeExpr = class(PNXGroupExpr)
  public
    procedure Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable); override;
  end;

  // PNXSetDefaultStyleExpr
  PNXSetDefaultStyleExpr = class(PNXGroupExpr)
  public
    procedure Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable); override;
  end;


  // PNXPointExpr
  PNXPointExpr = class(PNXGroupExpr)
  public
    procedure Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable); override;
  end;

  // PNXMoveToExpr
  PNXMoveToExpr = class(PNXGroupExpr)
  public
    procedure Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable); override;
  end;

  // PNXLineToExpr
  PNXLineToExpr = class(PNXGroupExpr)
  public
    procedure Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable); override;
  end;

  // PNXTextOutExpr
  PNXTextOutExpr = class(PNXGroupExpr)
  public
    procedure Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable); override;
  end;

  // PNXTextBoundExpr
  PNXTextBoundExpr = class(PNXGroupExpr)
  public
    procedure Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable); override;
  end;

  // PNXDrawBitmapExpr
  PNXDrawBitmapExpr = class(PNXGroupExpr)
  private
    FGraphic: TGraphic;
    FFilepath: String;
    FStretch: Boolean;
  public
    constructor Create(Position: Integer; Filepath: String);
    procedure Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable); override;
  end;

  // PNXLineExpr
  PNXLineExpr = class(PNXGroupExpr)
  public
    procedure Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable); override;
  end;

  // PNXRectExpr
  PNXRectExpr = class(PNXGroupExpr)
  public
    procedure Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable); override;
  end;

  // PNXFillRectExpr
  PNXFillRectExpr = class(PNXGroupExpr)
  public
    procedure Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable); override;
  end;

  // PNXEllipseExpr
  PNXEllipseExpr = class(PNXGroupExpr)
  public
    procedure Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable); override;
  end;

  // PNXRoundRectExpr
  PNXRoundRectExpr = class(PNXGroupExpr)
  public
    procedure Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable); override;
  end;

  // PNXTextRectExpr
  PNXTextRectExpr = class(PNXGroupExpr)
  public
    procedure Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable); override;
  end;

  // PNXArcExpr
  PNXArcExpr = class(PNXGroupExpr)
  public
    procedure Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable); override;
  end;

  // PNXPieExpr
  PNXPieExpr = class(PNXGroupExpr)
  public
    procedure Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable); override;
  end;

  // PNXPtAtX
  PNXPtAtXExpr = class(PNXGroupExpr)
  public
    procedure Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable); override;
  end;

  // PNXPtAtY
  PNXPtAtYExpr = class(PNXGroupExpr)
  public
    procedure Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable); override;
  end;

  // PNXPtCount
  PNXPtCountExpr = class(PNXGroupExpr)
  public
    procedure Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable); override;
  end;

  // PNXDrawEdge
  PNXDrawEdgeExpr = class(PNXGroupExpr)
  public
    procedure Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable); override;
  end;

  // PNXDrawObjectExpr
  PNXDrawObjectExpr = class(PNXGroupExpr)
  public
    procedure Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable); override;
  end;

  // PNXArrangeObjectExpr
  PNXArrangeObjectExpr = class(PNXGroupExpr)
  public
    procedure Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable); override;
  end;

  // PNXPolylineExpr
  PNXPolylineExpr = class(PNXGroupExpr)
  public
    procedure Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable); override;
  end;

  // PNXPolygonExpr
  PNXPolygonExpr = class(PNXGroupExpr)
  public
    procedure Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable); override;
  end;

  // PNXPolyBezierExpr
  PNXPolyBezierExpr = class(PNXGroupExpr)
  public
    procedure Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable); override;
  end;

////////////////////////////////////////////////////////////////////////////////
// implementation definition

{ PNXManager }

constructor PNXManager.Create;
begin
  inherited;
  FGraphicList := THashedStringList.Create;
end;

destructor PNXManager.Destroy;
var
  I: Integer;
begin
  for I := 0 to FGraphicList.Count-1 do
    FGraphicList.Objects[I].Free;
  FGraphicList.Free;
  inherited;
end;

function PNXManager.ReadExpr(FilePath: String): PNXExpr;
var
  Reader: PNXReader;
  Expr: PNXNotationExpr;
begin
  try
    Result := nil;
    Reader := PNXReader.Create;
    Expr := Reader.Read(FilePath) as PNXNotationExpr;
    if Expr <> nil then
      Expr.Filename := ExtractFilename(Filepath);
    Result := Expr;
    Reader.Free;
    Reader := nil;
  except
    LogManager.Log('Loading is failed: ' + ExtractFilename(Filepath));
    if Expr <> nil then Expr.Free;
  end;
  if Reader <> nil then Reader.Free;
  inherited;
end;

procedure PNXManager.DrawExpr(Canvas: PCanvas; View: PView; Expr: PNXExpr);
var
  Evaluator: PNXEvaluator;
begin
  try
    FFilename := (Expr as PNXNotationExpr).Filename;
    Evaluator := PNXEvaluator.Create;
    Evaluator.Evaluate(Canvas, View, Expr);
    Evaluator.Free;
    Evaluator := nil;
  except
    LogManager.Log('Drawing is failed: ' + (Expr as PNXNotationExpr).FFilename);
  end;
  if Evaluator <> nil then Evaluator.Free;
end;

procedure PNXManager.AddGraphic(Key: String; Value: TGraphic);
begin
  Key := LowerCase(Key);
  FGraphicList.AddObject(Key, Value);
end;

function PNXManager.ExistGraphic(Key: String): Boolean;
begin
  Key := LowerCase(Key);
  Result := (FGraphicList.IndexOf(Key) <> -1);
end;

function PNXManager.GetGraphic(Key: String): TGraphic;
var
  Index: Integer;
begin
  Key := LowerCase(Key);
  Index := FGraphicList.IndexOf(Key);
  ERaise(Index >= 0, 0, Key+' image does not exist.');

  Result := FGraphicList.Objects[Index] as TGraphic;
end;

{ PNXEvaluator }

procedure PNXEvaluator.Evaluate(Canvas: PCanvas; View: PView; Expr: PNXExpr);
var
  SymbolTable: PNXSymbolTable;
begin
  // create SymbolTable and store current view status in SymbolTable
  SymbolTable := PNXSymbolTable.Create;
  SymbolTable.Add('view', PNXExpr.NewRef(Expr.Position, View));
  SymbolTable.Add('model',PNXExpr.NewRef(Expr.Position, View.Model));

  if View is PNodeView then
    with View as PNodeView do begin
      // Left, Top, Right, Bottom
      SymbolTable.Add('left', PNXExpr.NewValue(Expr.Position, Left));
      SymbolTable.Add('top', PNXExpr.NewValue(Expr.Position, Top));
      SymbolTable.Add('right', PNXExpr.NewValue(Expr.Position, Right));
      SymbolTable.Add('bottom', PNXExpr.NewValue(Expr.Position, Bottom));
      SymbolTable.Add('width', PNXExpr.NewValue(Expr.Position, Width));
      SymbolTable.Add('height', PNXExpr.NewValue(Expr.Position, Height));
      SymbolTable.Add('minwidth', PNXExpr.NewValue(Expr.Position, MinWidth));
      SymbolTable.Add('minheight', PNXExpr.NewValue(Expr.Position, MinHeight));
    end
  else if View is PEdgeView then
    with View as PEdgeView do begin
      // Points
      SymbolTable.Add('points', PNXExpr.NewRef(Expr.Position, Points));
      SymbolTable.Add('head', PNXExpr.NewRef(Expr.Position, Head));
      SymbolTable.Add('tail', PNXExpr.NewRef(Expr.Position, Tail));
    end;

  // start evaluation
  (Expr as PNXNotationExpr).Evaluate(Canvas, SymbolTable);

  // restore current view status from SymbolTable
  if View is PNodeView then
    with View as PNodeView do begin
      // Left, Top, Right, Bottom
      Left := SymbolTable.GetValue('left').GetValue;
      Top := SymbolTable.GetValue('top').GetValue;
      Right := SymbolTable.GetValue('right').GetValue;
      Bottom := SymbolTable.GetValue('bottom').GetValue;
      Width := SymbolTable.GetValue('width').GetValue;
      Height := SymbolTable.GetValue('height').GetValue;
      MinWidth := SymbolTable.GetValue('minwidth').GetValue;
      MinHeight := SymbolTable.GetValue('minheight').GetValue;
    end
  else if View is PEdgeView then begin
    // none
  end;

  SymbolTable.Free;
end;

{ PNXSymbolTable }

constructor PNXSymbolTable.Create;
begin
  inherited;

  FList := THashedStringList.Create;
end;

destructor PNXSymbolTable.Destroy;
var
  I: Integer;
  S: String;
begin
  for I := 0 to FList.Count-1 do begin
    S := FList.Objects[I].ClassName;
    FList.Objects[I].Free;
  end;

  FList.Free;
  inherited;
end;

function PNXSymbolTable.GetValue(Key: String): PNXExpr;
var
  Index: Integer;
begin
  Key := LowerCase(Key);
  Index := FList.IndexOf(Key);
  ERaise(Index >= 0, 0, Key+' variable does not exist.');

  Result := FList.Objects[Index] as PNXExpr;
end;

function PNXSymbolTable.Exist(Key: String): Boolean;
begin
  Key := LowerCase(Key);
  Result := (FList.IndexOf(Key) <> -1);
end;

procedure PNXSymbolTable.Add(Key: String; Value: PNXExpr);
begin
  Key := LowerCase(Key);
  FList.AddObject(Key, Value);
end;

procedure PNXSymbolTable.SetValue(Key: String; Value: PNXExpr);
var Index: Integer;
begin
  Key := LowerCase(Key);
  if Exist(Key) then begin
    Index := FList.IndexOf(Key);
    PNXExpr(FList.Objects[Index]).Free;
    FList.Objects[Index] := Value;
  end
  else
    Add(Key, Value);
end;

procedure PNXSymbolTable.Remove(Key: String);
var Index: Integer;
begin
  Key := LowerCase(Key);
  if Exist(Key) then begin
    Index := FList.IndexOf(Key);
    PNXExpr(FList.Objects[Index]).Free;
    FList.Delete(Index);
  end;
end;

{ ERaise }

procedure ERaise(Condition: Boolean; LineNo: Integer; Message: String);
begin
  if not Condition then begin
    LogManager.Log(NXManager.FFilename + '(' + IntToStr(LineNo) + '): ' +  Message);
    raise PNXException.Create(Message);
  end;
end;

{ SimilarType }

function SimilarType(V1, V2: Variant): Boolean;
var
  R: Boolean;
  VT1, VT2: TVarType;
begin
  VT1 := VarType(V1);
  VT2 := VarType(V2);
  R := (VT1 = VT2);

  if not R then begin
    case VT1 of
      varSmallint: R := true;
      varInteger: R := true;
      varSingle: R := true;
      varDouble: R := true;
      varShortInt: R := true;
      varByte: R := true;
      varWord: R := true;
      varLongWord: R := true;
      varInt64: R := true;
      varString: R := true;
      varUString: R := true;
      varBoolean : R := true;
      else  R := false;
    end;

    if R then begin
      case VT2 of
        varSmallint: R := true;
        varInteger: R := true;
        varSingle: R := true;
        varDouble: R := true;
        varShortInt: R := true;
        varByte: R := true;
        varWord: R := true;
        varLongWord: R := true;
        varInt64: R := true;
        varString: R := true;
        varUString: R := true;
        varBoolean : R := true;
        else  R := false;
      end;
    end;
  end;
  Result := R;
end;

{ PNXExpr }

constructor PNXExpr.Create(Position: Integer);
begin
  FPos := Position;
  FPrimitiveValue := Unassigned;
  FObjectValue := nil;
  FType := true;
end;

procedure PNXExpr.Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable);
begin
  // do nothing ...
end;

class function PNXExpr.NewRef(Position: Integer; Value: TObject): PNXExpr;
begin
  Result := PNXExpr.Create(Position);
  Result.SetReference(Value);
  Result.SetValueType(false);
end;

class function PNXExpr.NewValue(Position: Integer; Value: Variant): PNXExpr;
begin
  Result := PNXExpr.Create(Position);
  Result.SetValue(Value);
  Result.SetValueType(true);
end;

function PNXExpr.GetReference: TObject;
begin
  Result := FObjectValue;
end;

function PNXExpr.GetValue: Variant;
begin
  if IsValueType then
    Result := FPrimitiveValue
  else
    Result := '['+ClassName+'@'+IntToHex(Integer(Self),2)+']';
end;

procedure PNXExpr.SetReference(Value: TObject);
begin
  FObjectValue := Value;
  SetValueType(false);
end;

procedure PNXExpr.SetValue(Value: Variant);
begin
  FPrimitiveValue :=  Value;
  SetValueType(true);
end;

function PNXExpr.IsValueType: Boolean;
begin
  Result := FType;
end;

procedure PNXExpr.SetValueType(Value: Boolean);
begin
  FType := Value;
end;

{ PNXNotationExpr }

constructor PNXNotationExpr.Create(Position: Integer; Filepath: String);
begin
  inherited Create(Position);
  FFilename := ExtractFilename(Filepath);
end;

procedure PNXNotationExpr.Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable);
begin
  inherited;
end;

{ PNXGroupExpr }

constructor PNXGroupExpr.Create(Position: Integer);
begin
  inherited Create(Position);
  FExprList := TList.Create;
end;

destructor PNXGroupExpr.Destroy;
var I: Integer;
begin
  for I := 0 to FExprList.Count-1 do
    PNXExpr(FExprList.Items[I]).Free;
  FExprList.Free;
  inherited;
end;

procedure PNXGroupExpr.Add(Expr: PNXExpr);
begin
  FExprList.Add(Expr);
end;

function PNXGroupExpr.GetExprCount: Integer;
begin
  Result := FExprList.Count;
end;

function PNXGroupExpr.GetExprs(Index: Integer): PNXExpr;
begin
  Result := PNXExpr(FExprList.Items[Index]);
end;

procedure PNXGroupExpr.Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable);
var
  I, C: Integer;
  Expr: PNXExpr;
begin
  try
    inherited;
    C := FExprList.Count;
    for I := 0 to C-1 do
      PNXExpr(FExprList.Items[I]).Evaluate(Canvas, SymbolTable);

    if (C-1) >= 0 then begin
      Expr := PNXExpr(FExprList.Items[C-1]);
      if Expr.IsValueType then
        SetValue(Expr.GetValue)
      else
        SetReference(Expr.GetReference);
    end;
  except
    ERaise(false, FPos, 'Error exists in the arguments.');
  end;
end;

{ PNXListExpr }

constructor PNXListExpr.Create(Position: Integer);
begin
  inherited Create(Position);
  FEvaluated := false;
end;

procedure PNXListExpr.Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable);
var
  I, C: Integer;
  Expr: PNXExpr;
begin
  if not FEvaluated then begin
    try
  //    inherited;
      C := FExprList.Count;
      for I := 0 to C-1 do
        PNXExpr(FExprList.Items[I]).Evaluate(Canvas, SymbolTable);
    except
      ERaise(false, FPos, 'Error exists in the arguments.');
    end;

    FType := false;

    FEValuated := true;
  end;
end;

{ PNXAppendExpr }

procedure PNXAppendExpr.Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable);
var
  I, C: Integer;
  Expr: PNXListExpr;
  ValExpr: PNXExpr;
begin
  try
    inherited;

    Expr := PNXListExpr.Create(Self.Position);

    if Exprs[0] is PNXListExpr then begin
      C := (Exprs[0] as PNXListExpr).Count;
      for I := 0 to C-1 do begin
        ValExpr := (Exprs[0] as PNXListExpr).Exprs[I];
        if ValExpr.IsValueType then
          Expr.Add(PNXExpr.NewValue(ValExpr.Position, ValExpr.GetValue))
        else
          Expr.Add(PNXExpr.NewRef(ValExpr.Position, ValExpr.GetReference))
      end
    end
    else if Exprs[0] is PNXGetExpr then begin
      C := (Exprs[0].GetReference as PNXListExpr).Count;
      for I := 0 to C-1 do begin
        ValExpr := (Exprs[0].GetReference as PNXListExpr).Exprs[I];
        if ValExpr.IsValueType then
          Expr.Add(PNXExpr.NewValue(ValExpr.Position, ValExpr.GetValue))
        else
          Expr.Add(PNXExpr.NewRef(ValExpr.Position, ValExpr.GetReference))
      end
    end
    else begin // if Exprs[0] is PNExpr then
      ValExpr := Exprs[0];
      if ValExpr.IsValueType then
        Expr.Add(PNXExpr.NewValue(ValExpr.Position, ValExpr.GetValue))
      else
        Expr.Add(PNXExpr.NewRef(ValExpr.Position, ValExpr.GetReference));
    end;

    if Exprs[1] is PNXListExpr then begin
      C := (Exprs[1] as PNXListExpr).Count;
      for I := 0 to C-1 do begin
        ValExpr := (Exprs[1] as PNXListExpr).Exprs[I];
        if ValExpr.IsValueType then
          Expr.Add(PNXExpr.NewValue(ValExpr.Position, ValExpr.GetValue))
        else
          Expr.Add(PNXExpr.NewRef(ValExpr.Position, ValExpr.GetReference))
      end
    end
    else if Exprs[1] is PNXGetExpr then begin
      C := (Exprs[1].GetReference as PNXListExpr).Count;
      for I := 0 to C-1 do begin
        ValExpr := (Exprs[1].GetReference as PNXListExpr).Exprs[I];
        if ValExpr.IsValueType then
          Expr.Add(PNXExpr.NewValue(ValExpr.Position, ValExpr.GetValue))
        else
          Expr.Add(PNXExpr.NewRef(ValExpr.Position, ValExpr.GetReference))
      end
    end
    else begin // if Exprs[1] is PNExpr then
      ValExpr := Exprs[1];
      if ValExpr.IsValueType then
        Expr.Add(PNXExpr.NewValue(ValExpr.Position, ValExpr.GetValue))
      else
        Expr.Add(PNXExpr.NewRef(ValExpr.Position, ValExpr.GetReference));
    end;

    SetReference(Expr);
  except
    ERaise(false, FPos, 'Error exists in Append expression.');
  end;
end;

{ PNXItemAtExpr }

procedure PNXItemAtExpr.Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable);
var
  Index: Integer;
  Expr: PNXExpr;
  S: String;
  I, C: Integer;
begin
  try
//    inherited;
    C := FExprList.Count;
    for I := 0 to C-1 do
      PNXExpr(FExprList.Items[I]).Evaluate(Canvas, SymbolTable);

    // (itemAt list index)
    Index := Exprs[1].GetValue;

    S := Exprs[0].ClassName;      // test
    Exprs[0].Evaluate(Canvas, SymbolTable);

    if Exprs[0] is PNXListExpr then
      Expr := (Exprs[0] as PNXListExpr).Exprs[Index]
    else begin //if Exprs[0] is PNXItemAtExpr then
      Expr := PNXListExpr(Exprs[0].GetReference).Exprs[Index];
//    if Exprs[0] is PNXGetExpr then
//      Expr := PNXListExpr(Exprs[0].GetReference).Exprs[Index]
      S := Expr.ClassName;
    end;

    Expr.Evaluate(Canvas, SymbolTable);

    if Expr.IsValueType then
      SetValue(Expr.GetValue)
    else
      SetReference(Expr.GetReference);
  except
    ERaise(false, FPos, 'Error exists in ItemAt expression.');
  end;
end;

{ PNXItemCountExpr }

procedure PNXItemCountExpr.Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable);
var Expr: PNXListExpr;
S: String;
begin
  try
    inherited;
    if Exprs[0] is PNXGetExpr then begin
      Expr := PNXListExpr(Exprs[0].GetReference);
      SetValue(Expr.Count);
    end
    else if Exprs[0] is PNXListExpr then begin
      Expr := Exprs[0] as PNXListExpr;
      SetValue(Expr.Count);
    end;

  except
    ERaise(false, FPos, 'Error exists in ItemCount expression.');
  end;
end;

{ PNXTokenizeExpr }

procedure PNXTokenizeExpr.Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable);
var
  SourceStr: String;
  Delimiter: String;
  ResultList: PNXListExpr;
  P, DL: Integer;
begin
  try
    inherited;
    SourceStr := Exprs[0].GetValue;
    Delimiter := Exprs[1].GetValue;
    ResultLIst := PNXListExpr.Create(Position);
    DL := Length(Delimiter);
    while Length(SourceStr) > 0 do begin
      P := Pos(Delimiter, SourceStr);
      if P = 0 then begin
        ResultList.Add(PNXExpr.NewValue(Position, SourceStr));
        break;
      end;
      ResultList.Add(PNXExpr.NewValue(Position, Copy(SourceStr, 1, P-1)));
      SourceStr := Copy(SourceStr, P+DL, Length(SourceStr)-P-DL+1);
    end;

    SetReference(ResultList);
  except
    ERaise(false, FPos, 'Error exists in Tokenize expression.');
  end;
end;

{ PNXMOFAttrExpr }

procedure PNXMOFAttrExpr.Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable);
begin
  try
    inherited;
    SetValue((Exprs[0].GetReference as PElement).MOF_GetAttribute(Exprs[1].GetValue));
  except
    ERaise(false, FPos, 'Error exists in MOFAttr expression.');
  end;
end;

{ PNXMOFSetAttrExpr }

procedure PNXMOFSetAttrExpr.Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable);
begin
  try
    inherited;
    (Exprs[0].GetReference as PElement).MOF_SetAttribute(Exprs[1].GetValue, VarToStr(Exprs[2].GetValue));
  except
    ERaise(false, FPos, 'Error exists in MOFSetAttr expression.');
  end;
end;

{ PNXMOFRefExpr }

procedure PNXMOFRefExpr.Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable);
begin
  try
    inherited;
    SetReference((Exprs[0].GetReference as PElement).MOF_GetReference(Exprs[1].GetValue));
  except
    ERaise(false, FPos, 'Error exists in MOFRef expression.');
  end;
end;

{ PNXMOFColAtExpr }

procedure PNXMOFColAtExpr.Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable);
begin
  try
    inherited;
    SetReference((Exprs[0].GetReference as PElement).MOF_GetCollectionItem(Exprs[1].GetValue, Exprs[2].GetValue));
  except
    ERaise(false, FPos, 'Error exists in MOFColAt expression.');
  end;
end;

{ PNXMOFColCountExpr }

procedure PNXMOFColCountExpr.Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable);
begin
  try
    inherited;
    SetValue((Exprs[0].GetReference as PElement).MOF_GetCollectionCount(Exprs[1].GetValue));
  except
    ERaise(false, FPos, 'Error exists in MOFColCount expression.');
  end;
end;

{ PNXConstraintValExpr }

procedure PNXConstraintValExpr.Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable);
var
  I, C: Integer;
  Constraint: PConstraint;
begin
  try
    inherited;
    with (Exprs[0].GetReference as PExtensibleModel) do begin
      Constraint := nil;
      C := MOF_GetCollectionCount('Constraints');
      for I := 0 to C-1 do
        if (Constraints[I].Name = Exprs[1].GetValue) then begin
          Constraint := Constraints[I];
          break;
        end;
    end;

    if (Constraint <> nil) and (Constraint.Body <> '') then
      SetValue(Constraint.Body)
    else
      SetValue('');
  except
    ERaise(false, FPos, 'Error exists in ConstraintVal expression.');
  end;
end;

{ PNXTagValExpr }

procedure PNXTagValExpr.Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable);
var TaggedValue: PTaggedValue;
begin
  // (tagVal obj tagset id)      ClassA   'UMLStandard' 'myset' 'a'
  try
    inherited;
    TaggedValue := (Exprs[0].GetReference as PExtensibleModel)
                    .FindTaggedValue(
                      Exprs[1].GetValue,
                      Exprs[2].GetValue,
                      Exprs[3].GetValue);
    if (TaggedValue <> nil) and (TaggedValue.DataValue <> '') then
      SetValue(TaggedValue.DataValue)
    else
      SetValue(
                 ExtensionManager
                  .FindTagDefinition(
                    Exprs[1].GetValue,
                    Exprs[2].GetValue,
                    Exprs[3].GetValue
                  ).DefaultValue
      );
  except
    ERaise(false, FPos, 'Error exists in TagVal expression.');
  end;
end;

{ PNXTagRefExpr }

procedure PNXTagRefExpr.Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable);
var TaggedValue: PTaggedValue;
begin
  // (tagVal obj tagset id)      ClassA   'UMLStandard' 'myset' 'a'
  try
    inherited;
    TaggedValue := (Exprs[0].GetReference as PExtensibleModel)
                    .FindTaggedValue(
                      Exprs[1].GetValue,
                      Exprs[2].GetValue,
                      Exprs[3].GetValue);
    SetReference(TaggedValue.ReferenceValues[0]);
  except
    ERaise(false, FPos, 'Error exists in TagRef expression.');
  end;
end;

{ PNXTagRefAtExpr }

procedure PNXTagRefAtExpr.Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable);
var TaggedValue: PTaggedValue;
begin
  try
    inherited;
    TaggedValue := (Exprs[0].GetReference as PExtensibleModel)
                     .FindTaggedValue(
                       Exprs[1].GetValue,
                       Exprs[2].GetValue,
                       Exprs[3].GetValue);
    SetReference(TaggedValue.ReferenceValues[Exprs[4].GetValue]);
  except
    ERaise(false, FPos, 'Error exists in TagRefAt expression.');
  end;
end;

{ PNXTagRefCountExpr }

procedure PNXTagRefCountExpr.Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable);
var TaggedValue: PTaggedValue;
begin
  try
    inherited;
    TaggedValue := (Exprs[0].GetReference as PExtensibleModel)
                     .FindTaggedValue(
                       Exprs[1].GetValue,
                       Exprs[2].GetValue,
                       Exprs[3].GetValue);
    SetValue(TaggedValue.ReferenceValueCount);
  except
    ERaise(false, FPos, 'Error exists in TagRefCount expression.');
  end;
end;

{ PNXAddExpr }

procedure PNXAddExpr.Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable);
var
  I: Integer;
  ResultValue: Variant;
begin
  try
    inherited;
    ResultValue := 0;
    for I := 0 to Count-1 do
      ResultValue := ResultValue + Exprs[I].GetValue;
    SetValue(ResultValue);
  except
    ERaise(false, FPos, 'Error exists in Add expression.');
  end;
end;

{ PNXSubtractExpr }

procedure PNXSubtractExpr.Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable);
var
  I: Integer;
  ResultValue: Variant;
begin
  try
    inherited;
    ResultValue := 0;
    for I := 0 to Count-1 do
      if I = 0 then
        ResultValue := Exprs[I].GetValue
      else
        ResultValue := ResultValue - Exprs[I].GetValue;
    SetValue(ResultValue);
  except
    ERaise(false, FPos, 'Error exists in Subtract expression.');
  end;
end;

{ PNXMultiplyExpr }

procedure PNXMultiplyExpr.Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable);
var
  I: Integer;
  ResultValue: Variant;
begin
  try
    inherited;
    ResultValue := 1;
    for I := 0 to Count-1 do
      ResultValue := ResultValue * Exprs[I].GetValue;
    SetValue(ResultValue);
  except
    ERaise(false, FPos, 'Error exists in Multiply expression.');
  end;
end;

{ PNXDivideExpr }

procedure PNXDivideExpr.Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable);
var
  I: Integer;
  ResultValue: Variant;
begin
  try
    inherited;
    ResultValue := 1;
    for I := 0 to Count-1 do
      if I = 0 then
        ResultValue := Exprs[I].GetValue
      else
        ResultValue := ResultValue / Exprs[I].GetValue;
    SetValue(ResultValue);
  except
    ERaise(false, FPos, 'Error exists in Divide expression.');
  end;
end;

{ PNXAndExpr }

procedure PNXAndExpr.Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable);
var
  I: Integer;
  ResultValue: Variant;
begin
  try
    inherited;
    ResultValue := true;
    for I := 0 to Count-1 do begin
      Exprs[I].Evaluate(Canvas, SymbolTable);
      ResultValue := ResultValue and Exprs[I].GetValue;
    end;
    SetValue(ResultValue);
  except
    ERaise(false, FPos, 'Error exists in And expression.');
  end;
end;

{ PNXOrExpr }

procedure PNXOrExpr.Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable);
var
  I: Integer;
  ResultValue: Variant;
begin
  try
    inherited;
    ResultValue := false;
    for I := 0 to Count-1 do begin
      ResultValue := ResultValue or Exprs[I].GetValue;
    end;
    SetValue(ResultValue);
  except
    ERaise(false, FPos, 'Error exists in Or expression.');
  end;
end;

{ PNXConcatExpr }

procedure PNXConcatExpr.Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable);
var
  I: Integer;
  ResultValue: String;
begin
  try
    inherited;
    ResultValue := '';
    for I := 0 to Count-1 do begin
      Exprs[I].Evaluate(Canvas, SymbolTable);
      if I = 0 then
        ResultValue := VarToStr(Exprs[I].GetValue)
      else
        ResultValue := ResultValue + VarToStr(Exprs[I].GetValue);
    end;
    SetValue(ResultValue);
  except
    ERaise(false, FPos, 'Error exists in Concat expression.');
  end;
end;

{ PNXSinExpr }

procedure PNXSinExpr.Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable);
begin
  inherited;
  try
    SetValue(Sin(Exprs[0].GetValue));
  except
    ERaise(false, FPos, 'Sin expression can''t be evaluated.');
  end;
end;

{ PNXCosExpr }

procedure PNXCosExpr.Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable);
begin
  inherited;
  try
    SetValue(Cos(Exprs[0].GetValue));
  except
    ERaise(false, FPos, 'Cos expression can''t be evaluated.');
  end;
end;

{ PNXTanExpr }

procedure PNXTanExpr.Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable);
begin
  inherited;
  try
    SetValue(Tan(Exprs[0].GetValue));
  except
    ERaise(false, FPos, 'Tan expression can''t be evaluated.');
  end;
end;

{ PNXTruncExpr }

procedure PNXTruncExpr.Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable);
begin
  inherited;
  try
    SetValue(Sin(Exprs[0].GetValue));
  except
    ERaise(false, FPos, 'Trunc expression can''t be evaluated.');
  end;
end;

{ PNXRoundExpr }

procedure PNXRoundExpr.Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable);
begin
  inherited;
  try
    SetValue(Sin(Exprs[0].GetValue));
  except
    ERaise(false, FPos, 'Round expression can''t be evaluated.');
  end;
end;

{ PNXTrimExpr }

procedure PNXTrimExpr.Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable);
begin
  inherited;
  try
    SetValue(Trim(VarToStr(Exprs[0].GetValue)));
  except
    ERaise(false, FPos, 'Trim expression can''t be evaluated.');
  end;
end;

{ PNXLengthExpr }

procedure PNXLengthExpr.Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable);
var ResultValue: Integer;
begin
  inherited;
  try
    SetValue(Length(VarToStr(Exprs[0].GetValue)));
  except
    ERaise(false, FPos, 'Trim expression can''t be evaluated.');
  end;
end;

{ PNXTextHeightExpr }

procedure PNXTextHeightExpr.Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable);
begin
  inherited;
  try
    SetValue(Canvas.TextHeight(VarToStr(Exprs[0].GetValue)));
  except
    ERaise(false, FPos, 'TextHeight expression can''t be evaluated.');
  end;
end;

{ PNXTextWidthExpr }

procedure PNXTextWidthExpr.Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable);
begin
  inherited;
  try
    SetValue(Canvas.TextWidth(VarToStr(Exprs[0].GetValue)));
  except
    ERaise(false, FPos, 'TextHeight expression can''t be evaluated.');
  end;
end;

{ PNXNotExpr }

procedure PNXNotExpr.Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable);
var ResultValue: Integer;
begin
  inherited;
  try
    SetValue(not Exprs[0].GetValue);
  except
    ERaise(false, FPos, 'Not expression can''t be evaluated.');
  end;
end;

{ PNXSetExpr }

procedure PNXSetExpr.Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable);
var
  Id: String;
  ValueExpr: PNXExpr;
begin
//  inherited;
  try
    Id := (Exprs[0] as PNXGetExpr).Exprs[0].GetValue;
    ValueExpr := Exprs[1];
    ValueExpr.Evaluate(Canvas, SymbolTable);
    // is list type
    if (ValueExpr <> nil) and (ValueExpr is PNXListExpr) then
      SymbolTable.SetValue(Id, PNXExpr.NewRef(ValueExpr.Position, ValueExpr))
    // is value type
    else if ValueExpr.IsValueType then
      SymbolTable.SetValue(Id, PNXExpr.NewValue(ValueExpr.Position, ValueExpr.GetValue))
    // is reference type
    else
      SymbolTable.SetValue(Id, PNXExpr.NewRef(ValueExpr.Position, ValueExpr.GetReference));
  except
    ERaise(false, FPos, 'Error exists in Set expression.');
  end;
end;

{ PNXIfExpr }

procedure PNXIfExpr.Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable);
var CondExpr, ThenExpr, ElseExpr: PNXExpr;
begin
  try
    // condition
    CondExpr := Exprs[0];
    CondExpr.Evaluate(Canvas, SymbolTable);

    // then
    ThenExpr := Exprs[1];
    if CondExpr.GetValue = true then begin
      ThenExpr.Evaluate(Canvas, SymbolTable);
      if ThenExpr.IsValueType then
        SetValue(ThenExpr.GetValue)
      else
        SetReference(ThenExpr.GetReference);
    end

    // else
    else
      if Count > 2 then begin
        ElseExpr := Exprs[2];
        ElseExpr.Evaluate(Canvas, SymbolTable);
        if ElseExpr.IsValueType then
          SetValue(ElseExpr.GetValue)
        else
          SetReference(ElseExpr.GetReference);
      end;
  except
    ERaise(false, FPos, 'Error exists in If expression.');
  end;
end;

{ PNXForExpr }

procedure PNXForExpr.Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable);
var
  Index, FromValue, ToValue: Integer;
  Id: String;
  FromExpr, EndExpr, DoExpr: PNXExpr;
begin
  try
    Id := (Exprs[0] as PNXGetExpr).Exprs[0].GetValue;
    FromExpr := Exprs[1];
    EndExpr := Exprs[2];
    DoExpr := Exprs[3];

    // add indexer to symbol table
    SymbolTable.Add(Id, PNXExpr.NewValue(Exprs[0].Position, 0));
    // initialize
    FromExpr.Evaluate(Canvas, SymbolTable);
    EndExpr.Evaluate(Canvas, SymbolTable);
    FromValue := FromExpr.GetValue;
    ToValue := EndExpr.GetValue;

    // loop
    for Index := FromValue to ToValue do begin
      SymbolTable.SetValue(Id, PNXExpr.NewValue(Exprs[0].Position, Index));
      DoExpr.Evaluate(Canvas, SymbolTable);
      if Index = ToValue then
        if DoExpr.IsValueType then
          SetValue(DoExpr.GetValue)
        else
          SetReference(DoExpr.GetReference);
    end;

    // remove indexer from symbol table
    SymbolTable.Remove(Id);
  except
    ERaise(false, FPos, 'Error exists in For expression.');
  end;
end;

{ PNXEqExpr }

procedure PNXEQExpr.Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable);
var ResultValue: Boolean;
begin
  try
    inherited;
    ResultValue := false;
    if Exprs[0].IsValueType = Exprs[1].IsValueType then
      if Exprs[0].IsValueType then begin
        if SimilarType(Exprs[0].GetValue, Exprs[1].GetValue) then
         if not VarIsStr(Exprs[0].GetValue) then
            ResultValue := (VarCompareValue(Exprs[0].GetValue, Exprs[1].GetValue) = vrEqual)
          else
            ResultValue := (VarCompareValue(Exprs[1].GetValue, Exprs[0].GetValue) = vrEqual)
        else
          ResultValue := false;
      end
      else
        ResultValue := (Exprs[0].GetReference = Exprs[1].GetReference);

    SetValue(ResultValue);
  except
    ERaise(false, FPos, 'Error exists in equal expression.');
  end;
end;

{ PNXNEQExpr }

procedure PNXNEQExpr.Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable);
var ResultValue: Boolean;
begin
  try
    inherited;
    ResultValue := true;
    if Exprs[0].IsValueType = Exprs[1].IsValueType then
      if Exprs[0].IsValueType then begin
        if SimilarType(Exprs[0].GetValue, Exprs[1].GetValue) then
          if not VarIsStr(Exprs[0].GetValue) then
            ResultValue := not (VarCompareValue(Exprs[0].GetValue, Exprs[1].GetValue) = vrEqual)
          else
            ResultValue := not (VarCompareValue(Exprs[1].GetValue, Exprs[0].GetValue) = vrEqual)
        else
          ResultValue := true;
      end
      else
        ResultValue := (Exprs[0].GetReference <> Exprs[1].GetReference);

    SetValue(ResultValue);
  except
    ERaise(false, FPos, 'Error exists in not equal expression.');
  end;
end;

{ PNXGTExpr }

procedure PNXGTExpr.Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable);
var ResultValue: Boolean;
begin
  try
    inherited;
    ResultValue := false;
    if Exprs[0].IsValueType and Exprs[1].IsValueType then
      if SimilarType(Exprs[0].GetValue, Exprs[1].GetValue) then
        if not VarIsStr(Exprs[0].GetValue) then
          ResultValue := (VarCompareValue(Exprs[0].GetValue, Exprs[1].GetValue) = vrGreaterThan)
        else
          ResultValue := (VarCompareValue(Exprs[1].GetValue, Exprs[0].GetValue) = vrGreaterThan)
      else
        ERaise(false, FPos, 'great than expression is requested with two different type.');
    SetValue(ResultValue);
  except
    ERaise(false, FPos, 'Error exists in great than expression.');
  end;
end;

{ PNXGEExpr }

procedure PNXGEExpr.Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable);
var
  ResultValue: Boolean;
  V: TVariantRelationship;
begin
  try
    inherited;
    ResultValue := false;
    if Exprs[0].IsValueType and Exprs[1].IsValueType then begin
      if SimilarType(Exprs[0].GetValue, Exprs[1].GetValue) then begin
        if not VarIsStr(Exprs[0].GetValue) then
          V := VarCompareValue(Exprs[0].GetValue, Exprs[1].GetValue)
        else
          V := VarCompareValue(Exprs[1].GetValue, Exprs[0].GetValue);
        ResultValue := (V = vrGreaterThan) or (V = vrEqual);
      end
      else
        ERaise(false, FPos, 'great equal expression is requested with two different type.')
    end;
    SetValue(ResultValue);
  except
    ERaise(false, FPos, 'Error exist in great equal expression.');
  end;
end;

{ PNXLTExpr }

procedure PNXLTExpr.Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable);
var ResultValue: Boolean;
begin
  try
    inherited;
    ResultValue := false;
    if Exprs[0].IsValueType and Exprs[1].IsValueType then begin
      if SimilarType(Exprs[0].GetValue, Exprs[1].GetValue) then
        if not VarIsStr(Exprs[0].GetValue) then
          ResultValue := (VarCompareValue(Exprs[0].GetValue, Exprs[1].GetValue) = vrLessThan)
        else
          ResultValue := (VarCompareValue(Exprs[0].GetValue, Exprs[1].GetValue) = vrLessThan)
      else
        ERaise(false, FPos, 'less than expression is requested with two different type.');
    end;

    SetValue(ResultValue);
  except
    ERaise(false, FPos, 'Error exists in less than expression.');
  end;
end;

{ PNXLEExpr }

procedure PNXLEExpr.Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable);
var
  ResultValue: Boolean;
  V: TVariantRelationship;
begin
  try
    inherited;
    ResultValue := false;
    if Exprs[0].IsValueType and Exprs[1].IsValueType then begin
      if SimilarType(Exprs[0].GetValue, Exprs[1].GetValue) then begin
        if not VarIsStr(Exprs[0].GetValue) then
          V := VarCompareValue(Exprs[0].GetValue, Exprs[1].GetValue)
        else
          V := VarCompareValue(Exprs[1].GetValue, Exprs[0].GetValue);
        ResultValue := (V = vrLessThan) or (V = vrEqual);
      end
      else
        ERaise(false, FPos, 'less equal expression is requested with two different type..')
    end;

    SetValue(ResultValue);
  except
    ERaise(false, FPos, 'Error exists in less equal expression.');
  end;
end;

{ PNXGetExpr }

procedure PNXGetExpr.Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable);
var Value: PNXExpr;
begin
  try
    inherited;
    Value := SymbolTable.GetValue(Exprs[0].GetValue);
    if Value.IsValueType then
      SetValue(Value.GetValue)
    else
      SetReference(Value.GetReference);
  except
    ERaise(false, FPos, 'Error exists in get('+Exprs[0].GetValue+') expression.');
  end;
end;

{ PNXSetPenColorExpr }

procedure PNXSetPenColorExpr.Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable);
begin
  try
    inherited;
    Canvas.Pen.Color := StringToColor(VarToStr(Exprs[0].GetValue));
  except
    ERaise(false, FPos, 'Error exists in SetPenColor expression.');
  end;
end;

{ PNXSetPenStyleExpr }

procedure PNXSetPenStyleExpr.Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable);

  function StringToPenStyle(Str: String): TPenStyle;
  begin
    Str := Trim(Str);
    if Str = 'psSolid' then Result := psSolid
    else if Str = 'psDash' then Result := psDash
    else if Str = 'psDot' then Result := psDot
    else if Str = 'psDashDot' then Result := psDashDot
    else if Str = 'psDashDotDot' then Result := psDashDotDot
    else if Str = 'psClear' then Result := psClear
    else if Str = 'psInsideFrame' then Result := psInsideFrame
    else Result := psSolid;
  end;

begin
  try
    inherited;
    Canvas.Pen.Style := StringToPenStyle(VarToStr(Exprs[0].GetValue));
  except
    ERaise(false, FPos, 'Error exists in SetPenStyle expression.');
  end;
end;

{ PNXSetBrushColorExpr }

procedure PNXSetBrushColorExpr.Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable);
begin
  try
    inherited;
    Canvas.Brush.Color := StringToColor(VarToStr(Exprs[0].GetValue));
  except
    ERaise(false, FPos, 'Error exists in SetBrushColor expression.');
  end;
end;

{ PNXSetBrushStyleExpr }

procedure PNXSetBrushStyleExpr.Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable);

  function StringToBrushStyle(Str: String): TBrushStyle;
  begin
    Str := Trim(Str);
    if Str = 'bsSolid' then Result := bsSolid
    else if Str = 'bsClear' then Result := bsClear
    else if Str = 'bsHorizontal' then Result := bsHorizontal
    else if Str = 'bsVertical' then Result := bsVertical
    else if Str = 'bsFDiagonal' then Result := bsFDiagonal
    else if Str = 'bsBDiagonal' then Result := bsBDiagonal
    else if Str = 'bsCross' then Result := bsCross
    else if Str = 'bsDiagCross' then Result := bsDiagCross
    else Result := bsSolid;
  end;

begin
  try
    inherited;
    Canvas.Brush.Style := StringToBrushStyle(VarToStr(Exprs[0].GetValue));
  except
    ERaise(false, FPos, 'Error exists in SetBrushStyle expression.');
  end;
end;

{ PNXSetFontFaceExpr }

procedure PNXSetFontFaceExpr.Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable);
begin
  try
    inherited;
    Canvas.Font.Name := Exprs[0].GetValue;
  except
    ERaise(false, FPos, 'Error exists in SetFontFace expression.');
  end;
end;

{ PNXSetFontColorExpr }

procedure PNXSetFontColorExpr.Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable);
begin
  try
    inherited;
    Canvas.Font.Color := StringToColor(VarToStr(Exprs[0].GetValue));
  except
    ERaise(false, FPos, 'Error exists in SetFontColor expression.');
  end;
end;

{ PNXSetFontSizeExpr }

procedure PNXSetFontSizeExpr.Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable);
begin
  try
    inherited;
    Canvas.Font.Size := Exprs[0].GetValue;
  except
    ERaise(false, FPos, 'Error exists i SetFontSize expression.');
  end;
end;

{ PNXSetFontStyleExpr }

procedure PNXSetFontStyleExpr.Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable);

  function StringToFontStyle(Str: String): TFontStyles;
  var
    P, DL: Integer;
    S, T: String;
  begin
    Result := [];
    S := Trim(Str);
    DL := Length('|');
    while Length(S) > 0 do begin
      P := Pos('|', S);
      if P = 0 then begin
        if S = 'fsBold' then Result := Result + [fsBold]
        else if S = 'fsItalic' then Result := Result + [fsItalic]
        else if S = 'fsUnderline' then Result := Result + [fsUnderline]
        else if S = 'fsStrikeOut' then Result := Result + [fsStrikeOut];
        break;
      end;
      T := Copy(S, 1, P-1);
      if T = 'fsBold' then Result := Result + [fsBold]
      else if T = 'fsItalic' then Result := Result + [fsItalic]
      else if T = 'fsUnderline' then Result := Result + [fsUnderline]
      else if T = 'fsStrikeOut' then Result := Result + [fsStrikeOut];
      S := Copy(S, P+DL, Length(S)-P-DL+1);
    end;
  end;

begin
  try
    inherited;
    Canvas.Font.Style := StringToFontStyle(VarToStr(Exprs[0].GetValue));
  except
    ERaise(false, FPos, 'Error exists in SetFontStyle expression.');
  end;
end;

{ PNXSetDefaultStyleExpr }

procedure PNXSetDefaultStyleExpr.Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable);
var View: PView;
begin
  try
    View := (SymbolTable.GetValue('view').GetReference as PView);
    if View is PNodeView then
      with View as PNodeView do begin
        Canvas.Pen.Color := LineColor;
        Canvas.Pen.Style := psSolid;
        Canvas.Brush.Color := FillColor;
        Canvas.Brush.Style := bsSolid;
        Canvas.Font.Color := FontColor;
        Canvas.Font.Style := FontStyle;
        Canvas.Font.Size := FontSize;
        Canvas.Font.Name := FontFace;
      end
    else
      with View as PEdgeView do begin
        Canvas.Pen.Color := LineColor;
        if LineMode = lmSolid then
          Canvas.Pen.Style := psSolid
        else
          Canvas.Pen.Style := psDot;
        Canvas.Brush.Color := FillColor;
        Canvas.Brush.Style := bsSolid;
        Canvas.Font.Color := FontColor;
        Canvas.Font.Style := FontStyle;
        Canvas.Font.Size := FontSize;
        Canvas.Font.Name := FontFace;
      end;
  except
    ERaise(false, FPos, 'Error exists in SetDefaultStyle expression.');
  end;
end;

{ PNXPointExpr }

procedure PNXPointExpr.Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable);
begin
  inherited;
end;

{ PNXMoveToExpr }

procedure PNXMoveToExpr.Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable);
begin
  try
    inherited;
    Canvas.MoveTo(Exprs[0].GetValue, Exprs[1].GetValue);
  except
    ERaise(false, FPos, 'Error exists in MoveTo expression.');
  end;
end;

{ PNXLineToExpr }

procedure PNXLineToExpr.Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable);
begin
  try
    inherited;
    Canvas.LineTo(Exprs[0].GetValue, Exprs[1].GetValue);
  except
    ERaise(false, FPos, 'Error exists in LineTo expresssion.');
  end;
end;

{ PNXTextOutExpr }

procedure PNXTextOutExpr.Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable);
begin
  try
    inherited;
    Canvas.TextOut(Exprs[0].GetValue, Exprs[1].GetValue, Exprs[2].GetValue);
  except
    ERaise(false, FPos, 'Error exists in TextOut expresssion.');
  end;
end;

{ PNXTextBoundExpr }

procedure PNXTextBoundExpr.Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable);
begin
  try
    inherited;
    Canvas.TextBound(
      Exprs[0].GetValue, Exprs[1].GetValue,  // x1, y1
      Exprs[2].GetValue, Exprs[3].GetValue,  // x2, y2
      Exprs[4].GetValue,                     // yspace
      Exprs[5].GetValue,                     // text
      Exprs[6].GetValue);                    // clipping
  except
    ERaise(false, FPos, 'Error exists in TextBound expresssion.');
  end;
end;

{ PNXDrawBitmapExpr }

constructor PNXDrawBitmapExpr.Create(Position: Integer; Filepath: String);
begin
  inherited Create(Position);
  FGraphic := nil;
  FFilepath := Filepath;
end;

procedure PNXDrawBitmapExpr.Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable);
var
  Ext: String;
  Filepath, Filename, Fullpath: String;
  Transparent: Boolean;
begin
  try
    inherited;

    if FGraphic = nil then begin
      Filepath := FFilepath;

      if (Count = 5) or (Count = 6) then
        Filename := Exprs[4].GetValue
      else
        Filename := Exprs[2].GetValue;

      if Count = 4 then
        Transparent := Exprs[3].GetValue
      else if Count = 6 then
        Transparent := Exprs[5].GetValue
      else
        Transparent := false;

      if Filepath = '' then
        Fullpath := Filename
      else
        Fullpath := Filepath + Filename;

      if NXManager.ExistGraphic(Fullpath) then begin
        FGraphic := NXManager.GetGraphic(Fullpath) as TGraphic;
      end
      else begin
        Ext := LowerCase(ExtractFileExt(Fullpath));
       if (Ext = WMF_FILE) or (Ext = EMF_FILE) then begin
          FGraphic := TMetaFile.Create;
          try
            FGraphic.LoadFromFile(Fullpath);
          except
            // Invalid Meta File Format
            FGraphic.Free;
            FGraphic := nil;
            ERaise(false, FPos, Fullpath+' image is not found.');
          end;
        end
        else if (Ext = BMP_FILE) then begin
          FGraphic := Graphics.TBitmap.Create;
          (FGraphic as TBitmap).TransparentColor := clFuchsia;
          (FGraphic as TBitmap).TransparentMode := tmAuto;
          FGraphic.Transparent := Transparent;
          try
            FGraphic.LoadFromFile(Fullpath);
          except
            // Invalid BMP File Format
            FGraphic.Free;
            FGraphic := nil;
            ERaise(false, FPos, Fullpath+' image is not found.');
          end;
        end;
        NXManager.AddGraphic(Fullpath, FGraphic);
      end;
    end;

    if (Count = 5) or (Count = 6) then
      Canvas.StretchDraw(
        Rect(Exprs[0].GetValue, Exprs[1].GetValue,
          Exprs[2].GetValue, Exprs[3].GetValue
        ),
        FGraphic)
    else
      Canvas.Draw(
        Exprs[0].GetValue, Exprs[1].GetValue,
        FGraphic);
  except
    ERaise(false, FPos, 'Error exists in DrawBitmap expression.');
  end;
end;

{ PNXLineExpr }

procedure PNXLineExpr.Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable);
begin
  try
    inherited;
    Canvas.MoveTo(Exprs[0].GetValue, Exprs[1].GetValue);
    Canvas.LineTo(Exprs[2].GetValue, Exprs[3].GetValue);
  except
    ERaise(false, FPos, 'Error exists in Line expression.');
  end;
end;

{ PNXRectExpr }

procedure PNXRectExpr.Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable);
begin
  try
    inherited;
    Canvas.Rectangle(Exprs[0].GetValue, Exprs[1].GetValue,Exprs[2].GetValue, Exprs[3].GetValue);
  except
    ERaise(false, FPos, 'Error exists in Rectangle expression.');
  end;
end;

{ PNXFillRectExpr }

procedure PNXFillRectExpr.Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable);
begin
  try
    inherited;
    Canvas.FillRect(Rect(Exprs[0].GetValue, Exprs[1].GetValue,Exprs[2].GetValue, Exprs[3].GetValue));
  except
    ERaise(false, FPos, 'Error exists in FillRect expression.');
  end;
end;

{ PNXEllipseExpr }

procedure PNXEllipseExpr.Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable);
begin
  try
    inherited;
    Canvas.Ellipse(Exprs[0].GetValue, Exprs[1].GetValue,Exprs[2].GetValue, Exprs[3].GetValue);
  except
    ERaise(false, FPos, 'Error exists in Ellipse expression.');
  end;
end;

{ PNXRoundRectExpr }

procedure PNXRoundRectExpr.Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable);
begin
  try
    inherited;
    Canvas.RoundRect(
      Exprs[0].GetValue, Exprs[1].GetValue,
      Exprs[2].GetValue, Exprs[3].GetValue,
      Exprs[4].GetValue, Exprs[5].GetValue);
  except
    ERaise(false, FPos, 'Error exists in RoundRect expression.');
  end;
end;

{ PNXArcExpr }

procedure PNXArcExpr.Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable);
begin
  try
    inherited;
    Canvas.Arc(
      Exprs[0].GetValue, Exprs[1].GetValue,
      Exprs[2].GetValue, Exprs[3].GetValue,
      Exprs[4].GetValue, Exprs[5].GetValue,
      Exprs[6].GetValue, Exprs[7].GetValue);
  except
    ERaise(false, FPos, 'Error exists in RoundRect expression.');
  end;
end;

{ PNXPieExpr }

procedure PNXPieExpr.Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable);
begin
  try
    inherited;
    Canvas.Pie(
      Exprs[0].GetValue, Exprs[1].GetValue,
      Exprs[2].GetValue, Exprs[3].GetValue,
      Exprs[4].GetValue, Exprs[5].GetValue,
      Exprs[6].GetValue, Exprs[7].GetValue);
  except
    ERaise(false, FPos, 'Error exists in RoundRect expression.');
  end;
end;

{ PNXTextRectExpr }

procedure PNXTextRectExpr.Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable);
begin
  try
    inherited;
    Canvas.TextRect(
      Rect(
        Exprs[0].GetValue, Exprs[1].GetValue,
        Exprs[2].GetValue, Exprs[3].GetValue
      ),
      Exprs[4].GetValue, Exprs[5].GetValue,
      Exprs[6].GetValue
    );
  except
    ERaise(false, FPos, 'Error exists in TextRect expression.');
  end;
end;

{ PNXPolylineExpr }

procedure PNXPolylineExpr.Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable);
var
  I, C: Integer;
  Points: array[0..255] of TPoint;
  P: PPoints;
begin
  try
    inherited;
    C := Count;
    if (C > 1) then begin
      for I := 0 to C-1 do begin
        Points[I].X := (Exprs[I] as PNXPointExpr).Exprs[0].GetValue;
        Points[I].Y := (Exprs[I] as PNXPointExpr).Exprs[1].GetValue;
      end;
      Canvas.PolyLine(Slice(Points, C));
    end
    else begin
      P := Exprs[0].GetReference as PPoints;
      C := P.Count;
      for I := 0 to C-1 do begin
        Points[I].X := P.Points[I].X;
        Points[I].Y := P.Points[I].Y;
      end;
      Canvas.PolyLine(Slice(Points, C));
    end;
  except
    ERaise(false, FPos, 'Error exists in Polyline expression.');
  end;
end;

{ PNXPolygonExpr }

procedure PNXPolygonExpr.Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable);
var
  I, C: Integer;
  Points: array[0..255] of TPoint;
  P: PPoints;
begin
  try
    inherited;
    C := Count;
    if (C > 1) then begin
      for I := 0 to C-1 do begin
        Points[I].X := (Exprs[I] as PNXPointExpr).Exprs[0].GetValue;
        Points[I].Y := (Exprs[I] as PNXPointExpr).Exprs[1].GetValue;
      end;
      Canvas.Polygon(Slice(Points, C));
    end
    else begin
      P := Exprs[0].GetReference as PPoints;
      C := P.Count;
      for I := 0 to C-1 do begin
        Points[I].X := P.Points[I].X;
        Points[I].Y := P.Points[I].Y;
      end;
      Canvas.Polygon(Slice(Points, C));
    end;
  except
    ERaise(false, FPos, 'Error exists in Polygon expression.');
  end;
end;

{ PNXPolyBezierExpr }

procedure PNXPolyBezierExpr.Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable);
var
  I, C, M, AC, R: Integer;
  Points: array[0..255] of TPoint;
  P: PPoints;

  function AddPoints(C: Integer): Integer;
  var I, M, R: Integer;
  begin
    if C <= 4 then
      R := abs((C-4) mod 3)
    else
      R := 3 - ((C-4) mod 3);
    if R > 0 then
      // move points
      M := (C-1) div 2;
      for I := C-1 downto M do begin
        Points[I+R].X := Points[I].X;
        Points[I+R].Y := Points[I].Y;
      end;

      for I := M+R-1 downto M do begin
        if M > 0 then begin
          Points[I].X := (Points[M-1].X + Points[M].X) div 2;
          Points[I].Y := (Points[M-1].Y + Points[M].Y) div 2;
        end
        else begin
          Points[I].X := (Points[M].X + Points[M+R].X) div 2;
          Points[I].Y := (Points[M].Y + Points[M+R].Y) div 2;
        end;
      end;
    Result := C + R;
  end;
begin
  try
    inherited;
    C := Count;
    if (C > 1) then begin
      for I := 0 to C-1 do begin
        Points[I].X := (Exprs[I] as PNXPointExpr).Exprs[0].GetValue;
        Points[I].Y := (Exprs[I] as PNXPointExpr).Exprs[1].GetValue;
      end;
      AC := AddPoints(C);
      Canvas.PolyBezier(Slice(Points, AC));
    end
    else begin
      P := Exprs[0].GetReference as PPoints;
      C := P.Count;
      for I := 0 to C-1 do begin
        Points[I].X := P.Points[I].X;
        Points[I].Y := P.Points[I].Y;
      end;
      AC := AddPoints(C);
      Canvas.PolyBezier(Slice(Points, AC));
    end;
  except
    ERaise(false, FPos, 'Error exists in PolyBezier expression.');
  end;
end;

{ PNXPtAtX }

procedure PNXPtAtXExpr.Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable);
var
  Value: PNXExpr;
  Index: Integer;
begin
  try
    inherited;
    Value := SymbolTable.GetValue('points');
    Index := Exprs[0].GetValue;
    SetValue((Value.GetReference as PPoints).Points[Index].X);
  except
    ERaise(false, FPos, 'Error exists in PtAtX expression.');
  end;
end;

{ PNXPtAtY }

procedure PNXPtAtYExpr.Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable);
var
  Value: PNXExpr;
  Index: Integer;
begin
  try
    inherited;
    Value := SymbolTable.GetValue('points');
    Index := Exprs[0].GetValue;
    SetValue((Value.GetReference as PPoints).Points[Index].Y);
  except
    ERaise(false, FPos, 'Error exists in PtAtY expression.');
  end;
end;

{ PNXPtCount }

procedure PNXPtCountExpr.Evaluate(Canvas: PCanvas;
  SymbolTable: PNXSymbolTable);
var
  Value: PNXExpr;
begin
  try
    inherited;
    Value := SymbolTable.GetValue('points');
    SetValue((Value.GetReference as PPoints).Count);
  except
    ERaise(false, FPos, 'Error exists in PtCount expression.');
  end;
end;

{ PNXDrawEdge }

procedure PNXDrawEdgeExpr.Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable);
const
  RADIUS = 5;
var
  RT: TRect;
  P0, P1, P2, P3, P4, P5, P6, P7, P8, P9, P10, P11, P12, P13,
  P14, P15, P16, P17, P18, P19, P20, P21, P22: TPoint;
  A, B, TH, TH1, TH2: Extended;
  HeadValue: String;
  BS: TBrushStyle;
  BC: TColor;
  Style: String;
  P: Integer;
begin
  try
    inherited;

    HeadValue := Exprs[0].GetValue;
    Style := Exprs[1].GetValue;

    with (SymbolTable.GetValue('points').GetReference as PPoints) do begin
      if HeadValue = 'head' then
        RT := Rect(Points[Count-1].X, Points[Count-1].Y,
                   Points[Count-2].X, Points[Count-2].Y)
      else if HeadValue = 'tail' then
        RT := Rect(Points[0].X, Points[0].Y,
                   Points[1].X, Points[1].Y)
      else begin
        if (Count mod 2) = 0 then begin
          P := (Count div 2)-1;
          RT := Rect(
                (Points[P].X + Points[P+1].X) div 2,
                (Points[P].Y + Points[P+1].Y) div 2,
                Points[P+1].X,
                Points[P+1].Y);
        end
        else begin
          P := Count div 2;
          RT := Rect(
                Points[P].X,
                Points[P].Y,
                Points[P+1].X,
                Points[P+1].Y);
        end;
      end;
    end;

    A := RT.Bottom - RT.Top;
    B := (RT.Right - RT.Left + 0.00001);
    TH := ArcTan(A / B);
    if ((A < 0) and (B < 0)) or ((A > 0) and (B < 0)) or ((A = 0) and (B < 0)) then
      TH := TH + 3.141592;
    TH1 := TH - 3.141592 / 8;
    TH2 := TH + 3.141592 / 8;

    P0 := Point(RT.Left, RT.Top);
    P1 := Point(Trunc(11 * Cos(TH1)) + RT.Left, Trunc(11 * Sin(TH1)) + RT.Top);
    P2 := Point(Trunc(11 * Cos(TH2)) + RT.Left, Trunc(11 * Sin(TH2)) + RT.Top);
    P3 := Point(Trunc(22 * Cos(TH)) + RT.Left, Trunc(22 * Sin(TH)) + RT.Top);
    P4 := Point(Trunc(22 * Cos(TH1)) + RT.Left, Trunc(22 * Sin(TH1)) + RT.Top);
    P5 := Point(Trunc(22 * Cos(TH2)) + RT.Left, Trunc(22 * Sin(TH2)) + RT.Top);
    P6 := Point(Trunc(11 * Cos(TH1)) + P3.X, Trunc(11 * Sin(TH1)) + P3.Y);
    P7 := Point(Trunc(11 * Cos(TH2)) + P3.X, Trunc(11 * Sin(TH2)) + P3.Y);
    P8 := Point((P1.X + P2.X) div 2, (P1.Y + P2.Y) div 2);

    //  P9 := Point(P1.X - Round((P8.X - P0.X)*0.7), P1.Y - Round((P8.Y - P0.Y)*0.7));
//  P10 := Point(P2.X - Round((P8.X - P0.X)*0.7), P2.Y - Round((P8.Y - P0.Y)*0.7));
    P9 := Point(P1.X - (P8.X - P0.X), P1.Y - (P8.Y - P0.Y));
    P10 := Point(P2.X -(P8.X - P0.X), P2.Y - (P8.Y - P0.Y));

    P11 := Point(Trunc((P3.X + P8.X)/2), Trunc((P3.Y + P8.Y)/2));
    P12 := Point(Trunc((P0.X + P8.X)/2), Trunc((P0.Y + P8.Y)/2));

//  P13 := Point(P1.X + (P8.X - P0.X) div 4, P1.Y + (P8.Y - P0.Y) div 4);
//  P14 := Point(P2.X + (P8.X - P0.X) div 4, P2.Y + (P8.Y - P0.Y) div 4);

    P15 := Point(P2.X + (P2.X - P8.X), P2.Y + (P2.Y - P8.Y));
    P16 := Point(P1.X + (P1.X - P8.X), P1.Y + (P1.Y - P8.Y));

    P13 := Point(P15.X + (P8.X - P0.X) div 4, P15.Y + (P8.Y - P0.Y) div 4);
    P14 := Point(P16.X + (P8.X - P0.X) div 4, P16.Y + (P8.Y - P0.Y) div 4);

    P17 := Point(Trunc(11 * Cos(TH1-3.141592/8)) + RT.Left, Trunc(11 * Sin(TH1-3.141592/8)) + RT.Top);
    P18 := Point(Trunc(11 * Cos(TH2+3.141592/8)) + RT.Left, Trunc(11 * Sin(TH2+3.141592/8)) + RT.Top);

    P19 := Point(Trunc(7 * Cos(TH-3.141592/2)) + RT.Left, Trunc(7 * Sin(TH-3.141592/2)) + RT.Top);
    P20 := Point(Trunc(7 * Cos(TH+3.141592/2)) + RT.Left, Trunc(7 * Sin(TH+3.141592/2)) + RT.Top);

    P21 := Point((P17.X + P18.X) div 2, (P17.Y + P18.Y) div 2);
    P22 := Point(P0.X - (P21.X-P0.X), P0.Y - (P21.Y-P0.Y));

    if Pos('esStickArrow', Style) > 0 then
      Canvas.Polyline([P1, P0, P2]);
    if Pos('esSolidArrow', Style) > 0 then
      Canvas.Polygon([P1, P0, P2]);
    if Pos('esTriangle', Style) > 0 then
      Canvas.Polygon([P4, P0, P5]);
    if Pos('esDiamond', Style) > 0 then
      Canvas.Polygon([P1, P0, P2, P3]);
    if Pos('esMiniDiamond', Style) > 0 then
      Canvas.Polygon([P0, P17, P8, P18]);
    if Pos('esArrowDiamond', Style) > 0 then begin
      Canvas.Polygon([P1, P0, P2, P3]);
      Canvas.Polyline([P6, P3, P7]);
    end;
    if Pos('esCrowFoot', Style) > 0 then begin
      Canvas.Polyline([P9, P8, P10]);
      Canvas.MoveTo(P0.X, P0.Y);
      Canvas.LineTo(P8.X, P8.Y);
    end;
    if Pos('esHalfStickArrow', Style) > 0 then
      Canvas.Polyline([P0, P1]);
    if Pos('esBar', Style) > 0 then
    Canvas.Polyline([P15, P16]);
//    Canvas.Polyline([P1, P2]);
    if Pos('esDoubleBar', Style) > 0 then begin
      Canvas.Polyline([P15, P16]);
      Canvas.Polyline([P13, P14]);
//    Canvas.Polyline([P1, P2]);
    end;
    if Pos('esBelowCircle', Style) > 0 then begin
      Canvas.Brush.Style := bsClear;
      Canvas.Ellipse(P11.X-RADIUS, P11.Y-RADIUS, P11.X+RADIUS, P11.Y+RADIUS);
    end;
    if Pos('esCircle', Style) > 0 then begin
      Canvas.Brush.Style := bsClear;
      Canvas.Ellipse(P12.X-RADIUS, P12.Y-RADIUS, P12.X+RADIUS, P12.Y+RADIUS);
    end;
    if Pos('esRect', Style) > 0 then begin
      Canvas.Brush.Style := bsClear;
      Canvas.Polyline([P1, P2, P10, P9, P1]);
    end;

    BS := Canvas.Brush.Style;
    BC := Canvas.Brush.Color;
    Canvas.Brush.Style := bsSolid;
    Canvas.Brush.Color := Canvas.Pen.Color;

    if Pos('esFilledTriangle', Style) > 0 then
      Canvas.Polygon([P4, P0, P5]);
    if Pos('esFilledDiamond', Style) > 0 then
      Canvas.Polygon([P1, P0, P2, P3]);
    if Pos('esMiniFilledDiamond', Style) > 0 then
      Canvas.Polygon([P0, P17, P8, P18]);
    if Pos('esArrowFilledDiamond', Style) > 0 then begin
      Canvas.Polygon([P1, P0, P2, P3]);
      Canvas.Polyline([P6, P3, P7]);
    end;
    if Pos('esFilledHalfStickArrow', Style) > 0 then
      Canvas.Polygon([P1, P0, P8]);
    if Pos('esFilledCircle', Style) > 0 then
      Canvas.Ellipse(P12.X-RADIUS, P12.Y-RADIUS, P12.X+RADIUS, P12.Y+RADIUS);
    if Pos('esFilledRect', Style) > 0 then
      Canvas.Polygon([P1, P2, P10, P9, P1]);

    if Pos('esMiniHalfDiamond', Style) > 0 then begin
      Canvas.Polygon([P19, P21, P20]);
      Canvas.Brush.Style := BS;
      Canvas.Brush.Color := BC;
      Canvas.Polygon([P19, P22, P20]);
    end;

    Canvas.Brush.Style := BS;
    Canvas.Brush.Color := BC;
  except
    ERaise(false, FPos, 'Error exists in DrawEdge expression.');
  end;
end;

{ PNXDrawObjectExpr }

procedure PNXDrawObjectExpr.Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable);
var
  V: PExtensibleView;
  B: Boolean;
begin
  try
    inherited;
    V := Exprs[0].GetReference as PExtensibleView;
    B := V.ShowExtendedNotation;
    V.ShowExtendedNotation := false;
    V.Draw(Canvas);
    V.ShowExtendedNotation := B;
  except
    ERaise(false, FPos, 'Error exists in DrawObject expression.');
  end;
end;

{ PNXArrangeObjectExpr }

procedure PNXArrangeObjectExpr.Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable);
var
  V: PExtensibleView;
  B: Boolean;
begin
  try
    inherited;
    V := Exprs[0].GetReference as PExtensibleView;
    B := V.ShowExtendedNotation;
    V.ShowExtendedNotation := false;
    V.Arrange(Canvas);
    V.ShowExtendedNotation := B;
  except
    ERaise(false, FPos, 'Error exists in ArrangeObject expression.');
  end;
end;

{ PNXReader }

function PNXReader.Read(FilePath: String): PNXExpr;
var
  NXExpr: PNXExpr;
  Success: Boolean;
  Node: Integer;
  P: Integer;
begin
  NXExpr := nil;

  try

    FFilePath := ExtractFilepath(FilePath);

    // parse schema
    Pgmr := TPgmr.Create(Application);
    Pgmr.SetGrammar(ExtractFilePath(Application.ExeName)+'\pns.gmr');
    Pgmr.SetInputFilename(FilePath);
    Pgmr.Parse;

    Success := (Pgmr.Status = pgStatusComplete) and (Pgmr.GetNumErrors = 0);
    if Success then begin
      Node := Pgmr.Find('expr', Pgmr.GetRoot);
      Assert(Node <> NOT_EXISTS);

      // traverse parsing tree and make PNXExpr
      NXExpr := TraverseNode(Node);
    end
    else begin
      if Pgmr.Status = pgStatusError then begin
        FErrorLine := -1;
        FErrorLinePos := -1;
        FErrorNumChars := 0;
      end
      else begin
        P := StrToIntDef(Pgmr.GetErrorDetail(0, 'StartPos'), -1);
        FErrorLine := Pgmr.GetInputLineNumber(P);
        FErrorLinePos := P - Pgmr.GetInputLinePos(FErrorLine);
        FErrorNumChars := StrToIntDef(Pgmr.GetErrorDetail(0, 'NumChars'), 0);
      end;
      ERaise(false, FErrorLine, 'Syntax Errors exist.');
      FErrorDescription := Pgmr.GetErrorDescription(0);
    end;

    // return PNXExpr
    Pgmr.SetInputFilename('');
    Pgmr.Free;
    Pgmr := nil;
    Result := NXExpr;
  except
    if Pgmr <> nil then begin
      Pgmr.SetInputFilename('');
      Pgmr.Free;
      Pgmr := nil;
    end;
  end;
  Result := NXExpr;
end;

function PNXReader.FindChild(Node: Integer; OperName: String): Integer;
var
  I, C: Integer;
  OperNode, ChildNode: Integer;
  P, Value: String;
begin
  OperName := LowerCase(OperName);
  C := ChildCount(Node);
  for I := 0 to C-1 do begin
    P := '.' + IntToStr(I);
    ChildNode := Pgmr.Find(P, Node);

    OperNode := Pgmr.Find('.oper', ChildNode);
    if OperNode = 0 then
      Continue;

    Value := Pgmr.GetValue(OperNode);

    if LowerCase(Value) = OperName then begin
      Result := ChildNode;
      Exit;
    end;
  end;

  Result := NOT_EXISTS;
end;

function PNXReader.FindChildAt(Node: Integer; At: Integer): Integer;
var
  ChildNode: Integer;
  P: String;
begin
  P := '.' + IntToStr(At);
  ChildNode := Pgmr.Find(P, Node);
  Result := ChildNode;
end;

function PNXReader.ChildCount(Node: Integer): Integer;
begin
  Result := Pgmr.GetNumChildren(Node);
end;

function PNXReader.NodeName(Node: Integer): String;
begin
  Result := Pgmr.GetLabel(Node);
end;

function PNXReader.NodeValue(Node: Integer): String;
begin
  Result := Pgmr.GetValue(Node);
end;

function PNXReader.OperName(Node: Integer): String;
var OperNode: Integer;
begin
  OperNode := Pgmr.Find('.oper', Node);
  Result := NodeValue(OperNode);
end;

function PNXReader.ExprNodeValue(Node: Integer): String;
begin
  try
    Result := NodeValue(FindChildAt(Node, 0));
  except
    ERaise(false, GetPos(Node), 'required value or symble.');
    Result := '';
  end;
end;

function PNXReader.StripQuote(S: String): String;
begin
  Result := Copy(S, 2, Length(S)-2);
end;

function PNXReader.GetPos(Node: Integer): Integer;
begin
  Result := Pgmr.GetInputLineNumber(Pgmr.GetValuePos(Node));
end;

function PNXReader.TraverseNode(Node: Integer): PNXExpr;
var
  Name: String;
  N: Integer;
begin
  Result := nil;
  N := Pgmr.Find('.oper', Node);

  // in case of having operator
  if N <> NOT_EXISTS then begin
    Name := LowerCase(Pgmr.GetValue(N));
    if      Name = 'notation'     then Result := TraverseNotationNode(Node)
    else if Name = 'onarrange'    then Result := TraverseSequenceNode(Node)
    else if Name = 'ondraw'       then Result := TraverseSequenceNode(Node)

    else if Name = 'sequence'     then Result := TraverseSequenceNode(Node)

    else if Name = '+'            then Result := TraverseAddNode(Node)
    else if Name = '-'            then Result := TraverseSubtractNode(Node)
    else if Name = '*'            then Result := TraverseMultiplyNode(Node)
    else if Name = '/'            then Result := TraverseDivideNode(Node)
    else if Name = 'and'          then Result := TraverseAndNode(Node)
    else if Name = 'or'           then Result := TraverseOrNode(Node)
    else if Name = 'not'          then Result := TraverseNotNode(Node)
    else if Name = '='            then Result := TraverseEQNode(Node)
    else if Name = '!='           then Result := TraverseNEQNode(Node)
    else if Name = '>'            then Result := TraverseGTNode(Node)
    else if Name = '>='           then Result := TraverseGENode(Node)
    else if Name = '<'            then Result := TraverseLTNode(Node)
    else if Name = '<='           then Result := TraverseLENode(Node)

    else if Name = 'sin'          then Result := TraverseSinNode(Node)
    else if Name = 'cos'          then Result := TraverseCosNode(Node)
    else if Name = 'tan'          then Result := TraverseTanNode(Node)

    else if Name = 'concat'       then Result := TraverseConcatNode(Node)
    else if Name = 'trunc'        then Result := TraverseTruncNode(Node)
    else if Name = 'round'        then Result := TraverseRoundNode(Node)
    else if Name = 'trim'         then Result := TraverseTrimNode(Node)
    else if Name = 'length'       then Result := TraverseLengthNode(Node)
    else if Name = 'tokenize'     then Result := TraverseTokenizeNode(Node)

    else if Name = 'mofattr'      then Result := TraverseMOFAttrNode(Node)
    else if Name = 'mofsetattr'   then Result := TraverseMOFSetAttrNode(Node)
    else if Name = 'mofref'       then Result := TraverseMOFRefNode(Node)
    else if Name = 'mofcolat'     then Result := TraverseMOFColAtNode(Node)
    else if Name = 'mofcolcount'  then Result := TraverseMOFColCountNode(Node)

    else if Name = 'constraintval' then Result := TraverseConstraintValNode(Node)

    else if Name = 'tagval'       then Result := TraverseTagValNode(Node)
    else if Name = 'tagref'       then Result := TraverseTagRefNode(Node)
    else if Name = 'tagcolat'     then Result := TraverseTagRefAtNode(Node)
    else if Name = 'tagcolcount'  then Result := TraverseTagRefCountNode(Node)

    else if Name = 'set'          then Result := TraverseSetNode(Node)
    else if Name = 'if'           then Result := TraverseIfNode(Node)
    else if Name = 'for'          then Result := TraverseForNode(Node)

    else if Name = 'list'         then Result := TraverseListNode(Node)
    else if Name = 'append'       then Result := TraverseAppendNode(Node)
    else if Name = 'itemat'       then Result := TraverseItemAtNode(Node)
    else if Name = 'itemcount'    then Result := TraverseItemCountNode(Node)

    else if Name = 'setpencolor'  then Result := TraverseSetPenColorNode(Node)
    else if Name = 'setpenstyle'  then Result := TraverseSetPenStyleNode(Node)
    else if Name = 'setbrushcolor'then Result := TraverseSetBrushColorNode(Node)
    else if Name = 'setbrushstyle'then Result := TraverseSetBrushStyleNode(Node)
    else if Name = 'setfontface'  then Result := TraverseSetFontFaceNode(Node)
    else if Name = 'setfontcolor' then Result := TraverseSetFontColorNode(Node)
    else if Name = 'setfontsize'  then Result := TraverseSetFontSizeNode(Node)
    else if Name = 'setfontstyle' then Result := TraverseSetFontStyleNode(Node)

    else if Name = 'textheight'   then Result := TraverseTextHeightNode(Node)
    else if Name = 'textwidth'    then Result := TraverseTextWidthNode(Node)
    else if Name = 'pt'           then Result := TraversePointNode(Node)
    else if Name = 'moveto'       then Result := TraverseMoveToNode(Node)
    else if Name = 'lineto'       then Result := TraverseLineToNode(Node)
    else if Name = 'textout'      then Result := TraverseTextOutNode(Node)
    else if Name = 'textbound'    then Result := TraverseTextBoundNode(Node)
    else if Name = 'line'         then Result := TraverseLineNode(Node)
    else if Name = 'rect'         then Result := TraverseRectNode(Node)
    else if Name = 'filerect'     then Result := TraverseFillRectNode(Node)
    else if Name = 'ellipse'      then Result := TraverseEllipseNode(Node)
    else if Name = 'roundrect'    then Result := TraverseRoundRectNode(Node)
    else if Name = 'textrect'     then Result := TraverseTextRectNode(Node)
    else if Name = 'arc'          then Result := TraverseArcNode(Node)
    else if Name = 'pie'          then Result := TraversePieNode(Node)
    else if Name = 'ptatx'        then Result := TraversePtAtXNode(Node)
    else if Name = 'ptaty'        then Result := TraversePtAtYNode(Node)
    else if Name = 'ptcount'      then Result := TraversePtCountNode(Node)
    else if Name = 'drawedge'     then Result := TraverseDrawEdgeNode(Node)
    else if Name = 'drawobject'   then Result := TraverseDrawObjectNode(Node)
    else if Name = 'arrangeobject'   then Result := TraverseArrangeObjectNode(Node)
    else if Name = 'polyline'     then Result := TraversePolylineNode(Node)
    else if Name = 'polygon'      then Result := TraversePolygonNode(Node)
    else if Name = 'polybezier'   then Result := TraversePolyBezierNode(Node)
    else if Name = 'drawbitmap'   then Result := TraverseDrawBitmapNode(Node)
//    else if Name = 'stretchbitmap'   then Result := TraverseStretchBitmapNode(Node)
    else if Name = 'setdefaultstyle' then Result := TraverseSetDefaultStyleNode(Node)
    else ERaise(false, GetPos(Node), Name + ' unidentified operator');
  end
  // symbol or value
  else begin
    N := FindChildAt(Node, 0);
    ERaise(N <> NOT_EXISTS, GetPos(Node), 'Symbol or Value does not exist.');

    Name := LowerCase(NodeName(N));

    if Name = 'ident'             then Result := TraverseGetNode(Node)
    else if Name = 'int'          then Result := TraverseIntNode(Node)
    else if Name = 'flt'          then Result := TraverseFloatNode(Node)
    else if Name = 'str'          then Result := TraverseStringNode(Node)
    else if Name = 'bool'         then Result := TraverseBooleanNode(Node)
    else if Name = 'nil'          then Result := TraverseNilNode(Node)
    else ERaise(false, GetPos(Node), 'Unidentified type value.');
  end;
end;

function PNXReader.TraverseNotationNode(Node: Integer): PNXExpr;
var
  NotationExpr: PNXNotationExpr;
  ChildNode: Integer;
  Expr: PNXExpr;
begin
  NotationExpr := PNXNotationExpr.Create(GetPos(Node), Self.FFilepath);

  ChildNode := FindChild(Node, 'onArrange');
  ERaise(ChildNode <> NOT_EXISTS, GetPos(Node), 'onArrange expression does not exist.');

  Expr := traverseNode(ChildNode);
  NotationExpr.Add(Expr);

  ChildNode := FindChild(Node, 'onDraw');
  ERaise(ChildNode <> NOT_EXISTS, GetPos(Node), 'onDraw expression does not exist.');

  Expr := traverseNode(ChildNode);
  NotationExpr.Add(Expr);

  Result := NotationExpr;
end;

function PNXReader.TraverseSequenceNode(Node: Integer): PNXExpr;
var
  I: Integer;
  ChildNode: Integer;
  GroupExpr: PNXGroupExpr;
begin
  GroupExpr := PNXGroupExpr.Create(GetPos(Node));
  for I := 1 to ChildCount(Node)-1 do begin
    ChildNode := FindChildAt(Node, I);
    ERaise(ChildNode <> NOT_EXISTS, GetPos(Node), IntToStr(I)+'th arguement expression does not exist.');
    GroupExpr.Add(traverseNode(ChildNode));
  end;
  Result := GroupExpr;
end;

function PNXReader.TraverseIntNode(Node: Integer): PNXExpr;
var Value: Integer;
begin
  Result := nil;
  try
    Value := StrToInt(Trim( ExprNodeValue(Node) ));
  except
    ERaise(false, GetPos(Node), 'int value does not exist.');
    Value := 0;
  end;
  Result := PNXExpr.NewValue(GetPos(Node), Value);
end;

function PNXReader.TraverseFloatNode(Node: Integer): PNXExpr;
var Value: Real;
begin
  Result := nil;
  try
    Value := StrToFloat(Trim(ExprNodeValue(Node)));
  except
    ERaise(false, GetPos(Node), 'float value does not exist.');
    Value := 0.0;
  end;

  Result := PNXExpr.NewValue(GetPos(Node), Value);
end;

function PNXReader.TraverseStringNode(Node: Integer): PNXExpr;
var Value: String;
begin
  Result := nil;
  try
    Value := Trim( ExprNodeValue(Node) );
    Value := Copy(Value, 2, Length(Value)-2);

    Value := StringReplace(Value, '''''', '''', [rfReplaceAll]);
    Value := StringReplace(Value, '\t', #9, [rfReplaceAll, rfIgnoreCase]);
    Value := StringReplace(Value, '\n', #13, [rfReplaceAll, rfIgnoreCase]);
    Value := StringReplace(Value, '\r', #10, [rfReplaceAll, rfIgnoreCase]);

  except
    ERaise(false, GetPos(Node), 'string value does not exist.');
    Value := '';
  end;

  Result := PNXExpr.NewValue(GetPos(Node), Value);
end;

function PNXReader.TraverseBooleanNode(Node: Integer): PNXExpr;
var Value: Boolean;
begin
  Result := nil;
  try
    Value := StrToBool(Trim( ExprNodeValue(Node) ));
  except
    ERaise(false, GetPos(Node), 'boolean value does not exist.');
    Value := false;
  end;

  Result := PNXExpr.NewValue(GetPos(Node), Value);
end;

function PNXReader.TraverseNilNode(Node: Integer): PNXExpr;
begin
  Result := nil;
  Result := PNXExpr.NewRef(GetPos(Node), nil);
end;

function PNXReader.TraverseGetNode(Node: Integer): PNXExpr;
var
  Id: String;
  Expr: PNXGetExpr;
begin
  Result := nil;
  try
    Id := ExprNodeValue(Node);
  except
    ERaise(false, GetPos(Node), 'identifier is required.');
    Id := '';
  end;

  Expr := PNXGetExpr.Create(GetPos(Node));
  Expr.Add(PNXExpr.NewValue(GetPos(Node), Id));

  Result := Expr;
end;

function PNXReader.TraverseOperandNodes(OpExpr: PNXGroupExpr; Node: Integer): PNXExpr;
var
  ArgExpr: PNXExpr;
  I, ChildNode: Integer;
begin
  Result := nil;
  for I := 1 to ChildCount(Node)-1 do begin
    ChildNode := FindChildAt(Node, I);
    ERaise(ChildNode <> NOT_EXISTS, GetPos(Node), IntToStr(I)+'th arguement expression does not exist.');
    ArgExpr := traverseNode(ChildNode);
    OpExpr.Add(ArgExpr);
  end;
  Result := OpExpr;
end;

function PNXReader.TraverseAddNode(Node: Integer): PNXExpr;
begin
  Result := traverseOperandNodes(PNXAddExpr.Create(GetPos(Node)), Node);
end;

function PNXReader.TraverseSubtractNode(Node: Integer): PNXExpr;
begin
  Result := traverseOperandNodes(PNXSubtractExpr.Create(GetPos(Node)), Node);
end;

function PNXReader.TraverseMultiplyNode(Node: Integer): PNXExpr;
begin
  Result := traverseOperandNodes(PNXMultiplyExpr.Create(GetPos(Node)), Node);
end;

function PNXReader.TraverseDivideNode(Node: Integer): PNXExpr;
begin
  Result := traverseOperandNodes(PNXDivideExpr.Create(GetPos(Node)), Node);
end;

function PNXReader.TraverseAndNode(Node: Integer): PNXExpr;
begin
  Result := traverseOperandNodes(PNXAndExpr.Create(GetPos(Node)), Node);
end;

function PNXReader.TraverseOrNode(Node: Integer): PNXExpr;
begin
  Result := traverseOperandNodes(PNXOrExpr.Create(GetPos(Node)), Node);
end;

function PNXReader.TraverseConcatNode(Node: Integer): PNXExpr;
begin
  Result := traverseOperandNodes(PNXConcatExpr.Create(GetPos(Node)), Node);
end;

function PNXReader.TraverseSinNode(Node: Integer): PNXExpr;
begin
  Result := traverseOperandNodes(PNXSinExpr.Create(GetPos(Node)), Node);
end;

function PNXReader.TraverseCosNode(Node: Integer): PNXExpr;
begin
  Result := traverseOperandNodes(PNXCosExpr.Create(GetPos(Node)), Node);
end;

function PNXReader.TraverseTanNode(Node: Integer): PNXExpr;
begin
  Result := traverseOperandNodes(PNXTanExpr.Create(GetPos(Node)), Node);
end;

function PNXReader.TraverseTruncNode(Node: Integer): PNXExpr;
begin
  Result := traverseOperandNodes(PNXTruncExpr.Create(GetPos(Node)), Node);
end;

function PNXReader.TraverseRoundNode(Node: Integer): PNXExpr;
begin
  Result := traverseOperandNodes(PNXRoundExpr.Create(GetPos(Node)), Node);
end;

function PNXReader.TraverseTrimNode(Node: Integer): PNXExpr;
begin
  Result := traverseOperandNodes(PNXTrimExpr.Create(GetPos(Node)), Node);
end;

function PNXReader.TraverseLengthNode(Node: Integer): PNXExpr;
begin
  Result := traverseOperandNodes(PNXLengthExpr.Create(GetPos(Node)), Node);
end;

function PNXReader.TraverseTextHeightNode(Node: Integer): PNXExpr;
begin
  Result := traverseOperandNodes(PNXTextHeightExpr.Create(GetPos(Node)), Node);
end;

function PNXReader.TraverseTextWidthNode(Node: Integer): PNXExpr;
begin
  Result := traverseOperandNodes(PNXTextWidthExpr.Create(GetPos(Node)), Node);
end;

function PNXReader.TraverseNotNode(Node: Integer): PNXExpr;
begin
  Result := traverseOperandNodes(PNXNotExpr.Create(GetPos(Node)), Node);
end;

function PNXReader.TraverseEQNode(Node: Integer): PNXExpr;
begin
  Result := traverseOperandNodes(PNXEQExpr.Create(GetPos(Node)), Node);
end;

function PNXReader.TraverseNEQNode(Node: Integer): PNXExpr;
begin
  Result := traverseOperandNodes(PNXNEQExpr.Create(GetPos(Node)), Node);
end;

function PNXReader.TraverseGTNode(Node: Integer): PNXExpr;
begin
  Result := traverseOperandNodes(PNXGTExpr.Create(GetPos(Node)), Node);
end;

function PNXReader.TraverseGENode(Node: Integer): PNXExpr;
begin
  Result := traverseOperandNodes(PNXGEExpr.Create(GetPos(Node)), Node);
end;

function PNXReader.TraverseLTNode(Node: Integer): PNXExpr;
begin
  Result := traverseOperandNodes(PNXLTExpr.Create(GetPos(Node)), Node);
end;

function PNXReader.TraverseLENode(Node: Integer): PNXExpr;
begin
  Result := traverseOperandNodes(PNXLEExpr.Create(GetPos(Node)), Node);
end;

function PNXReader.TraverseMOFAttrNode(Node: Integer): PNXExpr;
begin
  Result := traverseOperandNodes(PNXMOFAttrExpr.Create(GetPos(Node)), Node);
end;

function PNXReader.TraverseMOFSetAttrNode(Node: Integer): PNXExpr;
begin
  Result := traverseOperandNodes(PNXMOFSetAttrExpr.Create(GetPos(Node)), Node);
end;

function PNXReader.TraverseMOFRefNode(Node: Integer): PNXExpr;
begin
  Result := traverseOperandNodes(PNXMOFRefExpr.Create(GetPos(Node)), Node);
end;

function PNXReader.TraverseMOFColAtNode(Node: Integer): PNXExpr;
begin
  Result := traverseOperandNodes(PNXMOFColAtExpr.Create(GetPos(Node)), Node);
end;

function PNXReader.TraverseMOFColCountNode(Node: Integer): PNXExpr;
begin
  Result := traverseOperandNodes(PNXMOFColCountExpr.Create(GetPos(Node)), Node);
end;

function PNXReader.TraverseConstraintValNode(Node: Integer): PNXExpr;
begin
  Result := traverseOperandNodes(PNXConstraintValExpr.Create(GetPos(Node)), Node);
end;

function PNXReader.TraverseTagValNode(Node: Integer): PNXExpr;
begin
  Result := traverseOperandNodes(PNXTagValExpr.Create(GetPos(Node)), Node);
end;

function PNXReader.TraverseTagRefNode(Node: Integer): PNXExpr;
begin
  Result := traverseOperandNodes(PNXTagRefExpr.Create(GetPos(Node)), Node);
end;

function PNXReader.TraverseTagRefAtNode(Node: Integer): PNXExpr;
begin
  Result := traverseOperandNodes(PNXTagRefAtExpr.Create(GetPos(Node)), Node);
end;

function PNXReader.TraverseTagRefCountNode(Node: Integer): PNXExpr;
begin
  Result := traverseOperandNodes(PNXTagRefCountExpr.Create(GetPos(Node)), Node);
end;

function PNXReader.TraverseSetNode(Node: Integer): PNXExpr;
begin
  Result := traverseOperandNodes(PNXSetExpr.Create(GetPos(Node)), Node);
end;

function PNXReader.TraverseIfNode(Node: Integer): PNXExpr;
begin
  Result := traverseOperandNodes(PNXIfExpr.Create(GetPos(Node)), Node);
end;

function PNXReader.TraverseForNode(Node: Integer): PNXExpr;
begin
  Result := traverseOperandNodes(PNXForExpr.Create(GetPos(Node)), Node);
end;

function PNXReader.TraverseListNode(Node: Integer): PNXExpr;
begin
  Result := traverseOperandNodes(PNXListExpr.Create(GetPos(Node)), Node);
end;

function PNXReader.TraverseAppendNode(Node: Integer): PNXExpr;
begin
  Result := traverseOperandNodes(PNXAppendExpr.Create(GetPos(Node)), Node);
end;

function PNXReader.TraverseItemAtNode(Node: Integer): PNXExpr;
begin
  Result := traverseOperandNodes(PNXItemAtExpr.Create(GetPos(Node)), Node);
end;

function PNXReader.TraverseItemCountNode(Node: Integer): PNXExpr;
begin
  Result := traverseOperandNodes(PNXItemCountExpr.Create(GetPos(Node)), Node);
end;

function PNXReader.TraverseTokenizeNode(Node: Integer): PNXExpr;
begin
  Result := traverseOperandNodes(PNXTokenizeExpr.Create(GetPos(Node)), Node);
end;

function PNXReader.TraverseSetPenColorNode(Node: Integer): PNXExpr;
begin
  Result := traverseOperandNodes(PNXSetPenColorExpr.Create(GetPos(Node)), Node);
end;

function PNXReader.TraverseSetPenStyleNode(Node: Integer): PNXExpr;
begin
  Result := traverseOperandNodes(PNXSetPenStyleExpr.Create(GetPos(Node)), Node);
end;

function PNXReader.TraverseSetBrushColorNode(Node: Integer): PNXExpr;
begin
  Result := traverseOperandNodes(PNXSetBrushColorExpr.Create(GetPos(Node)), Node);
end;

function PNXReader.TraverseSetBrushStyleNode(Node: Integer): PNXExpr;
begin
  Result := traverseOperandNodes(PNXSetBrushStyleExpr.Create(GetPos(Node)), Node);
end;

function PNXReader.TraverseSetFontFaceNode(Node: Integer): PNXExpr;
begin
  Result := traverseOperandNodes(PNXSetFontFaceExpr.Create(GetPos(Node)), Node);
end;

function PNXReader.TraverseSetFontColorNode(Node: Integer): PNXExpr;
begin
  Result := traverseOperandNodes(PNXSetFontColorExpr.Create(GetPos(Node)), Node);
end;

function PNXReader.TraverseSetFontStyleNode(Node: Integer): PNXExpr;
begin
  Result := traverseOperandNodes(PNXSetFontStyleExpr.Create(GetPos(Node)), Node);
end;

function PNXReader.TraverseSetFontSizeNode(Node: Integer): PNXExpr;
begin
  Result := traverseOperandNodes(PNXSetFontSizeExpr.Create(GetPos(Node)), Node);
end;

function PNXReader.TraversePointNode(Node: Integer): PNXExpr;
begin
  Result := traverseOperandNodes(PNXPointExpr.Create(GetPos(Node)), Node);
end;

function PNXReader.TraverseMoveToNode(Node: Integer): PNXExpr;
begin
  Result := traverseOperandNodes(PNXMoveToExpr.Create(GetPos(Node)), Node);
end;

function PNXReader.TraverseLineToNode(Node: Integer): PNXExpr;
begin
  Result := traverseOperandNodes(PNXLineToExpr.Create(GetPos(Node)), Node);
end;

function PNXReader.TraverseTextOutNode(Node: Integer): PNXExpr;
begin
  Result := traverseOperandNodes(PNXTextOutExpr.Create(GetPos(Node)), Node);
end;

function PNXReader.TraverseTextBoundNode(Node: Integer): PNXExpr;
begin
  Result := traverseOperandNodes(PNXTextBoundExpr.Create(GetPos(Node)), Node);
end;

function PNXReader.TraverseLineNode(Node: Integer): PNXExpr;
begin
  Result := traverseOperandNodes(PNXLineExpr.Create(GetPos(Node)), Node);
end;

function PNXReader.TraverseRectNode(Node: Integer): PNXExpr;
begin
  Result := traverseOperandNodes(PNXRectExpr.Create(GetPos(Node)), Node);
end;

function PNXReader.TraverseFillRectNode(Node: Integer): PNXExpr;
begin
  Result := traverseOperandNodes(PNXFillRectExpr.Create(GetPos(Node)), Node);
end;

function PNXReader.TraverseEllipseNode(Node: Integer): PNXExpr;
begin
  Result := traverseOperandNodes(PNXEllipseExpr.Create(GetPos(Node)), Node);
end;

function PNXReader.TraverseRoundRectNode(Node: Integer): PNXExpr;
begin
  Result := traverseOperandNodes(PNXRoundRectExpr.Create(GetPos(Node)), Node);
end;

function PNXReader.TraverseTextRectNode(Node: Integer): PNXExpr;
begin
  Result := traverseOperandNodes(PNXTextRectExpr.Create(GetPos(Node)), Node);
end;

function PNXReader.TraverseArcNode(Node: Integer): PNXExpr;
begin
  Result := traverseOperandNodes(PNXArcExpr.Create(GetPos(Node)), Node);
end;

function PNXReader.TraversePieNode(Node: Integer): PNXExpr;
begin
  Result := traverseOperandNodes(PNXPieExpr.Create(GetPos(Node)), Node);
end;

function PNXReader.TraversePtAtXNode(Node: Integer): PNXExpr;
begin
  Result := traverseOperandNodes(PNXPtAtXExpr.Create(GetPos(Node)), Node);
end;

function PNXReader.TraversePtAtYNode(Node: Integer): PNXExpr;
begin
  Result := traverseOperandNodes(PNXPtAtYExpr.Create(GetPos(Node)), Node);
end;

function PNXReader.TraversePtCountNode(Node: Integer): PNXExpr;
begin
  Result := traverseOperandNodes(PNXPtCountExpr.Create(GetPos(Node)), Node);
end;

function PNXReader.TraverseDrawEdgeNode(Node: Integer): PNXExpr;
begin
  Result := traverseOperandNodes(PNXDrawEdgeExpr.Create(GetPos(Node)), Node);
end;

function PNXReader.TraverseDrawObjectNode(Node: Integer): PNXExpr;
begin
  Result := traverseOperandNodes(PNXDrawObjectExpr.Create(GetPos(Node)), Node);
end;

function PNXReader.TraverseArrangeObjectNode(Node: Integer): PNXExpr;
begin
  Result := traverseOperandNodes(PNXArrangeObjectExpr.Create(GetPos(Node)), Node);
end;

function PNXReader.TraversePolylineNode(Node: Integer): PNXExpr;
begin
  Result := traverseOperandNodes(PNXPolylineExpr.Create(GetPos(Node)), Node);
end;

function PNXReader.TraversePolygonNode(Node: Integer): PNXExpr;
begin
  Result := traverseOperandNodes(PNXPolygonExpr.Create(GetPos(Node)), Node);
end;

function PNXReader.TraversePolyBezierNode(Node: Integer): PNXExpr;
begin
  Result := traverseOperandNodes(PNXPolyBezierExpr.Create(GetPos(Node)), Node);
end;

function PNXReader.TraverseDrawBitmapNode(Node: Integer): PNXExpr;
begin
  Result := traverseOperandNodes(PNXDrawBitmapExpr.Create(GetPos(Node), FFilepath), Node);
end;

function PNXReader.TraverseSetDefaultStyleNode(Node: Integer): PNXExpr;
begin
  Result := traverseOperandNodes(PNXSetDefaultStyleExpr.Create(GetPos(Node)), Node);
end;

initialization
  NXManager := PNXManager.Create;

finalization
  NXManager.Free;
end.
