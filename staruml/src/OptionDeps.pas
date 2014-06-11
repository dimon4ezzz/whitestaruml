unit OptionDeps;

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

uses
  OptMgr_TLB, Core,
  Classes, Graphics, ActiveX;

const
  // Test constants
  //OPT_SCHEMATA_REG_PATH = 'HKEY_LOCAL_MACHINE\SOFTWARE\StarUML\Schemata';
  OPT_SCHEMATA_REG_PATH = 'HKEY_CURRENT_USER' + RK_BASE_LOCATION + 'Schemata';
  //OPT_REG_PATH = 'HKEY_CURRENT_USER\Software\StarUML\Options';
  OPT_REG_PATH = 'HKEY_CURRENT_USER' + RK_BASE_LOCATION + 'Options';
  OPT_SCHEMA_ENVIRONMENT = 'ENVIRONMENT';

  // Option Item Key-Names
  OPT_UNDO_LEVEL = 'UNDO_LEVEL';
  OPT_NUM_RECENT_PRJ = 'NUM_RECENT_PRJ';
  OPT_CREATE_BACKUP = 'CREATE_BACKUP';
  OPT_SHOW_NEWDIALOG = 'SHOW_NEWDIALOG';
  OPT_HELP_URL = 'HELP_URL';
  OPT_BROWSER_SHOW_STEREOTYPE = 'BROWSER_SHOW_STEREOTYPE';
  OPT_COLEDT_SHOW_STEREOTYPE = 'COLEDT_SHOW_STEREOTYPE';
  OPT_COLEDT_SHOW_VISIBILITYICON = 'COLEDT_SHOW_VISIBILITYICON';
  OPT_COLEDT_SHOW_NAMEONLY = 'COLEDT_SHOW_NAMEONLY';
  OPT_DEFAULT_ATTR_VISIBILITY = 'DEFAULT_ATTR_VISIBILITY';
  OPT_DEFAULT_OPER_VISIBILITY = 'DEFAULT_OPER_VISIBILITY';
  OPT_DIAGRAM_WIDTH = 'DIAGRAM_WIDTH';
  OPT_DIAGRAM_HEIGHT = 'DIAGRAM_HEIGHT';
  OPT_GRID_WIDTH = 'GRID_WIDTH';
  OPT_GRID_HEIGHT = 'GRID_HEIGHT';
  OPT_SHOW_GRID = 'SHOW_GRID';
  OPT_MESSAGE_SIGNATURE = 'MESSAGE_SIGNATURE';
  OPT_SHOW_SEQ_NUMBER = 'SHOW_SEQ_NUMBER';
  OPT_SHOW_ACTIVATION = 'SHOW_ACTIVATION';
  OPT_FILL_COLOR = 'FILL_COLOR';
  OPT_LINE_COLOR = 'LINE_COLOR';
  OPT_FONT_FACE = 'FONT_FACE';
  OPT_FONT_SIZE = 'FONT_SIZE';
  OPT_FONT_COLOR = 'FONT_COLOR';
  OPT_LINE_STYLE = 'LINE_STYLE';
  OPT_STEREOTYPE_DISPLAY = 'STEREOTYPE_DISPLAY';
  OPT_SHOW_PARENT_NAME = 'SHOW_PARENT_NAME';
  OPT_AUTO_RESIZE = 'AUTO_RESIZE';
  OPT_SHOW_COMP_VISIBILITY = 'SHOW_COMP_VISIBILITY';
  OPT_SHOW_COMP_STEREOTYPE = 'SHOW_COMP_STEREOTYPE';
  OPT_SHOW_OPER_SIGNATURE = 'SHOW_OPER_SIGNATURE';
  OPT_SHOW_PROPERTY = 'SHOW_PROPERTY';
  OPT_SUPPRESS_ATTR = 'SUPPRESS_ATTR';
  OPT_SUPPRESS_OPER = 'SUPPRESS_OPER';
  OPT_USECASE_STEREOTYPE_DISPLAY = 'USECASE_STEREOTYPE_DISPLAY';
  OPT_USECASE_SUPPRESS_ATTR = 'USECASE_SUPPRESS_ATTR';
  OPT_USECASE_SUPPRESS_OPER = 'USECASE_SUPPRESS_OPER';
  OPT_ACTOR_STEREOTYPE_DISPLAY = 'ACTOR_STEREOTYPE_DISPLAY';
  OPT_ACTOR_SUPPRESS_ATTR = 'ACTOR_SUPPRESS_ATTR';
  OPT_ACTOR_SUPPRESS_OPER = 'ACTOR_SUPPRESS_OPER';
  OPT_ENUMERATION_SUPPRESS_LIT = 'ENUMERATION_SUPPRESS_LIT';
  OPT_INTERFACE_STEREOTYPE_DISPLAY = 'INTERFACE_STEREOTYPE_DISPLAY';
  OPT_INTERFACE_SUPPRESS_ATTR = 'INTERFACE_SUPPRESS_ATTR';
  OPT_INTERFACE_SUPPRESS_OPER = 'INTERFACE_SUPPRESS_OPER';
  OPT_ARTIFACT_STEREOTYPE_DISPLAY = 'ARTIFACT_STEREOTYPE_DISPLAY';
  OPT_ARTIFACT_SUPPRESS_ATTR = 'ARTIFACT_SUPPRESS_ATTR';
  OPT_ARTIFACT_SUPPRESS_OPER = 'ARTIFACT_SUPPRESS_OPER';
  OPT_COMPONENT_STEREOTYPE_DISPLAY = 'COMPONENT_STEREOTYPE_DISPLAY';
  OPT_NODE_STEREOTYPE_DISPLAY = 'NODE_STEREOTYPE_DISPLAY';
  OPT_WORD_WRAP_BY_DEFAULT = 'WORD_WRAP_BY_DEFAULT';
  OPT_FORCE_DECIMAL_SEPARATOR = 'FORCE_DECIMAL_SEPARATOR';
  OPT_AUTO_LOAD_UNITS = 'AUTO_LOAD_UNITS';

type
  POptionValueChangeEvent = procedure(Sender: TObject; SchemaID: string; OptionName: string; Value: Variant) of object;

  // Notice
  // -------
  // OptionManager deliver integer value if request value of Enumeration-typed option item.
  // The order of enumeration items in option schema file must be identical to Enumeration class defined in Program.

  // POptionDepository
  POptionDepository = class
  private
    OptionManager: IOptionManager;
    FOnOptionValueChange: POptionValueChangeEvent;

    // declare private option-variable
    FUndoLevel: Integer;
    FNumberOfRecentProjects: Integer;
    FCreateBackupFile: Boolean;
    FShowNewDialog: Boolean;
    FHelpUrl: string;
    FBrowserShowStereotype: Boolean;
    FDefaultAttrVisibility: Integer;
    FDefaultOperVisibility: Integer;
    FColEdtShowStereotype: Boolean;
    FColEdtShowVisibilityIcon: Boolean;
    FColEdtShowNameOnly: Boolean;
    FStartWebPage: string;
    FOpenAttachmentWithNewBrowser: Boolean;
    FDefaultDiagramWidth: Integer;
    FDefaultDiagramHeight: Integer;
    FGridWidth: Integer;
    FGridHeight: Integer;
    FShowGrid: Boolean;
    FMessageSignature: Integer;
    FShowSequnceNumber: Boolean;
    FShowActivation: Boolean;
    FDefaultFillColor: TColor;
    FDefaultLineColor: TColor;
    FDefaultFontFace: string;
    FDefaultFontSize: Integer;
    FDefaultFontColor: TColor;
    FLineStyle: Integer;
    FStereotypeDisplay: Integer;
    FShowParentName: Boolean;
    FAutoResize: Boolean;
    FShowCompartmentVisibility: Boolean;
    FShowCompartmentStereotype: Boolean;
    FShowOperationSignature: Boolean;
    FShowProperty: Boolean;
    FSuppressAttributes: Boolean;
    FSuppressOperations: Boolean;
    FUsecaseStereotypeDisplay: Integer;
    FUsecaseSuppressAttributes: Boolean;
    FUsecaseSuppressOperations: Boolean;
    FActorStereotypeDisplay: Integer;
    FActorSuppressAttributes: Boolean;
    FActorSuppressOperations: Boolean;
    FEnumerationSuppressLiterals: Boolean;
    FInterfaceStereotypeDisplay: Integer;
    FInterfaceSuppressAttributes: Boolean;
    FInterfaceSuppressOperations: Boolean;
    FArtifactStereotypeDisplay: Integer;
    FArtifactSuppressAttributes: Boolean;
    FArtifactSuppressOperations: Boolean;
    FComponentStereotypeDisplay: Integer;
    FNodeStereotypeDisplay: Integer;
    FWordWrapByDefault: Boolean;
    FForceDecimalSeparator: string;
    FAutoLoadUnits: Boolean;

    // option management procedure
    procedure SetDefaultOptionProperties;
    procedure SetOptionProperties;

    // declare private option-value set function if need
    procedure SetUndoLevel(Value: Integer);
    procedure SetNumberOfRecentProjects(Value: Integer);
    procedure SetCreateBackupFile(Value: Boolean);
    procedure SetShowNewDialog(Value: Boolean);
    procedure SetHelpUrl(Value: string);
    procedure SetBrowserShowStereotype(Value: Boolean);
    procedure SetColEdtShowStereotype(Value: Boolean);
    procedure SetColEdtShowVisibilityIcon(Value: Boolean);
    procedure SetColEdtShowNameOnly(Value: Boolean);
    procedure SetDefaultAttrVisibility(Value: Integer);
    procedure SetDefaultOperVisibility(Value: Integer);
    procedure SetDefaultDiagramWidth(Value: Integer);
    procedure SetDefaultDiagramHeight(Value: Integer);
    procedure SetGridWidth(Value: Integer);
    procedure SetGridHeight(Value: Integer);
    procedure SetShowGrid(Value: Boolean);
    procedure SetMessageSignature(Value: Integer);
    procedure SetShowSequnceNumber(Value: Boolean);
    procedure SetShowActivation(Value: Boolean);
    procedure SetDefaultFillColor(Value: TColor);
    procedure SetDefaultLineColor(Value: TColor);
    procedure SetDefaultFontFace(Value: string);
    procedure SetDefaultFontSize(Value: Integer);
    procedure SetDefaultFontColor(Value: TColor);
    procedure SetLineStyle(Value: Integer);
    procedure SetStereotypeDisplay(Value: Integer);
    procedure SetShowParentName(Value: Boolean);
    procedure SetAutoResize(Value: Boolean);
    procedure SetShowCompartmentVisibility(Value: Boolean);
    procedure SetShowCompartmentStereotype(Value: Boolean);
    procedure SetShowOperationSignature(Value: Boolean);
    procedure SetShowProperty(Value: Boolean);
    procedure SetSuppressAttributes(Value: Boolean);
    procedure SetSuppressOperations(Value: Boolean);
    procedure SetUsecaseStereotypeDisplay(Value: Integer);
    procedure SetUsecaseSuppressAttributes(Value: Boolean);
    procedure SetUsecaseSuppressOperations(Value: Boolean);
    procedure SetActorStereotypeDisplay(Value: Integer);
    procedure SetActorSuppressAttributes(Value: Boolean);
    procedure SetActorSuppressOperations(Value: Boolean);
    procedure SetEnumerationSuppressLiterals(Value: Boolean);
    procedure SetInterfaceStereotypeDisplay(Value: Integer);
    procedure SetInterfaceSuppressAttributes(Value: Boolean);
    procedure SetInterfaceSuppressOperations(Value: Boolean);
    procedure SetArtifactStereotypeDisplay(Value: Integer);
    procedure SetArtifactSuppressAttributes(Value: Boolean);
    procedure SetArtifactSuppressOperations(Value: Boolean);
    procedure SetComponentStereotypeDisplay(Value: Integer);
    procedure SetNodeStereotypeDisplay(Value: Integer);
    procedure SetWordWrapByDefault(Value: Boolean);
    procedure SetForceDecimalSeparator(Value: string);
    procedure SetAutoLoadUnits(Value: Boolean);
  public
    constructor Create;
    destructor Destroy; override;
    procedure LoadOptionValues;
    procedure SaveOptionValues;
    function GetOptionValue(SchemaID: WideString; Key: string): OleVariant;
    function ShowDialog: Boolean;

    property OnOptionValueChange: POptionValueChangeEvent read FOnOptionValueChange write FOnOptionValueChange;
    // declare public option property
    property UndoLevel: Integer read FUndoLevel write SetUndoLevel;
    property NumberOfRecentProjects: Integer read FNumberOfRecentProjects write SetNumberOfRecentProjects;
    property CreateBackupFile: Boolean read FCreateBackupFile write SetCreateBackupFile;
    property ShowNewDialog: Boolean read FShowNewDialog write SetShowNewDialog;
    property HelpUrl: string read FHelpUrl write SetHelpUrl;
    property BrowserShowStereotype: Boolean read FBrowserShowStereotype write SetBrowserShowStereotype;
    property DefaultAttrVisibility: Integer read FDefaultAttrVisibility write SetDefaultAttrVisibility;
    property DefaultOperVisibility: Integer read FDefaultOperVisibility write SetDefaultOperVisibility;
    property ColEdtShowStereotype: Boolean read FColEdtShowStereotype write SetColEdtShowStereotype;
    property ColEdtShowVisibilityIcon: Boolean read FColEdtShowVisibilityIcon write SetColEdtShowVisibilityIcon;
    property ColEdtShowNameOnly: Boolean read FColEdtShowNameOnly write SetColEdtShowNameOnly;
    property DefaultDiagramWidth: Integer read FDefaultDiagramWidth write SetDefaultDiagramWidth;
    property DefaultDiagramHeight: Integer read FDefaultDiagramHeight write SetDefaultDiagramHeight;
    property GridWidth: Integer read FGridWidth write SetGridWidth;
    property GridHeight: Integer read FGridHeight write SetGridHeight;
    property ShowGrid: Boolean read FShowGrid write SetShowGrid;
    property MessageSignature: Integer read FMessageSignature write SetMessageSignature;
    property ShowSequnceNumber: Boolean read FShowSequnceNumber write SetShowSequnceNumber;
    property ShowActivation: Boolean read FShowActivation write SetShowActivation;
    property DefaultFillColor: TColor read FDefaultFillColor write SetDefaultFillColor;
    property DefaultLineColor: TColor read FDefaultLineColor write SetDefaultLineColor;
    property DefaultFontFace: string read FDefaultFontFace write SetDefaultFontFace;
    property DefaultFontSize: Integer read FDefaultFontSize write SetDefaultFontSize;
    property DefaultFontColor: TColor read FDefaultFontColor write SetDefaultFontColor;
    property LineStyle: Integer read FLineStyle write SetLineStyle;
    property StereotypeDisplay: Integer read FStereotypeDisplay write SetStereotypeDisplay;
    property ShowParentName: Boolean read FShowParentName write SetShowParentName;
    property AutoResize: Boolean read FAutoResize write SetAutoResize;
    property ShowCompartmentVisibility: Boolean read FShowCompartmentVisibility write SetShowCompartmentVisibility;
    property ShowCompartmentStereotype: Boolean read FShowCompartmentStereotype write SetShowCompartmentStereotype;
    property ShowOperationSignature: Boolean read FShowOperationSignature write SetShowOperationSignature;
    property ShowProperty: Boolean read FShowProperty write SetShowProperty;
    property SuppressAttributes: Boolean read FSuppressAttributes write SetSuppressAttributes;
    property SuppressOperations: Boolean read FSuppressOperations write SetSuppressOperations;
    property UsecaseStereotypeDisplay: Integer read FUsecaseStereotypeDisplay write SetUsecaseStereotypeDisplay;
    property UsecaseSuppressAttributes: Boolean read FUsecaseSuppressAttributes write SetUsecaseSuppressAttributes;
    property UsecaseSuppressOperations: Boolean read FUsecaseSuppressOperations write SetUsecaseSuppressOperations;
    property ActorStereotypeDisplay: Integer read FActorStereotypeDisplay write SetActorStereotypeDisplay;
    property ActorSuppressAttributes: Boolean read FActorSuppressAttributes write SetActorSuppressAttributes;
    property ActorSuppressOperations: Boolean read FActorSuppressOperations write SetActorSuppressOperations;
    property EnumerationSuppressLiterals: Boolean read FEnumerationSuppressLiterals write SetEnumerationSuppressLiterals;
    property InterfaceStereotypeDisplay: Integer read FInterfaceStereotypeDisplay write SetInterfaceStereotypeDisplay;
    property InterfaceSuppressAttributes: Boolean read FInterfaceSuppressAttributes write SetInterfaceSuppressAttributes;
    property InterfaceSuppressOperations: Boolean read FInterfaceSuppressOperations write SetInterfaceSuppressOperations;
    property ArtifactStereotypeDisplay: Integer read FArtifactStereotypeDisplay write SetArtifactStereotypeDisplay;
    property ArtifactSuppressAttributes: Boolean read FArtifactSuppressAttributes write SetArtifactSuppressAttributes;
    property ArtifactSuppressOperations: Boolean read FArtifactSuppressOperations write SetArtifactSuppressOperations;
    property ComponentStereotypeDisplay: Integer read FComponentStereotypeDisplay write SetComponentStereotypeDisplay;
    property NodeStereotypeDisplay: Integer read FNodeStereotypeDisplay write SetNodeStereotypeDisplay;
    property WordWrapByDefault: Boolean read FWordWrapByDefault write SetWordWrapByDefault;
    property ForceDecimalSeparator: string read FForceDecimalSeparator write SetForceDecimalSeparator;
    property AutoLoadUnits: Boolean read FAutoLoadUnits write SetAutoLoadUnits;
  end;

  // Utilities
  function ColorToStr(C: TColor): string;

var
  OptionDepository: POptionDepository;

implementation

uses
  HtmlHlp,  
  Variants, SysUtils;

////////////////////////////////////////////////////////////////////////////////
// POptionDepository

constructor POptionDepository.Create;
begin
  inherited;
  SetDefaultOptionProperties;
  // OptionManager
  CoInitialize(nil);
  OptionManager := CoOptionManager.Create;
  OptionManager.InitOptionManager(OPT_SCHEMATA_REG_PATH, OPT_REG_PATH, OPT_SCHEMA_ENVIRONMENT);
end;

destructor POptionDepository.Destroy;
begin
  OptionManager := nil;
  CoUninitialize;
  inherited;
end;

// Define default option properties.
// It is provision against damading of default option schema file.
procedure POptionDepository.SetDefaultOptionProperties;
begin
  FUndoLevel := 30;
  FNumberOfRecentProjects := 10;
  FCreateBackupFile := True;
  FShowNewDialog := True;
  FHelpUrl := HELP_STARUML_INDEX;
  FBrowserShowStereotype := True;
  FDefaultAttrVisibility := 0;
  FDefaultOperVisibility := 0;
  FColEdtShowStereotype := True;
  FColEdtShowVisibilityIcon := True;
  FColEdtShowNameOnly := False;
  FStartWebPage := 'about:blank';
  FOpenAttachmentWithNewBrowser := False;
  FDefaultDiagramWidth := 5000;
  FDefaultDiagramHeight := 5000;
  FGridWidth := 5;
  FGridHeight := 5;
  FShowGrid := True;
  FMessageSignature := 0;
  FShowSequnceNumber := True;
  FShowActivation := True;
  FDefaultFillColor := clWhite;
  FDefaultLineColor := clBlack;
  FDefaultFontFace := 'Tahoma';
  FDefaultFontSize := 8;
  FDefaultFontColor := clBlack;
  FLineStyle := 1;
  FStereotypeDisplay := 0;
  FShowParentName := False;
  FAutoResize := False;
  FShowCompartmentVisibility := True;
  FShowCompartmentStereotype := True;
  FShowOperationSignature := True;
  FShowProperty := False;
  FSuppressAttributes := False;
  FSuppressOperations := False;
  FUsecaseStereotypeDisplay := 0;
  FUsecaseSuppressAttributes := True;
  FUsecaseSuppressOperations := True;
  FActorStereotypeDisplay := 0;
  FActorSuppressAttributes := True;
  FActorSuppressOperations := True;
  FEnumerationSuppressLiterals := False;
  FInterfaceStereotypeDisplay := 1;
  FInterfaceSuppressAttributes := True;
  FInterfaceSuppressOperations := True;
  FArtifactStereotypeDisplay := 3;
  FArtifactSuppressAttributes := True;
  FArtifactSuppressOperations := True;
  FWordWrapByDefault := False;
  FForceDecimalSeparator := '';
  FAutoLoadUnits := True;
end;

procedure POptionDepository.SetOptionProperties;
var
  OS: IOptionSchema;
  OC: IOptionCategory;
  OL: IOptionClassification;
  OI: IOptionItem;
  I, J, K, L: Integer;
  V: Variant;
begin
  // PRECONDITIONS
  Assert(OptionManager <> nil, 'Option manager is not created.');
  // PRECONDITIONS

  V := OptionManager.GetOptionValue(OPT_SCHEMA_ENVIRONMENT, OPT_UNDO_LEVEL);
  if VarIsNull(V) then begin
    // Basic OptionSchema file is damaged.
  end
  else begin
    UndoLevel := V;
  end;

  V := OptionManager.GetOptionValue(OPT_SCHEMA_ENVIRONMENT, OPT_NUM_RECENT_PRJ);
  if VarIsNull(V) then begin
    // Basic OptionSchema file is damaged.
  end
  else begin
    NumberOfRecentProjects := V;
  end;

  V := OptionManager.GetOptionValue(OPT_SCHEMA_ENVIRONMENT, OPT_CREATE_BACKUP);
  if VarIsNull(V) then begin
    // Basic OptionSchema file is damaged.
  end
  else begin
    CreateBackupFile := V;
  end;

  V := OptionManager.GetOptionValue(OPT_SCHEMA_ENVIRONMENT, OPT_SHOW_NEWDIALOG);
  if VarIsNull(V) then begin
    // Basic OptionSchema file is damaged.
  end
  else begin
    ShowNewDialog := V;
  end;

  V := OptionManager.GetOptionValue(OPT_SCHEMA_ENVIRONMENT, OPT_HELP_URL);
  if VarIsNull(V) then begin
    // Basic OptionSchema file is damaged.
  end
  else begin
    HelpUrl := V;
  end;

  V := OptionManager.GetOptionValue(OPT_SCHEMA_ENVIRONMENT, OPT_BROWSER_SHOW_STEREOTYPE);
  if VarIsNull(V) then begin
    // Basic OptionSchema file is damaged.
  end
  else begin
    BrowserShowStereotype := V;
  end;

  V := OptionManager.GetOptionValue(OPT_SCHEMA_ENVIRONMENT, OPT_DEFAULT_ATTR_VISIBILITY);
  if VarIsNull(V) then begin
    // Basic OptionSchema file is damaged.
  end
  else begin
    DefaultAttrVisibility := V;
  end;

  V := OptionManager.GetOptionValue(OPT_SCHEMA_ENVIRONMENT, OPT_DEFAULT_OPER_VISIBILITY);
  if VarIsNull(V) then begin
    // Basic OptionSchema file is damaged.
  end
  else begin
    DefaultOperVisibility := V;
  end;

  V := OptionManager.GetOptionValue(OPT_SCHEMA_ENVIRONMENT, OPT_COLEDT_SHOW_STEREOTYPE);
  if VarIsNull(V) then begin
    // Basic OptionSchema file is damaged.
  end
  else begin
    ColEdtShowStereotype := V;
  end;

  V := OptionManager.GetOptionValue(OPT_SCHEMA_ENVIRONMENT, OPT_COLEDT_SHOW_VISIBILITYICON);
  if VarIsNull(V) then begin
    // Basic OptionSchema file is damaged.
  end
  else begin
    ColEdtShowVisibilityIcon := V;
  end;

  V := OptionManager.GetOptionValue(OPT_SCHEMA_ENVIRONMENT, OPT_COLEDT_SHOW_NAMEONLY);
  if VarIsNull(V) then begin
    // Basic OptionSchema file is damaged.
  end
  else begin
    ColEdtShowNameOnly := V;
  end;

  V := OptionManager.GetOptionValue(OPT_SCHEMA_ENVIRONMENT, OPT_DIAGRAM_WIDTH);
  if VarIsNull(V) then begin
    // Basic OptionSchema file is damaged.
  end
  else begin
    DefaultDiagramWidth := V;
  end;

  V := OptionManager.GetOptionValue(OPT_SCHEMA_ENVIRONMENT, OPT_DIAGRAM_HEIGHT);
  if VarIsNull(V) then begin
    // Basic OptionSchema file is damaged.
  end
  else begin
    DefaultDiagramHeight := V;
  end;

  V := OptionManager.GetOptionValue(OPT_SCHEMA_ENVIRONMENT, OPT_GRID_WIDTH);
  if VarIsNull(V) then begin
    // Basic OptionSchema file is damaged.
  end
  else begin
    GridWidth := V;
  end;

  V := OptionManager.GetOptionValue(OPT_SCHEMA_ENVIRONMENT, OPT_GRID_HEIGHT);
  if VarIsNull(V) then begin
    // Basic OptionSchema file is damaged.
  end
  else begin
    GridHeight := V;
  end;

  V := OptionManager.GetOptionValue(OPT_SCHEMA_ENVIRONMENT, OPT_SHOW_GRID);
  if VarIsNull(V) then begin
    // Basic OptionSchema file is damaged.
  end
  else begin
    ShowGrid := V;
  end;

  V := OptionManager.GetOptionValue(OPT_SCHEMA_ENVIRONMENT, OPT_MESSAGE_SIGNATURE);
  if VarIsNull(V) then begin
    // Basic OptionSchema file is damaged.
  end
  else begin
    MessageSignature := V;
  end;

  V := OptionManager.GetOptionValue(OPT_SCHEMA_ENVIRONMENT, OPT_SHOW_SEQ_NUMBER);
  if VarIsNull(V) then begin
    // Basic OptionSchema file is damaged.
  end
  else begin
    ShowSequnceNumber := V;
  end;

  V := OptionManager.GetOptionValue(OPT_SCHEMA_ENVIRONMENT, OPT_SHOW_ACTIVATION);
  if VarIsNull(V) then begin
    // Basic OptionSchema file is damaged.
  end
  else begin
    ShowActivation := V;
  end;

  V := OptionManager.GetOptionValue(OPT_SCHEMA_ENVIRONMENT, OPT_FILL_COLOR);
  if VarIsNull(V) then begin
    // Basic OptionSchema file is damaged.
  end
  else begin
    DefaultFillColor := StringToColor(V);
  end;

  V := OptionManager.GetOptionValue(OPT_SCHEMA_ENVIRONMENT, OPT_LINE_COLOR);
  if VarIsNull(V) then begin
    // Basic OptionSchema file is damaged.
  end
  else begin
    DefaultLineColor := StringToColor(V);
  end;

  V := OptionManager.GetOptionValue(OPT_SCHEMA_ENVIRONMENT, OPT_FONT_FACE);
  if VarIsNull(V) then begin
    // Basic OptionSchema file is damaged.
  end
  else begin
    DefaultFontFace := V;
  end;

  V := OptionManager.GetOptionValue(OPT_SCHEMA_ENVIRONMENT, OPT_FONT_SIZE);
  if VarIsNull(V) then begin
    // Basic OptionSchema file is damaged.
  end
  else begin
    DefaultFontSize := V;
  end;

  V := OptionManager.GetOptionValue(OPT_SCHEMA_ENVIRONMENT, OPT_FONT_COLOR);
  if VarIsNull(V) then begin
    // Basic OptionSchema file is damaged.
  end
  else begin
    DefaultFontColor := StringToColor(V);
  end;

  V := OptionManager.GetOptionValue(OPT_SCHEMA_ENVIRONMENT, OPT_LINE_STYLE);
  if VarIsNull(V) then begin
    // Basic OptionSchema file is damaged.
  end
  else begin
    LineStyle := V;
  end;

  V := OptionManager.GetOptionValue(OPT_SCHEMA_ENVIRONMENT, OPT_STEREOTYPE_DISPLAY);
  if VarIsNull(V) then begin
    // Basic OptionSchema file is damaged.
  end
  else begin
    StereotypeDisplay := V;
  end;

  V := OptionManager.GetOptionValue(OPT_SCHEMA_ENVIRONMENT, OPT_SHOW_PARENT_NAME);
  if VarIsNull(V) then begin
    // Basic OptionSchema file is damaged.
  end
  else begin
    ShowParentName := V;
  end;

  V := OptionManager.GetOptionValue(OPT_SCHEMA_ENVIRONMENT, OPT_AUTO_RESIZE);
  if VarIsNull(V) then begin
    // Basic OptionSchema file is damaged.
  end
  else begin
    AutoResize := V;
  end;

  V := OptionManager.GetOptionValue(OPT_SCHEMA_ENVIRONMENT, OPT_SHOW_COMP_VISIBILITY);
  if VarIsNull(V) then begin
    // Basic OptionSchema file is damaged.
  end
  else begin
    ShowCompartmentVisibility := V;
  end;

  V := OptionManager.GetOptionValue(OPT_SCHEMA_ENVIRONMENT, OPT_SHOW_COMP_STEREOTYPE);
  if VarIsNull(V) then begin
    // Basic OptionSchema file is damaged.
  end
  else begin
    ShowCompartmentStereotype := V;
  end;

  V := OptionManager.GetOptionValue(OPT_SCHEMA_ENVIRONMENT, OPT_SHOW_OPER_SIGNATURE);
  if VarIsNull(V) then begin
    // Basic OptionSchema file is damaged.
  end
  else begin
    ShowOperationSignature := V;
  end;

  V := OptionManager.GetOptionValue(OPT_SCHEMA_ENVIRONMENT, OPT_SHOW_PROPERTY);
  if VarIsNull(V) then begin
    // Basic OptionSchema file is damaged.
  end
  else begin
    ShowProperty := V;
  end;

  V := OptionManager.GetOptionValue(OPT_SCHEMA_ENVIRONMENT, OPT_SUPPRESS_ATTR);
  if VarIsNull(V) then begin
    // Basic OptionSchema file is damaged.
  end
  else begin
    SuppressAttributes := V;
  end;

  V := OptionManager.GetOptionValue(OPT_SCHEMA_ENVIRONMENT, OPT_SUPPRESS_OPER);
  if VarIsNull(V) then begin
    // Basic OptionSchema file is damaged.
  end
  else begin
    SuppressOperations := V;
  end;

  V := OptionManager.GetOptionValue(OPT_SCHEMA_ENVIRONMENT, OPT_USECASE_STEREOTYPE_DISPLAY);
  if VarIsNull(V) then begin
    // Basic OptionSchema file is damaged.
  end
  else begin
    UseCaseStereotypeDisplay := V;
  end;

  V := OptionManager.GetOptionValue(OPT_SCHEMA_ENVIRONMENT, OPT_USECASE_SUPPRESS_ATTR);
  if VarIsNull(V) then begin
    // Basic OptionSchema file is damaged.
  end
  else begin
    UsecaseSuppressAttributes := V;
  end;

  V := OptionManager.GetOptionValue(OPT_SCHEMA_ENVIRONMENT, OPT_USECASE_SUPPRESS_OPER);
  if VarIsNull(V) then begin
    // Basic OptionSchema file is damaged.
  end
  else begin
    UsecaseSuppressOperations := V;
  end;

  V := OptionManager.GetOptionValue(OPT_SCHEMA_ENVIRONMENT, OPT_ACTOR_STEREOTYPE_DISPLAY);
  if VarIsNull(V) then begin
    // Basic OptionSchema file is damaged.
  end
  else begin
    ActorStereotypeDisplay := V;
  end;

  V := OptionManager.GetOptionValue(OPT_SCHEMA_ENVIRONMENT, OPT_ACTOR_SUPPRESS_ATTR);
  if VarIsNull(V) then begin
    // Basic OptionSchema file is damaged.
  end
  else begin
    ActorSuppressAttributes := V;
  end;

  V := OptionManager.GetOptionValue(OPT_SCHEMA_ENVIRONMENT, OPT_ACTOR_SUPPRESS_OPER);
  if VarIsNull(V) then begin
    // Basic OptionSchema file is damaged.
  end
  else begin
    ActorSuppressOperations := V;
  end;

  V := OptionManager.GetOptionValue(OPT_SCHEMA_ENVIRONMENT, OPT_ENUMERATION_SUPPRESS_LIT);
  if VarIsNull(V) then begin
    // Basic OptionSchema file is damaged.
  end
  else begin
    EnumerationSuppressLiterals := V;
  end;

  V := OptionManager.GetOptionValue(OPT_SCHEMA_ENVIRONMENT, OPT_INTERFACE_STEREOTYPE_DISPLAY);
  if VarIsNull(V) then begin
    // Basic OptionSchema file is damaged.
  end
  else begin
    InterfaceStereotypeDisplay := V;
  end;

  V := OptionManager.GetOptionValue(OPT_SCHEMA_ENVIRONMENT, OPT_INTERFACE_SUPPRESS_ATTR);
  if VarIsNull(V) then begin
    // Basic OptionSchema file is damaged.
  end
  else begin
    InterfaceSuppressAttributes := V;
  end;

  V := OptionManager.GetOptionValue(OPT_SCHEMA_ENVIRONMENT, OPT_INTERFACE_SUPPRESS_OPER);
  if VarIsNull(V) then begin
    // Basic OptionSchema file is damaged.
  end
  else begin
    InterfaceSuppressOperations := V;
  end;

  V := OptionManager.GetOptionValue(OPT_SCHEMA_ENVIRONMENT, OPT_ARTIFACT_STEREOTYPE_DISPLAY);
  if VarIsNull(V) then begin
    // Basic OptionSchema file is damaged.
  end
  else begin
    ArtifactStereotypeDisplay := V;
  end;

  V := OptionManager.GetOptionValue(OPT_SCHEMA_ENVIRONMENT, OPT_ARTIFACT_SUPPRESS_ATTR);
  if VarIsNull(V) then begin
    // Basic OptionSchema file is damaged.
  end
  else begin
    ArtifactSuppressAttributes := V;
  end;

  V := OptionManager.GetOptionValue(OPT_SCHEMA_ENVIRONMENT, OPT_ARTIFACT_SUPPRESS_OPER);
  if VarIsNull(V) then begin
    // Basic OptionSchema file is damaged.
  end
  else begin
    ArtifactSuppressOperations := V;
  end;

  V := OptionManager.GetOptionValue(OPT_SCHEMA_ENVIRONMENT, OPT_COMPONENT_STEREOTYPE_DISPLAY);
  if VarIsNull(V) then begin
    // Basic OptionSchema file is damaged.
  end
  else begin
    ComponentStereotypeDisplay := V;
  end;

  V := OptionManager.GetOptionValue(OPT_SCHEMA_ENVIRONMENT, OPT_NODE_STEREOTYPE_DISPLAY);
  if VarIsNull(V) then begin
    // Basic OptionSchema file is damaged.
  end
  else begin
    NodeStereotypeDisplay := V;
  end;

  V := OptionManager.GetOptionValue(OPT_SCHEMA_ENVIRONMENT, OPT_WORD_WRAP_BY_DEFAULT);
  if VarIsNull(V) then begin
    // Basic OptionSchema file is damaged.
  end
  else begin
    WordWrapByDefault := V;
  end;

  V := OptionManager.GetOptionValue(OPT_SCHEMA_ENVIRONMENT, OPT_FORCE_DECIMAL_SEPARATOR);
  if VarIsNull(V) then begin
    // Basic OptionSchema file is damaged.
  end
  else begin
    ForceDecimalSeparator := V;
  end;

  V := OptionManager.GetOptionValue(OPT_SCHEMA_ENVIRONMENT, OPT_AUTO_LOAD_UNITS);
  if VarIsNull(V) then begin
    // Basic OptionSchema file is damaged.
  end
  else begin
    AutoLoadUnits := V;
  end;

  for I := 0 to OptionManager.GetOptionSchemaCount - 1 do begin
    OS := OptionManager.GetOptionSchemaAt(I);
    if OS.ID <> OPT_SCHEMA_ENVIRONMENT then
      for J := 0 to OS.GetOptionCategoryCount - 1 do begin
        OC := OS.GetOptionCategoryAt(J);
        for K := 0 to OC.GetOptionClassificationCount - 1 do begin
          OL := OC.GetOptionClassificationAt(K);
          for L := 0 to OL.GetOptionItemCount - 1 do begin
            OI := OL.GetOptionItemAt(L);
            if OI.Changed and Assigned(FOnOptionValueChange)then
              FOnOptionValueChange(Self, OS.Caption, OI.Key, OI.Value);
          end;
        end;
      end;
  end;
end;

procedure POptionDepository.SetUndoLevel(Value: Integer);
begin
  if FUndoLevel <> Value then begin
    FUndoLevel := Value;
    if Assigned(FOnOptionValueChange) then
      FOnOptionValueChange(Self, OPT_SCHEMA_ENVIRONMENT, OPT_UNDO_LEVEL, Value);
  end;
end;

procedure POptionDepository.SetNumberOfRecentProjects(Value: Integer);
begin
  if FNumberOfRecentProjects <> Value then begin
    FNumberOfRecentProjects := Value;
    if Assigned(FOnOptionValueChange) then
      FOnOptionValueChange(Self, OPT_SCHEMA_ENVIRONMENT, OPT_NUM_RECENT_PRJ, Value);
  end;
end;

procedure POptionDepository.SetCreateBackupFile(Value: Boolean);
begin
  if FCreateBackupFile <> Value then begin
    FCreateBackupFile := Value;
    if Assigned(FOnOptionValueChange) then
      FOnOptionValueChange(Self, OPT_SCHEMA_ENVIRONMENT, OPT_CREATE_BACKUP, Value);
  end;
end;

procedure POptionDepository.SetShowNewDialog(Value: Boolean);
begin
  if FShowNewDialog <> Value then begin
    FShowNewDialog := Value;
    if Assigned(FOnOptionValueChange) then
      FOnOptionValueChange(Self, OPT_SCHEMA_ENVIRONMENT, OPT_SHOW_NEWDIALOG, Value);
  end;
end;

procedure POptionDepository.SetHelpUrl(Value: string);
begin
  if FHelpUrl <> Value then begin
    FHelpUrl := Value;
    if Assigned(FOnOptionValueChange) then
      FOnOptionValueChange(Self, OPT_SCHEMA_ENVIRONMENT, OPT_HELP_URL, Value);
  end;      
end;

procedure POptionDepository.SetBrowserShowStereotype(Value: Boolean);
begin
  if FBrowserShowStereotype <> Value then begin
    FBrowserShowStereotype := Value;
    if Assigned(FOnOptionValueChange) then
      FOnOptionValueChange(Self, OPT_SCHEMA_ENVIRONMENT, OPT_BROWSER_SHOW_STEREOTYPE, Value);
  end;
end;

procedure POptionDepository.SetColEdtShowStereotype(Value: Boolean);
begin
  if FColEdtShowStereotype <> Value then begin
    FColEdtShowStereotype := Value;
    if Assigned(FOnOptionValueChange) then
      FOnOptionValueChange(Self, OPT_SCHEMA_ENVIRONMENT, OPT_COLEDT_SHOW_STEREOTYPE, Value);
  end;
end;

procedure POptionDepository.SetColEdtShowVisibilityIcon(Value: Boolean);
begin
  if FColEdtShowVisibilityIcon <> Value then begin
    FColEdtShowVisibilityIcon := Value;
    if Assigned(FOnOptionValueChange) then
      FOnOptionValueChange(Self, OPT_SCHEMA_ENVIRONMENT, OPT_COLEDT_SHOW_VISIBILITYICON, Value);
  end;
end;

procedure POptionDepository.SetColEdtShowNameOnly(Value: Boolean);
begin
  if FColEdtShowNameOnly <> Value then begin
    FColEdtShowNameOnly := Value;
    if Assigned(FOnOptionValueChange) then
      FOnOptionValueChange(Self, OPT_SCHEMA_ENVIRONMENT, OPT_COLEDT_SHOW_NAMEONLY, Value);
  end;
end;

procedure POptionDepository.SetDefaultAttrVisibility(Value: Integer);
begin
  if FDefaultAttrVisibility <> Value then begin
    FDefaultAttrVisibility := Value;
    if Assigned(FOnOptionValueChange) then
      FOnOptionValueChange(Self, OPT_SCHEMA_ENVIRONMENT, OPT_DEFAULT_ATTR_VISIBILITY, Value);
  end;
end;

procedure POptionDepository.SetDefaultOperVisibility(Value: Integer);
begin
  if FDefaultOperVisibility <> Value then begin
    FDefaultOperVisibility := Value;
    if Assigned(FOnOptionValueChange) then
      FOnOptionValueChange(Self, OPT_SCHEMA_ENVIRONMENT, OPT_DEFAULT_OPER_VISIBILITY, Value);
  end;
end;

procedure POptionDepository.SetDefaultDiagramWidth(Value: Integer);
begin
  if FDefaultDiagramWidth <> Value then begin
    FDefaultDiagramWidth := Value;
    if Assigned(FOnOptionValueChange) then
      FOnOptionValueChange(Self, OPT_SCHEMA_ENVIRONMENT, OPT_DIAGRAM_WIDTH, Value);
  end;
end;

procedure POptionDepository.SetDefaultDiagramHeight(Value: Integer);
begin
  if FDefaultDiagramHeight <> Value then begin
    FDefaultDiagramHeight := Value;
    if Assigned(FOnOptionValueChange) then
      FOnOptionValueChange(Self, OPT_SCHEMA_ENVIRONMENT, OPT_DIAGRAM_HEIGHT, Value);
  end;
end;

procedure POptionDepository.SetGridWidth(Value: Integer);
begin
  if FGridWidth <> Value then begin
    FGridWidth := Value;
    if Assigned(FOnOptionValueChange) then
      FOnOptionValueChange(Self, OPT_SCHEMA_ENVIRONMENT, OPT_GRID_WIDTH, Value);
  end;
end;

procedure POptionDepository.SetGridHeight(Value: Integer);
begin
  if FGridHeight <> Value then begin
    FGridHeight := Value;
    if Assigned(FOnOptionValueChange) then
      FOnOptionValueChange(Self, OPT_SCHEMA_ENVIRONMENT, OPT_GRID_HEIGHT, Value);
  end;
end;  

procedure POptionDepository.SetShowGrid(Value: Boolean);
begin
  if FShowGrid <> Value then begin
    FShowGrid := Value;
    if Assigned(FOnOptionValueChange) then
      FOnOptionValueChange(Self, OPT_SCHEMA_ENVIRONMENT, OPT_SHOW_GRID, Value);
  end;
end;

procedure POptionDepository.SetMessageSignature(Value: Integer);
begin
  if FMessageSignature <> Value then begin
    FMessageSignature := Value;
    if Assigned(FOnOptionValueChange) then
      FOnOptionValueChange(Self, OPT_SCHEMA_ENVIRONMENT, OPT_MESSAGE_SIGNATURE, Value);
  end;
end;

procedure POptionDepository.SetShowSequnceNumber(Value: Boolean);
begin
  if FShowSequnceNumber <> Value then begin
    FShowSequnceNumber := Value;
    if Assigned(FOnOptionValueChange) then
      FOnOptionValueChange(Self, OPT_SCHEMA_ENVIRONMENT, OPT_SHOW_SEQ_NUMBER, Value);
  end;
end;

procedure POptionDepository.SetShowActivation(Value: Boolean);
begin
  if FShowActivation <> Value then begin
    FShowActivation := Value;
    if Assigned(FOnOptionValueChange) then
      FOnOptionValueChange(Self, OPT_SCHEMA_ENVIRONMENT, OPT_SHOW_ACTIVATION, Value);
  end;
end;

procedure POptionDepository.SetDefaultFillColor(Value: TColor);
begin
  if FDefaultFillColor <> Value then begin
    FDefaultFillColor := Value;
    if Assigned(FOnOptionValueChange) then
      FOnOptionValueChange(Self, OPT_SCHEMA_ENVIRONMENT, OPT_FILL_COLOR, Value);
  end;
end;

procedure POptionDepository.SetDefaultLineColor(Value: TColor);
begin
  if FDefaultLineColor <> Value then begin
    FDefaultLineColor := Value;
    if Assigned(FOnOptionValueChange) then
      FOnOptionValueChange(Self, OPT_SCHEMA_ENVIRONMENT, OPT_LINE_COLOR, Value);
  end;
end;

procedure POptionDepository.SetDefaultFontFace(Value: string);
begin
  if FDefaultFontFace <> Value then begin
    FDefaultFontFace := Value;
    if Assigned(FOnOptionValueChange) then
      FOnOptionValueChange(Self, OPT_SCHEMA_ENVIRONMENT, OPT_FONT_FACE, Value);
  end;
end;

procedure POptionDepository.SetDefaultFontSize(Value: Integer);
begin
  if FDefaultFontSize <> Value then begin
    FDefaultFontSize := Value;
    if Assigned(FOnOptionValueChange) then
      FOnOptionValueChange(Self, OPT_SCHEMA_ENVIRONMENT, OPT_FONT_SIZE, Value);
  end;
end;

procedure POptionDepository.SetDefaultFontColor(Value: TColor);
begin
  if FDefaultFontColor <> Value then begin
    FDefaultFontColor := Value;
    if Assigned(FOnOptionValueChange) then
      FOnOptionValueChange(Self, OPT_SCHEMA_ENVIRONMENT, OPT_FONT_COLOR, Value);
  end;
end;

procedure POptionDepository.SetLineStyle(Value: Integer);
begin
  if FLineStyle <> Value then begin
    FLineStyle := Value;
    if Assigned(FOnOptionValueChange) then
      FOnOptionValueChange(Self, OPT_SCHEMA_ENVIRONMENT, OPT_LINE_STYLE, Value);
  end;
end;

procedure POptionDepository.SetStereotypeDisplay(Value: Integer);
begin
  if FStereotypeDisplay <> Value then begin
    FStereotypeDisplay := Value;
    if Assigned(FOnOptionValueChange) then
      FOnOptionValueChange(Self, OPT_SCHEMA_ENVIRONMENT, OPT_STEREOTYPE_DISPLAY, Value);
  end;
end;

procedure POptionDepository.SetShowParentName(Value: Boolean);
begin
  if FShowParentName <> Value then begin
    FShowParentName := Value;
    if Assigned(FOnOptionValueChange) then
      FOnOptionValueChange(Self, OPT_SCHEMA_ENVIRONMENT, OPT_SHOW_PARENT_NAME, Value);
  end;
end;

procedure POptionDepository.SetAutoLoadUnits(Value: Boolean);
begin
  if FAutoLoadUnits <> Value then begin
    FAutoLoadUnits := Value;
    if Assigned(FOnOptionValueChange) then
      FOnOptionValueChange(Self, OPT_SCHEMA_ENVIRONMENT, OPT_AUTO_LOAD_UNITS, Value);
  end;
end;

procedure POptionDepository.SetAutoResize(Value: Boolean);
begin
  if FAutoResize <> Value then begin
    FAutoResize := Value;
    if Assigned(FOnOptionValueChange) then
      FOnOptionValueChange(Self, OPT_SCHEMA_ENVIRONMENT, OPT_AUTO_RESIZE, Value);
  end;
end;

procedure POptionDepository.SetShowCompartmentVisibility(Value: Boolean);
begin
  if FShowCompartmentVisibility <> Value then begin
    FShowCompartmentVisibility := Value;
    if Assigned(FOnOptionValueChange) then
      FOnOptionValueChange(Self, OPT_SCHEMA_ENVIRONMENT, OPT_SHOW_COMP_VISIBILITY, Value);
  end;
end;

procedure POptionDepository.SetShowCompartmentStereotype(Value: Boolean);
begin
  if FShowCompartmentStereotype <> Value then begin
    FShowCompartmentStereotype := Value;
    if Assigned(FOnOptionValueChange) then
      FOnOptionValueChange(Self, OPT_SCHEMA_ENVIRONMENT, OPT_SHOW_COMP_STEREOTYPE, Value);
  end;
end;

procedure POptionDepository.SetShowOperationSignature(Value: Boolean);
begin
  if FShowOperationSignature <> Value then begin
    FShowOperationSignature := Value;
    if Assigned(FOnOptionValueChange) then
      FOnOptionValueChange(Self, OPT_SCHEMA_ENVIRONMENT, OPT_SHOW_OPER_SIGNATURE, Value);
  end;
end;

procedure POptionDepository.SetShowProperty(Value: Boolean);
begin
  if FShowProperty <> Value then begin
    FShowProperty := Value;
    if Assigned(FOnOptionValueChange) then
      FOnOptionValueChange(Self, OPT_SCHEMA_ENVIRONMENT, OPT_SHOW_PROPERTY, Value);
  end;
end;

procedure POptionDepository.SetSuppressAttributes(Value: Boolean);
begin
  if FSuppressAttributes <> Value then begin
    FSuppressAttributes := Value;
    if Assigned(FOnOptionValueChange) then
      FOnOptionValueChange(Self, OPT_SCHEMA_ENVIRONMENT, OPT_SUPPRESS_ATTR, Value);
  end;
end;

procedure POptionDepository.SetSuppressOperations(Value: Boolean);
begin
  if FSuppressOperations <> Value then begin
    FSuppressOperations := Value;
    if Assigned(FOnOptionValueChange) then
      FOnOptionValueChange(Self, OPT_SCHEMA_ENVIRONMENT, OPT_SUPPRESS_OPER, Value);
  end;
end;

procedure POptionDepository.SetUsecaseStereotypeDisplay(Value: Integer);
begin
  if FUsecaseStereotypeDisplay <> Value then begin
    FUsecaseStereotypeDisplay := Value;
    if Assigned(FOnOptionValueChange) then
      FOnOptionValueChange(Self, OPT_SCHEMA_ENVIRONMENT, OPT_USECASE_STEREOTYPE_DISPLAY, Value);
  end;
end;

procedure POptionDepository.SetUsecaseSuppressAttributes(Value: Boolean);
begin
  if FUsecaseSuppressAttributes <> Value then begin
    FUsecaseSuppressAttributes := Value;
    if Assigned(FOnOptionValueChange) then
      FOnOptionValueChange(Self, OPT_SCHEMA_ENVIRONMENT, OPT_USECASE_SUPPRESS_ATTR, Value);
  end;
end;

procedure POptionDepository.SetUsecaseSuppressOperations(Value: Boolean);
begin
  if FUsecaseSuppressOperations <> Value then begin
    FUsecaseSuppressOperations := Value;
    if Assigned(FOnOptionValueChange) then
      FOnOptionValueChange(Self, OPT_SCHEMA_ENVIRONMENT, OPT_USECASE_SUPPRESS_OPER, Value);
  end;
end;

procedure POptionDepository.SetActorStereotypeDisplay(Value: Integer);
begin
  if FActorStereotypeDisplay <> Value then begin
    FActorStereotypeDisplay := Value;
    if Assigned(FOnOptionValueChange) then
      FOnOptionValueChange(Self, OPT_SCHEMA_ENVIRONMENT, OPT_ACTOR_STEREOTYPE_DISPLAY, Value);
  end;
end;

procedure POptionDepository.SetActorSuppressAttributes(Value: Boolean);
begin
  if FActorSuppressAttributes <> Value then begin
    FActorSuppressAttributes := Value;
    if Assigned(FOnOptionValueChange) then
      FOnOptionValueChange(Self, OPT_SCHEMA_ENVIRONMENT, OPT_ACTOR_SUPPRESS_ATTR, Value);
  end;
end;

procedure POptionDepository.SetActorSuppressOperations(Value: Boolean);
begin
  if FActorSuppressOperations <> Value then begin
    FActorSuppressOperations := Value;
    if Assigned(FOnOptionValueChange) then
      FOnOptionValueChange(Self, OPT_SCHEMA_ENVIRONMENT, OPT_ACTOR_SUPPRESS_OPER, Value);
  end;
end;

procedure POptionDepository.SetEnumerationSuppressLiterals(Value: Boolean);
begin
  if FEnumerationSuppressLiterals <> Value then begin
    FEnumerationSuppressLiterals := Value;
    if Assigned(FOnOptionValueChange) then
      FOnOptionValueChange(Self, OPT_SCHEMA_ENVIRONMENT, OPT_ENUMERATION_SUPPRESS_LIT, Value);
  end;
end;

procedure POptionDepository.SetInterfaceStereotypeDisplay(Value: Integer);
begin
  if FInterfaceStereotypeDisplay <> Value then begin
    FInterfaceStereotypeDisplay := Value;
    if Assigned(FOnOptionValueChange) then
      FOnOptionValueChange(Self, OPT_SCHEMA_ENVIRONMENT, OPT_INTERFACE_STEREOTYPE_DISPLAY, Value);
  end;
end;

procedure POptionDepository.SetInterfaceSuppressAttributes(Value: Boolean);
begin
  if FInterfaceSuppressAttributes <> Value then begin
    FInterfaceSuppressAttributes := Value;
    if Assigned(FOnOptionValueChange) then
      FOnOptionValueChange(Self, OPT_SCHEMA_ENVIRONMENT, OPT_INTERFACE_SUPPRESS_ATTR, Value);
  end;
end;

procedure POptionDepository.SetInterfaceSuppressOperations(Value: Boolean);
begin
  if FInterfaceSuppressOperations <> Value then begin
    FInterfaceSuppressOperations := Value;
    if Assigned(FOnOptionValueChange) then
      FOnOptionValueChange(Self, OPT_SCHEMA_ENVIRONMENT, OPT_INTERFACE_SUPPRESS_OPER, Value);
  end;
end;

procedure POptionDepository.SetArtifactStereotypeDisplay(Value: Integer);
begin
  if FArtifactStereotypeDisplay <> Value then begin
    FArtifactStereotypeDisplay := Value;
    if Assigned(FOnOptionValueChange) then
      FOnOptionValueChange(Self, OPT_SCHEMA_ENVIRONMENT, OPT_ARTIFACT_STEREOTYPE_DISPLAY, Value);
  end;
end;

procedure POptionDepository.SetArtifactSuppressAttributes(Value: Boolean);
begin
  if FArtifactSuppressAttributes <> Value then begin
    FArtifactSuppressAttributes := Value;
    if Assigned(FOnOptionValueChange) then
      FOnOptionValueChange(Self, OPT_SCHEMA_ENVIRONMENT, OPT_ARTIFACT_SUPPRESS_ATTR, Value);
  end;
end;

procedure POptionDepository.SetArtifactSuppressOperations(Value: Boolean);
begin
  if FArtifactSuppressOperations <> Value then begin
    FArtifactSuppressOperations := Value;
    if Assigned(FOnOptionValueChange) then
      FOnOptionValueChange(Self, OPT_SCHEMA_ENVIRONMENT, OPT_ARTIFACT_SUPPRESS_OPER, Value);
  end;
end;

procedure POptionDepository.SetComponentStereotypeDisplay(Value: Integer);
begin
  if FComponentStereotypeDisplay <> Value then begin
    FComponentStereotypeDisplay := Value;
    if Assigned(FOnOptionValueChange) then
      FOnOptionValueChange(Self, OPT_SCHEMA_ENVIRONMENT, OPT_COMPONENT_STEREOTYPE_DISPLAY, Value);
  end;
end;

procedure POptionDepository.SetNodeStereotypeDisplay(Value: Integer);
begin
  if FNodeStereotypeDisplay <> Value then begin
    FNodeStereotypeDisplay := Value;
    if Assigned(FOnOptionValueChange) then
      FOnOptionValueChange(Self, OPT_SCHEMA_ENVIRONMENT, OPT_NODE_STEREOTYPE_DISPLAY, Value);
  end;
end;

procedure POptionDepository.SetWordWrapByDefault(Value: Boolean);
begin
  if FWordWrapByDefault <> Value then begin
    FWordWrapByDefault := Value;
    if Assigned(FOnOptionValueChange) then
      FOnOptionValueChange(Self, OPT_SCHEMA_ENVIRONMENT, OPT_WORD_WRAP_BY_DEFAULT, Value);
  end;
end;

procedure POptionDepository.SetForceDecimalSeparator(Value: string);
begin
  if FForceDecimalSeparator <> Value then begin
    FForceDecimalSeparator := Value;
    if Assigned(FOnOptionValueChange) then
      FOnOptionValueChange(Self, OPT_SCHEMA_ENVIRONMENT, OPT_FORCE_DECIMAL_SEPARATOR, Value);
  end;
end;

procedure POptionDepository.LoadOptionValues;
begin
  OptionManager.LoadOptionValues;
  SetOptionProperties;
end;

procedure POptionDepository.SaveOptionValues;
begin
  OptionManager.SaveOptionValues;
end;

function POptionDepository.GetOptionValue(SchemaID: WideString; Key: string): OleVariant;
begin
  Result := OptionManager.GetOptionValue(SchemaID, Key);
end;

function POptionDepository.ShowDialog: Boolean;
var
  R: Boolean;
begin
  // PRECONDITIONS
  Assert(OptionManager <> nil, 'Option manager is not created.');
  // PRECONDITIONS

  R := OptionManager.ShowDialog;
  if R then begin
    SetOptionProperties;
  end;
  Result := R;
end;

// POptionDepository
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Utilities

function ColorToStr(C: TColor): string;
begin
  Result := '$' + IntToHex(C, 8);
end;

// Utilities
////////////////////////////////////////////////////////////////////////////////


initialization
  OptionDepository := POptionDepository.Create;
finalization
  OptionDepository.Free;
end.

