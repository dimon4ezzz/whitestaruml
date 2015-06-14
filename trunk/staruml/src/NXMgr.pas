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
  System.SysUtils, System.Classes, System.Variants, Vcl.Graphics,
  Winapi.ActiveX, System.Win.ComObj, Generics.Collections,
  Core, GraphicClasses, WhiteStarUML_TLB, StdVcl;

type
  { class forward declarations }

  PNXSymbolTable = class;
  PNXVisitor = interface;

  // Principal Base Expression Classes ...................................................

  // PNXExpr
  // Represents an atomic value or is the base class for an aggregated expression
  PNXExpr = class
  private type
    PValueType = (vtValue, vtReference);
  private
    FPrimitiveValue: Variant; // for value type
    FObjectValue: TObject; // for reference type
    FType: PValueType;  // Flags whether FPrimitiveValue or FObjectValue is used
    FPos: Integer; // Line in input source at which expression is located
 public
    constructor Create(Position: Integer);
    class function NewValue(Position: Integer; Value: Variant): PNXExpr; // for value type
    class function NewRef(Position: Integer; Value: TObject): PNXExpr; // for reference type

    procedure Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable); virtual;
    function IsValueType: Boolean;
    procedure SetValue(Value: Variant);
    procedure SetReference(Value: TObject);
    procedure SetValueType(Value: PValueType);
    function GetValue: Variant;
    function GetReference: TObject;
    procedure Accept(Visitor: PNXVisitor); virtual;

    property Position: Integer read FPos;
    property Value: Variant read GetValue write SetValue;
    property Reference: TObject read GetReference write SetReference;
  end;

  // PNXGroupExpr
  PNXGroupExpr = class(PNXExpr)
  private type
    TExprList = TList<PNXExpr>;
  private
    FExprList: TExprList;
    function GetExprs(Index: Integer): PNXExpr;
    function GetExprCount: Integer;
  protected
  public
    constructor Create(Position: Integer); overload;
    constructor Create(); overload;
    destructor Destroy; override;
    procedure Add(Expr: PNXExpr);
    procedure Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable); override;
    procedure Accept(Visitor: PNXVisitor); override;
    property Exprs[Index: Integer]: PNXExpr read GetExprs;
    property Count: Integer read GetExprCount;
  end;

  // PNXNotationExpr
  PNXNotationExpr = class(PNXGroupExpr)
  private
    FFilename: String;
  public
    constructor Create(Position: Integer; Filepath: String); reintroduce;
    procedure Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable); override;
    procedure Accept(Visitor: PNXVisitor); override;
    property Filename: String read FFilename write FFilename;
  end;

  // PNXException
  PNXException = class(Exception)
  end;

  // PNXSymbolTable
  PNXSymbolTable = class(TObject)
  private type
    PNXExprDictionary = TDictionary<string, PNXExpr>;
  private
    FDictionary : PNXExprDictionary;
  public
    Constructor Create;
    Destructor Destroy; override;
    function Exist(Key: String): Boolean;
    procedure Add(Key: String; Value: PNXExpr);
    procedure Remove(Key: String);
    function GetValue(Key: String): PNXExpr;
    procedure SetValue(Key: String; Value: PNXExpr);
  end;

    // PNXManager
  PNXManager = class
  private type
    PGraphics = TDictionary<string,TGraphic>;
  private
    FGraphics: PGraphics;
    FFilename: String;

    function ReadExprWithGoldParser(FilePath: String): PNXNotationExpr;

  public
    constructor Create;
    destructor Destroy; override;
    function ReadExpr(FilePath: String): PNXNotationExpr;
    procedure DrawExpr(Canvas: PCanvas; View: PView; Expr: PNXNotationExpr);

    function ExistGraphic(Key: String): Boolean;
    procedure AddGraphic(Key: String; Value: TGraphic);
    function GetGraphic(Key: String): TGraphic;
  end;

  PNXBuilder = class
  private type
    PCurrentGroupExprStack = TStack<PNXGroupExpr>;
  private
    FCurrentGroupExprStack: PCurrentGroupExprStack;
    FNotationTree: PNXNotationExpr;

  public
    procedure BuildNotationExpr(Filepath: string; Pos: Integer);
    procedure BuildGroupExpr<ExprType: constructor,PNXGroupExpr>(Pos:Integer);
    procedure BuildIdentExpr(Id: string; Pos: Integer);
    procedure BuildPrimExpr(Value: Variant; Pos: Integer);
    procedure BuildDrawBitmapExpr(Filepath: string; Pos: Integer);

    procedure NewOperation(Oper: string; Pos: Integer);
    procedure EndOperation;

    constructor Create;
    destructor Destroy; override;
    procedure FreeNotationTree;
    property NotationTree: PNXNotationExpr read FNotationTree;
  end;

  // Implementation of COM interface ITExprBuilder to PNXBuilder
  TExprBuilder = class(TTypedComObject, IExprBuilder)
  private
    FNXBuilder: PNXBuilder;
    function GetNotationTree: PNXNotationExpr;
  protected
    function NewOperation(const Oper: WideString; Pos: SYSINT): HResult; stdcall;
    function NewNotationOperation(const Filepath: WideString; Pos: SYSINT): HResult; stdcall;
    function EndOperation: HResult; stdcall;
    function PrimExpr(Value: OleVariant; Pos: SYSINT): HResult; stdcall;
    function IdentExpr(const Id: WideString; Pos: SYSINT): HResult; stdcall;
    function NewDrawBitmapOperation(const FilePath: WideString; Pos: SYSINT): HResult; stdcall;
  public
    property NotationTree: PNXNotationExpr read GetNotationTree;
    procedure FreeNotationTree;
    destructor Destroy; override;
  end;


  // Public visitor interface
  PNXVisitor = interface
  ['{73DDC1FF-78E7-4C4D-BDC7-7F28C7806D4E}']
    procedure VisitExpr(Expr: PNXExpr);
    procedure VisitGroupExpr(Expr: PNXGroupExpr);
    procedure VisitNotationExpr(Expr: PNXNotationExpr);
  end;

  // Utility to create a visitor dumping expression tree to given file
  function CreateObjDumpVisitor (OutputStream: TStream): PNXVisitor;



var
  NXManager: PNXManager;

// implementation declaration

implementation

uses
  System.Types, System.UITypes, System.StrUtils, System.Math, VCL.Forms,
  System.Win.ComServ, XML.XMLDoc, XML.XMLIntf, Vcl.Imaging.jpeg, Vcl.Imaging.pngimage,
  ParserCore_TLB, LogMgr, ExtCore, ViewCore, NLS_StarUML;

const
  NOT_EXISTS = 0;

const
  EMF_FILE = '.emf';
  WMF_FILE = '.wmf';
  BMP_FILE = '.bmp';
  JPG_FILE = '.jpg';
  JPEG_FILE = '.jpeg';
  PNG_FILE = '.png';

procedure ERaise(Condition: Boolean; LineNo: Integer; Message: String); forward;
function SimilarType(V1, V2: Variant): Boolean; forward;

type
  // Controller Classes ........................................................


  // PNXEvaluator
  PNXEvaluator = class
  public
    procedure Evaluate(Canvas: PCanvas; View: PView; Expr: PNXNotationExpr);
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
    constructor Create(Position: Integer);
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
  public
    constructor Create(Position: Integer; Filepath: String);  reintroduce;
    procedure Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable); override;
    procedure Accept(Visitor: PNXVisitor); override;
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

  /////////////////////////////////////////////////////////////////////
  // Visitors

  // Visitor interface augmented with internal functions
  PNXVisitorComplete = class (TInterfacedObject, PNXVisitor)
  public
    // Redeclaration of PNXVisitor
    procedure VisitExpr(Expr: PNXExpr); virtual; abstract;
    procedure VisitGroupExpr(Expr: PNXGroupExpr); virtual; abstract;
    procedure VisitNotationExpr(Expr: PNXNotationExpr); virtual; abstract;

  private
    // Handling of internal expression types
    procedure VisitDrawBitmapExpr(Expr: PNXDrawBitmapExpr); virtual; abstract;
  end;


  // Visitor dumping expression tree to a file
  PNXObjDumpVisitor = class(PNXVisitorComplete)
  private
    FOutputStream: TStream;
    FOutputStreamWriter: TStreamWriter;
    FIndent: string;
  public
    // Implementation of PNXVisitor
    procedure VisitExpr(Expr: PNXExpr); override;
    procedure VisitGroupExpr(Expr: PNXGroupExpr); override;
    procedure VisitNotationExpr(Expr: PNXNotationExpr); override;

    constructor Create(OutputStream: TStream);
    destructor Destroy; override;

  private
    procedure VisitDrawBitmapExpr(Expr: PNXDrawBitmapExpr); override;

  end;


////////////////////////////////////////////////////////////////////////////////
// implementation definition

{ PNXManager }

constructor PNXManager.Create;
begin
  inherited;
  FGraphics := PGraphics.Create;
end;

destructor PNXManager.Destroy;
var
  Graphic: TGraphic;
begin
  for Graphic in FGraphics.Values do
    Graphic.Free;
  FGraphics.Free;
  inherited;
end;

function PNXManager.ReadExpr(FilePath: String): PNXNotationExpr;
begin
  Result := ReadExprWithGoldParser(FilePath)
end;

function PNXManager.ReadExprWithGoldParser(FilePath: String): PNXNotationExpr;
var
  Builder: IExprBuilder;
  BuilderInstance: TExprBuilder; // Shortcut to object implementing ITExprBuilder
  Parser: TNxParser;
  ParseStatus: WordBool;
{$IFDEF DEBUGNX}
  ObjDumpVisitor: PNXVisitor;
  FileStream : TFileStream;
{$ENDIF DEBUGNX}
begin
    Result := nil;
    Builder := CoExprBuilder.Create;
    BuilderInstance := Builder as TExprBuilder;
    //Builder := TTExprBuilder.Create;
    Parser := TNxParser.Create(nil);
    ParseStatus := Parser.Parse(FilePath, Builder);
    Parser.Free;
    if not ParseStatus then begin
      BuilderInstance.FreeNotationTree;
      LogManager.Log('Failed loading of file: ' + ExtractFilename(Filepath))
    end
    else begin
      Result := BuilderInstance.NotationTree;
{$IFDEF DEBUGNX}
      FileStream := TFileStream.Create(Result.Filename + '.Dump.txt',fmCreate);
      ObjDumpVisitor := NXMgr.CreateObjDumpVisitor(FileStream);
      Result.Accept(ObjDumpVisitor);
      FileStream.Free;
{$ENDIF DEBUGNX}
    end;


end;


procedure PNXManager.DrawExpr(Canvas: PCanvas; View: PView; Expr: PNXNotationExpr);
var
  Evaluator: PNXEvaluator;
begin
  Evaluator := nil;
  try
    FFilename := Expr.Filename;
    Evaluator := PNXEvaluator.Create;
    Evaluator.Evaluate(Canvas, View, Expr);
    Evaluator.Free;
    Evaluator := nil;
  except
    LogManager.Log('Drawing failed: ' + Expr.FFilename);
  end;
  if Evaluator <> nil then Evaluator.Free;
end;

procedure PNXManager.AddGraphic(Key: String; Value: TGraphic);
begin
  Key := LowerCase(Key);
  FGraphics.Add(Key, Value);
end;

function PNXManager.ExistGraphic(Key: String): Boolean;
begin
  Key := LowerCase(Key);
  Result := FGraphics.ContainsKey(Key);
end;

function PNXManager.GetGraphic(Key: String): TGraphic;
var
  Graphic: TGraphic;
begin
  Key := LowerCase(Key);
  if FGraphics.TryGetValue(Key, Graphic) = True then
    Result := Graphic
  else begin
    Result := nil;
    ERaise(False, 0, Key+' image does not exist.');
  end;
end;

{ PNXEvaluator }

procedure PNXEvaluator.Evaluate(Canvas: PCanvas; View: PView; Expr: PNXNotationExpr);
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
  Expr.Evaluate(Canvas, SymbolTable);

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

  FDictionary := PNXExprDictionary.Create;
end;

destructor PNXSymbolTable.Destroy;
var
  Expr: PNXExpr;
begin
  for Expr in FDictionary.Values do
    Expr.Free;

  FDictionary.Free;
  inherited;
end;

function PNXSymbolTable.GetValue(Key: String): PNXExpr;
var
  Expr: PNXExpr;
begin
  Key := LowerCase(Key);
  if FDictionary.TryGetValue(Key, Expr) = True then
    Result := Expr
  else begin
    Result := nil;
    ERaise(False, 0, Key+' variable does not exist.');
  end;
end;

function PNXSymbolTable.Exist(Key: String): Boolean;
begin
  Key := LowerCase(Key);
  Result := FDictionary.ContainsKey(Key);
end;

procedure PNXSymbolTable.Add(Key: String; Value: PNXExpr);
begin
  Key := LowerCase(Key);
  FDictionary.Add(Key,Value);
end;

procedure PNXSymbolTable.SetValue(Key: String; Value: PNXExpr);
var
  Expr: PNXExpr;
begin
  Key := LowerCase(Key);
  if Exist(Key) then begin
    Expr := FDictionary[Key];
    Expr.Free;
    FDictionary[Key] := Value;
  end
  else
    Add(Key, Value);
end;

procedure PNXSymbolTable.Remove(Key: String);
var
  Expr: PNXExpr;
begin
  Key := LowerCase(Key);
  if Exist(Key) then begin
    Expr := FDictionary[Key];
    Expr.Free;
    FDictionary.Remove(Key);
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
      varOleStr: R := true;
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
        varOleStr: R := true;
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

procedure PNXExpr.Accept(Visitor: PNXVisitor);
begin
  Visitor.VisitExpr(Self);
end;

constructor PNXExpr.Create(Position: Integer);
begin
  FPos := Position;
  FPrimitiveValue := Unassigned;
  FObjectValue := nil;
  FType := vtReference;
end;

procedure PNXExpr.Evaluate(Canvas: PCanvas; SymbolTable: PNXSymbolTable);
begin
  // do nothing ...
end;

class function PNXExpr.NewRef(Position: Integer; Value: TObject): PNXExpr;
begin
  Result := PNXExpr.Create(Position);
  Result.SetReference(Value);
end;

class function PNXExpr.NewValue(Position: Integer; Value: Variant): PNXExpr;
begin
  Result := PNXExpr.Create(Position);
  Result.SetValue(Value);
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
    Result := '['+ClassName+'@'+IntToHex(Integer(@Self),2)+']';
end;

procedure PNXExpr.SetReference(Value: TObject);
begin
  FObjectValue := Value;
  SetValueType(vtReference);
end;

procedure PNXExpr.SetValue(Value: Variant);
begin
  FPrimitiveValue :=  Value;
  SetValueType(vtValue);
end;

function PNXExpr.IsValueType: Boolean;
begin
  Result := FType = vtValue;
end;

procedure PNXExpr.SetValueType(Value: PValueType);
begin
  FType := Value;
end;

{ PNXNotationExpr }

procedure PNXNotationExpr.Accept(Visitor: PNXVisitor);
begin
  Visitor.VisitNotationExpr(Self);
  inherited;
end;

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
  FExprList := TExprList.Create;
end;

constructor PNXGroupExpr.Create;
begin
  inherited Create(-1);
  FExprList := TExprList.Create;
end;

destructor PNXGroupExpr.Destroy;
var
  Expr: PNXExpr;
begin
  for Expr in FExprList do
    Expr.Free;

  FExprList.Free;
  inherited;
end;

procedure PNXGroupExpr.Accept(Visitor: PNXVisitor);
begin
   Visitor.VisitGroupExpr(Self);
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
  Result := FExprList[Index];
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
      FExprList[I].Evaluate(Canvas, SymbolTable);

    if (C-1) >= 0 then begin
      Expr := FExprList[C-1];
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
  Expr: PNXExpr;
begin
  if not FEvaluated then begin
    try
       for Expr in FExprList do
         Expr.Evaluate(Canvas, SymbolTable);
    except
      ERaise(False, FPos, 'Error exists in the arguments.');
    end;

    FType := vtReference;
    FEValuated := True;
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

    if Assigned(TaggedValue) and (TaggedValue.ReferenceValueCount > 0) then
      SetReference(TaggedValue.ReferenceValues[0])
    else
      SetReference(nil)

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

    if Assigned(TaggedValue) and (TaggedValue.ReferenceValueCount > Exprs[4].GetValue) then
      SetReference(TaggedValue.ReferenceValues[Exprs[4].GetValue])
    else
      SetReference(nil)

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

    if Assigned(TaggedValue) then
      SetValue(TaggedValue.ReferenceValueCount)
    else
      SetValue(0)

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
    SymbolTable.SetValue(Id, PNXExpr.NewValue(Exprs[0].Position, 0));
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

procedure PNXDrawBitmapExpr.Accept(Visitor: PNXVisitor);
begin
  (Visitor as PNXVisitorComplete).VisitDrawBitmapExpr(Self);
  inherited;
end;

constructor PNXDrawBitmapExpr.Create(Position: Integer; Filepath: String);
begin
  inherited Create(Position);
  FGraphic := nil;
  FFilepath := ExtractFilepath(Filepath);
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
            ERaise(false, FPos, Format(C_ERR_FILE_NOT_FOUND,[Fullpath]));
          end;
        end
        else if (Ext = BMP_FILE) or (Ext = JPG_FILE) or (Ext = JPEG_FILE)
        or (Ext = PNG_FILE) then begin
          try
            if (Ext = BMP_FILE) then begin
              FGraphic := Vcl.Graphics.TBitmap.Create;
              (FGraphic as TBitmap).TransparentColor := clFuchsia;
              (FGraphic as TBitmap).TransparentMode := tmAuto;
              FGraphic.Transparent := Transparent;
              FGraphic.LoadFromFile(Fullpath);
            end

            else if (Ext = JPG_FILE) or (Ext = JPEG_FILE) then begin
              // Jpg does not handle transparency
              FGraphic := Vcl.Imaging.jpeg.TJPEGImage.Create;
            end

            else if (Ext = PNG_FILE) then begin
              // Png allows to set transparent color in image
              FGraphic := Vcl.Imaging.pngimage.TPngImage.Create;
            end
            else
              Assert (False);

            FGraphic.Transparent := Transparent;
            FGraphic.LoadFromFile(Fullpath);

          except
            // Invalid Graphic File Format
            FGraphic.Free;
            FGraphic := nil;
            ERaise(false, FPos, Format(C_ERR_FILE_NOT_FOUND,[Fullpath]));
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
        Points[I].X := P.PointData[I].X;
        Points[I].Y := P.PointData[I].Y;
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
        Points[I].X := P.PointData[I].X;
        Points[I].Y := P.PointData[I].Y;
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
  I, C, AC: Integer;
  Points: array[0..255] of TPoint;
  P: PPoints;

  function AddPoints(C: Integer): Integer;
  var I, M, R: Integer;
  begin
    if C <= 4 then
      R := abs((C-4) mod 3)
    else
      R := 3 - ((C-4) mod 3);
    if R > 0 then begin
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
        Points[I].X := P.PointData[I].X;
        Points[I].Y := P.PointData[I].Y;
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
    SetValue((Value.GetReference as PPoints).PointData[Index].X);
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
    SetValue((Value.GetReference as PPoints).PointData[Index].Y);
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
        RT := Rect(PointData[Count-1].X, PointData[Count-1].Y,
                   PointData[Count-2].X, PointData[Count-2].Y)
      else if HeadValue = 'tail' then
        RT := Rect(PointData[0].X, PointData[0].Y,
                   PointData[1].X, PointData[1].Y)
      else begin
        if (Count mod 2) = 0 then begin
          P := (Count div 2)-1;
          RT := Rect(
                (PointData[P].X + PointData[P+1].X) div 2,
                (PointData[P].Y + PointData[P+1].Y) div 2,
                PointData[P+1].X,
                PointData[P+1].Y);
        end
        else begin
          P := Count div 2;
          RT := Rect(
                PointData[P].X,
                PointData[P].Y,
                PointData[P+1].X,
                PointData[P+1].Y);
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


{ PNXBuilder }

procedure PNXBuilder.BuildDrawBitmapExpr(Filepath: string; Pos: Integer);
var
  Expr: PNXDrawBitmapExpr;
begin
  Expr := PNXDrawBitmapExpr.Create(Pos, Filepath);
  FCurrentGroupExprStack.Push(Expr);
end;


procedure PNXBuilder.BuildGroupExpr<ExprType>(Pos: Integer);
var
  Expr: ExprType;
begin
  Expr := ExprType.Create;
  Expr.FPos := Pos;
  FCurrentGroupExprStack.Push(Expr);
end;


procedure PNXBuilder.BuildIdentExpr(Id: string; Pos: Integer);
var
  Expr: PNXGetExpr;
begin
  Expr := PNXGetExpr.Create(Pos);
  Expr.Add(PNXExpr.NewValue(Pos, Id));
  FCurrentGroupExprStack.Peek.Add(Expr);
end;



procedure PNXBuilder.BuildNotationExpr(Filepath: string; Pos: Integer);
var
  NotationExpr: PNXNotationExpr;
begin
  NotationExpr := PNXNotationExpr.Create(Pos, Filepath);
  FCurrentGroupExprStack.Push(NotationExpr);
end;


procedure PNXBuilder.BuildPrimExpr(Value: Variant; Pos: Integer);
var
  Expr: PNXExpr;
begin
  if VarType(Value) = varEmpty then
    Expr := PNXExpr.NewRef(Pos, nil)
  else if VarType(Value) = varOleStr then
    Expr := PNXExpr.NewValue(Pos, VarAsType(Value, varUString))  // Convert OLE strings

  else
    Expr := PNXExpr.NewValue(Pos, Value);

  FCurrentGroupExprStack.Peek.Add(Expr);
end;


procedure PNXBuilder.EndOperation;
var
  GroupExpr: PNXGroupExpr;
  NewStackTop: PNXGroupExpr;
begin
   GroupExpr := FCurrentGroupExprStack.Pop;

  // Was it the last one?
  if FCurrentGroupExprStack.Count = 0 then
    FNotationTree := GroupExpr as PNXNotationExpr
  else begin
    NewStackTop := FCurrentGroupExprStack.Peek;
    NewStackTop.Add(GroupExpr);
  end;
end;

procedure PNXBuilder.FreeNotationTree;
begin
  FreeAndNil(FNotationTree);
end;

procedure PNXBuilder.NewOperation(Oper: string; Pos: Integer);
var
  OperName: String;
begin
  OperName := LowerCase(Oper);

  if OperName = 'onarrange' then BuildGroupExpr<PNXGroupExpr>(Pos)
  else if OperName = 'ondraw' then BuildGroupExpr<PNXGroupExpr>(Pos)

  else if OperName = 'sequence' then BuildGroupExpr<PNXGroupExpr>(Pos)

  else if OperName = '+' then  BuildGroupExpr<PNXAddExpr>(Pos)
  else if OperName = '-' then BuildGroupExpr<PNXSubtractExpr>(Pos)
  else if OperName = '*' then BuildGroupExpr<PNXMultiplyExpr>(Pos)
  else if OperName = '/' then BuildGroupExpr<PNXDivideExpr>(Pos)
  else if OperName = 'and' then BuildGroupExpr<PNXAndExpr>(Pos)
  else if OperName = 'or' then BuildGroupExpr<PNXOrExpr>(Pos)
  else if OperName = 'not' then BuildGroupExpr<PNXNotExpr>(Pos)
  else if OperName = '=' then BuildGroupExpr<PNXEQExpr>(Pos)
  else if OperName = '!=' then BuildGroupExpr<PNXNEQExpr>(Pos)
  else if OperName = '>' then BuildGroupExpr<PNXGTExpr>(Pos)
  else if OperName = '>=' then BuildGroupExpr<PNXGEExpr>(Pos)
  else if OperName = '<' then BuildGroupExpr<PNXLTExpr>(Pos)
  else if OperName = '<=' then BuildGroupExpr<PNXLEExpr>(Pos)

  else if OperName = 'sin' then BuildGroupExpr<PNXSinExpr>(Pos)
  else if OperName = 'cos' then BuildGroupExpr<PNXCosExpr>(Pos)
  else if OperName = 'tan' then BuildGroupExpr<PNXTanExpr>(Pos)

  else if OperName = 'concat' then BuildGroupExpr<PNXConcatExpr>(Pos)
  else if OperName = 'trunc' then BuildGroupExpr<PNXTruncExpr>(Pos)
  else if OperName = 'round' then BuildGroupExpr<PNXRoundExpr>(Pos)
  else if OperName = 'trim' then BuildGroupExpr<PNXTrimExpr>(Pos)
  else if OperName = 'length' then BuildGroupExpr<PNXLengthExpr>(Pos)
  else if OperName = 'tokenize' then BuildGroupExpr<PNXTokenizeExpr>(Pos)

  else if OperName = 'mofattr' then BuildGroupExpr<PNXMOFAttrExpr>(Pos)
  else if OperName = 'mofsetattr' then BuildGroupExpr<PNXMOFSetAttrExpr>(Pos)
  else if OperName = 'mofref' then BuildGroupExpr<PNXMOFRefExpr>(Pos)
  else if OperName = 'mofcolat' then BuildGroupExpr<PNXMOFColAtExpr>(Pos)
  else if OperName = 'mofcolcount' then BuildGroupExpr<PNXMOFColCountExpr>(Pos)

  else if OperName = 'constraintval' then BuildGroupExpr<PNXConstraintValExpr>(Pos)

  else if OperName = 'tagval' then BuildGroupExpr<PNXTagValExpr>(Pos)
  else if OperName = 'tagref' then BuildGroupExpr<PNXTagRefExpr>(Pos)
  else if OperName = 'tagcolat' then BuildGroupExpr<PNXTagRefAtExpr>(Pos)
  else if OperName = 'tagcolcount' then BuildGroupExpr<PNXTagRefCountExpr>(Pos)

  else if OperName = 'set' then BuildGroupExpr<PNXSetExpr>(Pos)
  else if OperName = 'if' then BuildGroupExpr<PNXifExpr>(Pos)
  else if OperName = 'for' then BuildGroupExpr<PNXForExpr>(Pos)

  else if OperName = 'list' then BuildGroupExpr<PNXListExpr>(Pos)
  else if OperName = 'append' then BuildGroupExpr<PNXAppendExpr>(Pos)
  else if OperName = 'itemat' then BuildGroupExpr<PNXItemAtExpr>(Pos)
  else if OperName = 'itemcount' then BuildGroupExpr<PNXItemCountExpr>(Pos)

  else if OperName = 'setpencolor' then BuildGroupExpr<PNXSetPenColorExpr>(Pos)
  else if OperName = 'setpenstyle' then BuildGroupExpr<PNXSetPenStyleExpr>(Pos)
  else if OperName = 'setbrushcolor' then BuildGroupExpr<PNXSetBrushColorExpr>(Pos)
  else if OperName = 'setbrushstyle' then BuildGroupExpr<PNXSetBrushStyleExpr>(Pos)
  else if OperName = 'setfontface' then BuildGroupExpr<PNXSetFontFaceExpr>(Pos)
  else if OperName = 'setfontcolor' then BuildGroupExpr<PNXSetFontColorExpr>(Pos)
  else if OperName = 'setfontsize' then BuildGroupExpr<PNXSetFontSizeExpr>(Pos)
  else if OperName = 'setfontstyle' then BuildGroupExpr<PNXSetFontStyleExpr>(Pos)

  else if OperName = 'textheight' then BuildGroupExpr<PNXTextHeightExpr>(Pos)
  else if OperName = 'textwidth' then BuildGroupExpr<PNXTextWidthExpr>(Pos)
  else if OperName = 'pt' then BuildGroupExpr<PNXPointExpr>(Pos)
  else if OperName = 'moveto' then BuildGroupExpr<PNXMoveToExpr>(Pos)
  else if OperName = 'lineto' then BuildGroupExpr<PNXLineToExpr>(Pos)
  else if OperName = 'textout' then BuildGroupExpr<PNXTextOutExpr>(Pos)
  else if OperName = 'textbound' then BuildGroupExpr<PNXTextBoundExpr>(Pos)
  else if OperName = 'line' then BuildGroupExpr<PNXLineExpr>(Pos)
  else if OperName = 'rect' then BuildGroupExpr<PNXRectExpr>(Pos)
  else if OperName = 'filerect' then BuildGroupExpr<PNXFillRectExpr>(Pos) // Backward bug compatibility
  else if OperName = 'fillrect' then BuildGroupExpr<PNXFillRectExpr>(Pos)
  else if OperName = 'ellipse' then BuildGroupExpr<PNXEllipseExpr>(Pos)
  else if OperName = 'roundrect' then BuildGroupExpr<PNXRoundRectExpr>(Pos)
  else if OperName = 'textrect' then BuildGroupExpr<PNXTextRectExpr>(Pos)
  else if OperName = 'arc' then BuildGroupExpr<PNXArcExpr>(Pos)
  else if OperName = 'pie' then BuildGroupExpr<PNXPieExpr>(Pos)
  else if OperName = 'ptatx' then BuildGroupExpr<PNXPtAtXExpr>(Pos)
  else if OperName = 'ptaty' then BuildGroupExpr<PNXPtAtYExpr>(Pos)
  else if OperName = 'ptcount' then BuildGroupExpr<PNXPtCountExpr>(Pos)
  else if OperName = 'drawedge' then BuildGroupExpr<PNXDrawEdgeExpr>(Pos)
  else if OperName = 'drawobject' then BuildGroupExpr<PNXDrawObjectExpr>(Pos)
  else if OperName = 'arrangeobject' then BuildGroupExpr<PNXArrangeObjectExpr>(Pos)
  else if OperName = 'polyline' then BuildGroupExpr<PNXPolylineExpr>(Pos)
  else if OperName = 'polygon' then BuildGroupExpr<PNXPolygonExpr>(Pos)
  else if OperName = 'polybezier' then BuildGroupExpr<PNXPolyBezierExpr>(Pos)
  else if OperName = 'setdefaultstyle' then BuildGroupExpr<PNXSetDefaultStyleExpr>(Pos)

  else
   Assert(False,'Unknown Operation')
end;

constructor PNXBuilder.Create;
begin
  if not Assigned(FCurrentGroupExprStack) then
    FCurrentGroupExprStack := PCurrentGroupExprStack.Create;
end;

destructor PNXBuilder.Destroy;
begin
  FCurrentGroupExprStack.Free;
  //FreeNotationTree;
  inherited;
end;

{TTExprBuilder }

destructor TExprBuilder.Destroy;
begin
  FNXBuilder.Free;
  inherited;
end;

function TExprBuilder.EndOperation: HResult;
begin
  FNXBuilder.EndOperation;
  Result := S_OK;
end;

procedure TExprBuilder.FreeNotationTree;
begin
  if Assigned(FNXBuilder) then
    FNXBuilder.FreeNotationTree;
end;

function TExprBuilder.GetNotationTree: PNXNotationExpr;
begin
  if Assigned(FNXBuilder) then
    Result := FNXBuilder.NotationTree
  else
    Result := nil;
end;

function TExprBuilder.NewOperation(const Oper: WideString; Pos: SYSINT): HResult;
begin
  FNXBuilder.NewOperation(Oper,Pos);
  Result := S_OK;
end;

function TExprBuilder.PrimExpr(Value: OleVariant; Pos: SYSINT): HResult;
begin
  FNXBuilder.BuildPrimExpr(Value,Pos);
  Result := S_OK;
end;

function TExprBuilder.NewNotationOperation(const Filepath: WideString; Pos: SYSINT): HResult;
begin
  if not Assigned(FNXBuilder) then
    FNXBuilder := PNXBuilder.Create;

  FNXBuilder.BuildNotationExpr(Filepath, Pos);
  Result := S_OK;
end;

function TExprBuilder.IdentExpr(const Id: WideString; Pos: SYSINT): HResult;
begin
  FNXBuilder.BuildIdentExpr(Id, Pos);
  Result := S_OK;
end;

function TExprBuilder.NewDrawBitmapOperation(const FilePath: WideString; Pos: SYSINT): HResult;
begin
   FNXBuilder.BuildDrawBitmapExpr(Filepath, Pos);
   Result := S_OK;
end;


{ PNXObjDumpVisitor }

constructor PNXObjDumpVisitor.Create(OutputStream: TStream);
begin
  FOutputStream := OutputStream;
  FOutputStreamWriter := TStreamWriter.Create(FOutputStream);
end;

destructor PNXObjDumpVisitor.Destroy;
begin
  FOutputStreamWriter.Flush;
  FOutputStreamWriter.Free;
  inherited;
end;

procedure PNXObjDumpVisitor.VisitDrawBitmapExpr(Expr: PNXDrawBitmapExpr);
begin
  FOutputStreamWriter.WriteLine(FIndent + 'Visiting PNXDrawBitmapExpr');
  FOutputStreamWriter.WriteLine(FIndent + 'File path: ' + Expr.FFilepath);
end;

procedure PNXObjDumpVisitor.VisitExpr(Expr: PNXExpr);
var
  Text: string;
begin
  Text := Format('%sVisiting PNXExpr (line:%s) : ',[FIndent,IntToStr(Expr.Position)]);
  FOutputStreamWriter.Write(Text);

  if Expr.IsValueType then
    FOutputStreamWriter.WriteLine(VarToStr(Expr.Value))
  else
    FOutputStreamWriter.WriteLine('Ref value');
end;

procedure PNXObjDumpVisitor.VisitGroupExpr(Expr: PNXGroupExpr);
var
  GroupedExpr: PNXExpr;
begin
  FOutputStreamWriter.WriteLine(FIndent + 'Visiting PNXGroupExpr: ' + Expr.ToString);
  FIndent := FIndent + '  ';
  for GroupedExpr in Expr.FExprList do
     GroupedExpr.Accept(Self);
  FIndent := FIndent.Substring(2);

end;

procedure PNXObjDumpVisitor.VisitNotationExpr(Expr: PNXNotationExpr);
begin
  FOutputStreamWriter.WriteLine(FIndent + 'Visiting PNXNotationExpr');
  FOutputStreamWriter.WriteLine(FIndent + 'File name: ' + Expr.Filename);
end;


function CreateObjDumpVisitor (OutputStream: TStream): PNXVisitor;
begin
  Result := PNXObjDumpVisitor.Create(OutputStream);
end;

initialization
  NXManager := PNXManager.Create;
  TTypedComObjectFactory.Create(ComServer, TExprBuilder, Class_ExprBuilder,
    ciMultiInstance, tmApartment);

finalization
  NXManager.Free;
end.
