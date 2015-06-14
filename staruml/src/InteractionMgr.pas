unit InteractionMgr;

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
  BasicClasses, Core, ExtCore, UMLModels, UMLViews, Handlers, MainFrm,
  Classes, Windows, Graphics, SysUtils, NavBarFrame, MenuManager,
  Generics.Collections;

type
  // Events
  PModelAddingEvent = procedure(Sender: TObject; ModelKind: string; Argument: Integer) of object;
  PDiagramAddingEvent = procedure(Sender: TObject; DiagramKind: string) of object;
  PElementCreatingEvent = procedure(Sender: TObject; ElementKind: string; Argument: Integer; X1, Y1, X2, Y2: Integer) of object;
  PExtModelAddingEvent = procedure(Sender: TObject; ProfileName: string; ModelPrototypeName: string) of object;
  PExtDiagramAddingEvent = procedure(Sender: TObject; ProfileName: string; DiagramTypeName: string) of object;
  PExtElementCreatingEvent = procedure(Sender: TObject; ProfileName: string; ElementPrototypeName: string; X1, Y1, X2, Y2: Integer) of object;

  // PPaletteItemInteraction
  PPaletteItemInteraction = class
  private
    FHanderName: string;
    FNavBarItem: TNavBarItem;
  public
    property HanderName: string read FHanderName write FHanderName;
    property NavBarItem: TNavBarItem read FNavBarItem write FNavBarItem;
  end;

  // PPredefinedPaletteItemInteraction
  PPredefinedPaletteItemInteraction = class(PPaletteItemInteraction)
  private
    FElementKind: string;
    FArgument: Integer;
  public
    property ElementKind: string read FElementKind write FElementKind;
    property Argument: Integer read FArgument write FArgument;
  end;

  // PExtendedPaletteItemInteraction
  PExtendedPaletteItemInteraction = class(PPaletteItemInteraction)
  private
    FElementPrototype: PElementPrototype;
  public
    property ElementPrototype: PElementPrototype read FElementPrototype write FElementPrototype;
  end;

  // PPaletteInteraction
  PPaletteInteraction = class
  private
    FName: string;
    FNavBarGroup: TNavBarGroup;
  public
    property Name: string read FName write FName;
    property NavBarGroup: TNavBarGroup read FNavBarGroup write FNavBarGroup;
  end;

  // PPredefinedPaletteInteraction
  PPredefinedPaletteInteraction = class(PPaletteInteraction)

  end;


  // PExtendedPaletteInteraction
  PExtendedPaletteInteraction = class(PPaletteInteraction)
  private
    FPalette: PPalette;
  public
    property Palette: PPalette read FPalette write FPalette;
  end;

  // PDiagramMenuInteraction
  PDiagramMenuInteraction = class
  private
    //FMenuButton: TdxBarButton;
    FMenuButton: TMenuElementHandle;
    FAvailablePalettes: TStringList;
    function GetAvailablePaletteCount: Integer;
    function GetAvailablePalette(Index: Integer): string;
  public
    constructor Create;
    destructor Destroy; override;
    procedure AddAvailablePalette(Value: string);
    procedure RemoveAvailablePalette(Value: string);
    //property MenuButton: TdxBarButton read FMenuButton write FMenuButton;
    property MenuButton: TMenuElementHandle read FMenuButton write FMenuButton;
    property AvailablePaletteCount: Integer read GetAvailablePaletteCount;
    property AvailablePalettes[Index: Integer]: string read GetAvailablePalette;
  end;

  // PPredefinedDiagramMenuInteraction
  PPredefinedDiagramMenuInteraction = class(PDiagramMenuInteraction)
  private
    FDiagramKind: string;
  public
    property DiagramKind: string read FDiagramKind write FDiagramKind;
  end;

  // PExtendedDiagramMenuInteraction
  PExtendedDiagramMenuInteraction = class(PDiagramMenuInteraction)
  private
    FDiagramType: PDiagramType;
  public
    property DiagramType: PDiagramType read FDiagramType write FDiagramType;
  end;

  // PModelMenuInteraction
  PModelMenuInteraction = class
  private
    FMenuButton: TMenuElementHandle;
  public
    property MenuButton: TMenuElementHandle read FMenuButton write FMenuButton;
  end;

  // PPredefinedModelMenuInteraction
  PPredefinedModelMenuInteraction = class(PModelMenuInteraction)
  private
    FModelKind: string;
    FArgument: Integer;
  public
    property ModelKind: string read FModelKind write FModelKind;
    property Argument: Integer read FArgument write FArgument;
  end;

  // PExtendedModelMenuInteraction
  PExtendedModelMenuInteraction = class(PModelMenuInteraction)
  private
    FModelPrototype: PModelPrototype;
    FBaseMenuButton: TMenuElementHandle;
  public
    function IsOneOfContainer(Model: PModel): Boolean;
    property ModelPrototype: PModelPrototype read FModelPrototype write FModelPrototype;
    property BaseMenuButton: TMenuElementHandle read FBaseMenuButton write FBaseMenuButton;
  end;

  // PInteractionManager
  PInteractionManager = class
  private type
  TNavBarGroups = TList<TNavBarGroup>;
  private
    FPaletteItemInteractions: TList;
    FPaletteInteractions: TList;
    FDiagramMenuInteractions: TList;
    FModelMenuInteractions: TList;

    FMenuManager: TMenuHandlesManager;

    FOnModelAdding: PModelAddingEvent;
    FOnDiagramAdding: PDiagramAddingEvent;
    FOnElementCreating: PElementCreatingEvent;
    FOnExtModelAdding: PExtModelAddingEvent;
    FOnExtDiagramAdding: PExtDiagramAddingEvent;
    FOnExtElementCreating: PExtElementCreatingEvent;
    { getter / setter }
    function GetPaletteItemInteractionCount: Integer;
    function GetPaletteItemInteraction(Index: Integer): PPaletteItemInteraction;
    function GetPaletteInteractionCount: Integer;
    function GetPaletteInteraction(Index: Integer): PPaletteInteraction;

    function GetDiagramMenuInteractionCount: Integer;
    function GetDiagramMenuInteraction(Index: Integer): PDiagramMenuInteraction;

    function GetModelMenuInteractionCount: Integer;
    function GetModelMenuInteraction(Index: Integer): PModelMenuInteraction;
    { event handlers }
    //procedure MainFormHandlingButtonClicked(Sender: TObject);
    procedure MainFormModelAddMenuClicked(Sender: TObject);
    procedure HandleButtonClicked(Sender: TNavBarItem);
    procedure MainFormDiagramAddMenuClicked(Sender: TObject);
    procedure MainFormElementCreatingHandler(Sender: TObject; HandlerName: string; X1, Y1, X2, Y2: Integer);
    procedure MainFormPaletteChanged(Sender: TObject);
    //procedure MainFormPaletteNavBarCustomDrawLink(Sender: TObject; ACanvas: TCanvas; AViewInfo: TdxNavBarLinkViewInfo; var AHandled: Boolean);
    { finding methods }
    function FindPaletteItemInteraction(NavBarItem: TNavBarItem): PPaletteItemInteraction; overload;
        function FindPaletteItemInteraction(HandlerName: string): PPaletteItemInteraction; overload;
    function FindModelMenuInteraction(MenuButton: TMenuElementHandle): PModelMenuInteraction;
    function FindDiagramMenuInteraction(MenuButton: TMenuElementHandle): PDiagramMenuInteraction;
    function FindPaletteInteraction(Name: string): PPaletteInteraction;
        function FindPredefinedDiagramMenuInteraction(DiagramKind: string): PPredefinedDiagramMenuInteraction;
    function FindPredefinedModelMenuInteraction(ModelKind: string): PPredefinedModelMenuInteraction;
    function FindPredefinedPaletteItemInteraction(ElementKind: string): PPredefinedPaletteItemInteraction;
    function FindExtendedPaletteInteraction(Palette: PPalette): PExtendedPaletteInteraction;
    function FindExtendedPaletteItemInteraction(Profile: PProfile; ElementPrototypeName: string): PExtendedPaletteItemInteraction;
    function FindExtendedDiagramMenuInteraction(DiagramTypeName: string): PExtendedDiagramMenuInteraction;
    { predefined interaction adding methods }
    procedure AddPredefinedDiagramMenuInteraction(DiagramKind: string; MenuButton: TMenuElementHandle; AvailablePalettes: array of string);
    procedure AddPredefinedModelMenuInteraction(ModelKind: string; Argument: Integer; MenuButton: TMenuElementHandle);
    procedure AddPredefinedPaletteInteraction(Name: string; NavBarGroup: TNavBarGroup);
    procedure AddPredefinedPaletteItemInteraction(ElementKind: string; Argument: Integer; HandlerName: string; NavBarItem: TNavBarItem);
    { extended interaction adding methods }
    procedure AddExtDiagramMenuInteraction(ADiagramType: PDiagramType; IsFirst: Boolean = False);
    procedure AddExtModelMenuInteraction(AModelPrototype: PModelPrototype);
    procedure AddExtPaletteInteraction(APalette: PPalette);
    procedure AddExtPaletteItemInteraction(AElementPrototype: PElementPrototype);
    procedure CreatePaletteItemLinks(APalette: PPalette);
    { interaction building methods }
    procedure AddPredefinedCreateHandlers;
    procedure BuildPredefinedInteractions;
    procedure BuildExtendedInteractions;
    procedure AddAllProfileElementIcons;
    { miscellonous }
    function GetDiagramKindName(Diagram: PUMLDiagram): string;
    //function GetContainerMenuBarGroup(Button: TdxBarButton): TdxBarGroup; overload;
    //function GetContainerMenuBarGroup(Button: TMenuElementHandle): TMenuElementCategory;
  public
    constructor Create;
    destructor Destroy; override;
    procedure BuildInteractions;
    procedure AcquireAvailableNavBarGroups(Diagram: PUMLDiagram; NavBarGroups: TNavBarGroups);
    procedure SetExtMenuButtonsState(Owner: PModel);
    procedure ChangePaletteVisibility(Diagram: PUMLDiagram);
    property PaletteItemInteractionCount: Integer read GetPaletteItemInteractionCount;
    property PaletteItemInteractions[Index: Integer]: PPaletteItemInteraction read GetPaletteItemInteraction;
    property PaletteInteractionCount: Integer read GetPaletteInteractionCount;
    property PaletteInteractions[Index: Integer]: PPaletteInteraction read GetPaletteInteraction;
    property DiagramMenuInteractionCount: Integer read GetDiagramMenuInteractionCount;
    property DiagramMenuInteractions[Index: Integer]: PDiagramMenuInteraction read GetDiagramMenuInteraction;
    property ModelMenuInteractionCount: Integer read GetModelMenuInteractionCount;
    property ModelMenuInteractions[Index: Integer]: PModelMenuInteraction read GetModelMenuInteraction;
    property MenuManager: TMenuHandlesManager read FMenuManager write FMenuManager;

    property OnModelAdding: PModelAddingEvent read FOnModelAdding write FOnModelAdding;
    property OnDiagramAdding: PDiagramAddingEvent read FOnDiagramAdding write FOnDiagramAdding;
    property OnElementCreating: PElementCreatingEvent read FOnElementCreating write FOnElementCreating;
    property OnExtModelAdding: PExtModelAddingEvent read FOnExtModelAdding write FOnExtModelAdding;
    property OnExtDiagramAdding: PExtDiagramAddingEvent read FOnExtDiagramAdding write FOnExtDiagramAdding;
    property OnExtElementCreating: PExtElementCreatingEvent read FOnExtElementCreating write FOnExtElementCreating;
  end;

  function DragTypeToSkeletonPaintKind(Value: PDragTypeKind): PSkeletonPaintingKind;

var
  InteractionManager: PInteractionManager;

implementation

uses
  Vcl.ImgList, Vcl.Imaging.jpeg, Vcl.Imaging.pngimage, System.Math, Winapi.CommCtrl,
  UMLFacto;

const
  HANDLER_POSTFIX = 'Handler';



function AddBitmap (ImageList: TCustomImageList; const FileName: string): Integer;
var
  FileExtension: string;
  Bitmap: TBitmap;
  JpgImage: TJPEGImage;
  PngImage: TPngImage;

begin
  Result := -1;
  Bitmap := nil;
  JpgImage := nil;
  PngImage := nil;
  if FileExists(FileName) then begin
    try
      FileExtension := UpperCase(ExtractFileExt(FileName));
      Bitmap := TBitmap.Create;

      if  FileExtension = FILE_EXT_BMP then
        Bitmap.LoadFromFile(FileName)

      else if (FileExtension = FILE_EXT_JPG) or (FileExtension = FILE_EXT_JPEG) then begin
        JpgImage := TJpegImage.Create;
        JpgImage.LoadFromFile(FileName);
        Bitmap.Assign(JpgImage);
      end

      else if (FileExtension = FILE_EXT_PNG) then begin
        PngImage := TPngImage.Create;
        PngImage.LoadFromFile(FileName);
        Bitmap.Assign(PngImage);
      end;

      Result := ImageList.AddMasked(Bitmap, Bitmap.TransparentColor);

  finally
    Bitmap.Free;
    JpgImage.Free;
    PngImage.Free;
  end;
end;

end;


////////////////////////////////////////////////////////////////////////////////
// PDiagramMenuInteraction

constructor PDiagramMenuInteraction.Create;
begin
  FAvailablePalettes := TStringList.Create;
end;

destructor PDiagramMenuInteraction.Destroy;
begin
  FAvailablePalettes.Free;
  inherited;
end;

function PDiagramMenuInteraction.GetAvailablePaletteCount: Integer;
begin
  Result := FAvailablePalettes.Count;
end;

function PDiagramMenuInteraction.GetAvailablePalette(Index: Integer): string;
begin
  Result := FAvailablePalettes[Index];
end;

procedure PDiagramMenuInteraction.AddAvailablePalette(Value: string);
begin
  FAvailablePalettes.Add(Value);
end;

procedure PDiagramMenuInteraction.RemoveAvailablePalette(Value: string);
begin
  FAvailablePalettes.Delete(FAvailablePalettes.IndexOf(Value));
end;

// PDiagramMenuInteraction
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PExtendedModelMenuInteraction

function PExtendedModelMenuInteraction.IsOneOfContainer(Model: PModel): Boolean;
var
  EM: PExtensibleModel;
  I: Integer;
begin
  // PRECONDITIONS
  Assert(FModelPrototype <> nil);
  // PRECONDITIONS
  Result := False;
  for I := 0 to FModelPrototype.ContainerModelCount - 1 do begin
    if FModelPrototype.ContainerModelStereotypes[I] = '' then begin
      if Model.MetaClass.IsKindOf(FModelPrototype.ContainerModels[I]) then begin
        Result := True;
        Exit;
      end;
    end
    else begin
      if Model is PExtensibleModel then begin
        EM := Model as PExtensibleModel;
        if Model.MetaClass.IsKindOf(FModelPrototype.ContainerModels[I]) and (EM.StereotypeName = FModelPrototype.ContainerModelStereotypes[I]) then begin
          Result := True;
          Exit;
        end;
      end;
    end;
  end;
end;

// PModelMenuInteraction
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PInteractionManager

constructor PInteractionManager.Create;
begin
  FPaletteItemInteractions := TList.Create;
  FPaletteInteractions := TList.Create;
  FDiagramMenuInteractions := TList.Create;
  FModelMenuInteractions := TList.Create;
  MainForm.OnModelAddMenuClicked := MainFormModelAddMenuClicked;
  MainForm.OnModelAddDiagramMenuClicked := MainFormDiagramAddMenuClicked;
  MainForm.OnElementCreating := MainFormElementCreatingHandler;
  //MainForm.PaletteNavBarFrame.OnHandlerButtonClicked := MainFormHandlingButtonClicked;
  MainForm.PaletteNavBarFrame.OnButtonClicked := HandleButtonClicked;
  MainForm.PaletteNavBarFrame.OnPaletteChanged := MainFormPaletteChanged;
  //MainForm.PaletteNavBarFrame.OnPaletteNavBarCustomDrawLink := MainFormPaletteNavBarCustomDrawLink;
  //FHandlerLocked := False;
end;

destructor PInteractionManager.Destroy;
var
  I: Integer;
begin
  for I := PaletteItemInteractionCount - 1 downto 0 do
    PaletteItemInteractions[I].Free;
  for I := PaletteInteractionCount - 1 downto 0 do
    PaletteInteractions[I].Free;
  for I := DiagramMenuInteractionCount - 1 downto 0 do
    DiagramMenuInteractions[I].Free;
  for I := ModelMenuInteractionCount - 1 downto 0 do
    ModelMenuInteractions[I].Free;
  FPaletteItemInteractions.Free;
  FPaletteInteractions.Free;
  FDiagramMenuInteractions.Free;
  FModelMenuInteractions.Free;
  inherited;
end;

function PInteractionManager.GetPaletteItemInteractionCount: Integer;
begin
  Result := FPaletteItemInteractions.Count;
end;

function PInteractionManager.GetPaletteItemInteraction(Index: Integer): PPaletteItemInteraction;
begin
  Result := FPaletteItemInteractions[Index];
end;

function PInteractionManager.GetPaletteInteractionCount: Integer;
begin
  Result := FPaletteInteractions.Count;
end;

function PInteractionManager.GetPaletteInteraction(Index: Integer): PPaletteInteraction;
begin
  Result := FPaletteInteractions[Index];
end;

function PInteractionManager.GetDiagramMenuInteractionCount: Integer;
begin
  Result := FDiagramMenuInteractions.Count;
end;

function PInteractionManager.GetDiagramMenuInteraction(Index: Integer): PDiagramMenuInteraction;
begin
  Result := FDiagramMenuInteractions[Index];
end;

function PInteractionManager.GetModelMenuInteractionCount: Integer;
begin
  Result := FModelMenuInteractions.Count;
end;

function PInteractionManager.GetModelMenuInteraction(Index: Integer): PModelMenuInteraction;
begin
  Result := FModelMenuInteractions[Index];
end;


procedure PInteractionManager.HandleButtonClicked(Sender: TNavBarItem);
var
  PalItemInteraction: PPaletteItemInteraction;
begin
    PalItemInteraction := FindPaletteItemInteraction(Sender);
    // ASSERTIONS
    Assert(PalItemInteraction <> nil);
    // ASSERTIONS
    if PalItemInteraction.HanderName = MainForm.ActiveHandlerName then begin
      MainForm.PaletteNavBarFrame.ButtonClickHandlerReady := True;
      MainForm.PaletteNavBarFrame.MultipleUseItemSelected;
    end
    else begin
      MainForm.ActivateHandler(PalItemInteraction.HanderName);
      MainForm.PaletteNavBarFrame.SingleUseItemSelected;
      MainForm.PaletteNavBarFrame.ButtonClickHandlerReady := False;
    end;
    // call some mainform service (change menu state)
end;

procedure PInteractionManager.MainFormModelAddMenuClicked(Sender: TObject);
var
  MI: PModelMenuInteraction;
  PredefMI: PPredefinedModelMenuInteraction;
  ExtMI: PExtendedModelMenuInteraction;
begin
  // PRECONDITIONS
  //Assert(Sender is TdxBarButton);
  // PRECONDITIONS

  //MI := FindModelMenuInteraction(Sender as TdxBarButton);
  MI := FindModelMenuInteraction(Sender as TMenuElementHandle);
  // ASSERTIONS
  Assert(MI <> nil);
  // ASSERTIONS
  if MI is PPredefinedModelMenuInteraction then begin
    PredefMI := MI as PPredefinedModelMenuInteraction;
    if Assigned(FOnModelAdding) then
      FOnModelAdding(Self, PredefMI.ModelKind, PredefMI.Argument);
  end
  else if MI is PExtendedModelMenuInteraction then begin
    ExtMI := MI as PExtendedModelMenuInteraction;
    if Assigned(FOnExtModelAdding) then
      FOnExtModelAdding(Self, ExtMI.ModelPrototype.Profile.Name, ExtMI.ModelPrototype.Name);
  end;
end;

procedure PInteractionManager.MainFormDiagramAddMenuClicked(Sender: TObject);
var
  DI: PDiagramMenuInteraction;
  PredefDI: PPredefinedDiagramMenuInteraction;
  ExtDI: PExtendedDiagramMenuInteraction;
begin
  // PRECONDITIONS
  //Assert(Sender is TdxBarButton);
  // PRECONDITIONS
  DI := FindDiagramMenuInteraction(Sender as TMenuElementHandle);
  // ASSERTIONS
  Assert(DI <> nil);
  // ASSERTIONS
  if DI is PPredefinedDiagramMenuInteraction then begin
    PredefDI := DI as PPredefinedDiagramMenuInteraction;
    if Assigned(FOnDiagramAdding) then
      FOnDiagramAdding(Self, PredefDI.DiagramKind);
  end
  else if DI is PExtendedDiagramMenuInteraction then begin
    ExtDI := DI as PExtendedDiagramMenuInteraction;
    if Assigned(FOnExtDiagramAdding) then
      FOnExtDiagramAdding(Self, ExtDI.DiagramType.Profile.Name, ExtDI.DiagramType.Name);
  end;
end;

procedure PInteractionManager.MainFormElementCreatingHandler(Sender: TObject; HandlerName: string; X1, Y1, X2, Y2: Integer);
var
  PI: PPaletteItemInteraction;
  PredefPI: PPredefinedPaletteItemInteraction;
  ExtPI: PExtendedPaletteItemInteraction;
begin
  PI := FindPaletteItemInteraction(HandlerName);
  // ASSERTIONS
  Assert(PI <> nil);
  // ASSERTIONS
  if PI is PPredefinedPaletteItemInteraction then begin
    PredefPI := PI as PPredefinedPaletteItemInteraction;
    if Assigned(FOnElementCreating) then
      FOnElementCreating(Self, PredefPI.ElementKind, PredefPI.Argument, X1, Y1, X2, Y2);
  end
  else if PI is PExtendedPaletteItemInteraction then begin
    ExtPI := PI as PExtendedPaletteItemInteraction;
    if Assigned(FOnExtElementCreating) then
      FOnExtElementCreating(Self, ExtPI.ElementPrototype.Profile.Name, ExtPI.ElementPrototype.Name, X1, Y1, X2, Y2);
  end;
  if not MainForm.PaletteNavBarFrame.ButtonClickHandlerReady then begin
    //FHandlerLocked := False;
    MainForm.PaletteNavBarFrame.ActivateSelectHandler(true);
  end;
end;

procedure PInteractionManager.MainFormPaletteChanged(Sender: TObject);
begin
  //MainForm.PaletteNavBarFrame.HandlerLocked := False;
  MainForm.PaletteNavBarFrame.ActivateSelectHandler(false);
end;


function PInteractionManager.FindPaletteItemInteraction(NavBarItem: TNavBarItem): PPaletteItemInteraction;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to PaletteItemInteractionCount - 1 do
    //if PaletteItemInteractions[I].NavBarItem.Equals(NavBarItem) then begin
    if PaletteItemInteractions[I].NavBarItem = NavBarItem then begin
      Result := PaletteItemInteractions[I];
      Exit;
    end;
end;

function PInteractionManager.FindModelMenuInteraction(MenuButton: TMenuElementHandle): PModelMenuInteraction;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to ModelMenuInteractionCount - 1 do
    if ModelMenuInteractions[I].MenuButton = MenuButton then begin
      Result := ModelMenuInteractions[I];
      Exit;
    end;
end;

function PInteractionManager.FindDiagramMenuInteraction(MenuButton: TMenuElementHandle): PDiagramMenuInteraction;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to DiagramMenuInteractionCount - 1 do
    if DiagramMenuInteractions[I].MenuButton = MenuButton then begin
      Result := DiagramMenuInteractions[I];
      Exit;
    end;
end;

function PInteractionManager.FindPaletteInteraction(Name: string): PPaletteInteraction;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to PaletteInteractionCount - 1 do
    if PaletteInteractions[I].Name = Name then begin
      Result := PaletteInteractions[I];
      Exit;
    end;
end;

function PInteractionManager.FindPaletteItemInteraction(HandlerName: string): PPaletteItemInteraction;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to PaletteItemInteractionCount - 1 do
    if PaletteItemInteractions[I].HanderName = HandlerName then begin
      Result := PaletteItemInteractions[I];
      Exit;
    end;
end;

function PInteractionManager.FindPredefinedDiagramMenuInteraction(DiagramKind: string): PPredefinedDiagramMenuInteraction;
var
  DI: PPredefinedDiagramMenuInteraction;
  I: Integer;
begin
  Result := nil;
  for I := 0 to DiagramMenuInteractionCount - 1 do
    if DiagramMenuInteractions[I] is PPredefinedDiagramMenuInteraction then begin
      DI := DiagramMenuInteractions[I] as PPredefinedDiagramMenuInteraction;
      if DI.DiagramKind = DiagramKind then begin
        Result := DI;
        Exit;
      end;
    end;
end;

function PInteractionManager.FindPredefinedModelMenuInteraction(ModelKind: string): PPredefinedModelMenuInteraction;
var
  MI: PPredefinedModelMenuInteraction;
  I: Integer;
begin
  Result := nil;
  for I := 0 to ModelMenuInteractionCount - 1 do
    if ModelMenuInteractions[I] is PPredefinedModelMenuInteraction then begin
      MI := ModelMenuInteractions[I] as PPredefinedModelMenuInteraction;
      if MI.ModelKind = ModelKind then begin
        Result := MI;
        Exit;
      end;
    end;
end;

function PInteractionManager.FindPredefinedPaletteItemInteraction(ElementKind: string): PPredefinedPaletteItemInteraction;
var
  PI: PPredefinedPaletteItemInteraction;
  I: Integer;
begin
  Result := nil;
  for I := 0 to PaletteItemInteractionCount - 1 do
    if PaletteItemInteractions[I] is PPredefinedPaletteItemInteraction then begin
      PI := PaletteItemInteractions[I] as PPredefinedPaletteItemInteraction;
      if PI.ElementKind = ElementKind then begin
        Result := PI;
        Exit;
      end;
    end;
end;

function PInteractionManager.FindExtendedPaletteInteraction(Palette: PPalette): PExtendedPaletteInteraction;
var
  PI: PExtendedPaletteInteraction;
  I: Integer;
begin
  Result := nil;
  for I := 0 to PaletteInteractionCount - 1 do
    if PaletteInteractions[I] is PExtendedPaletteInteraction then begin
      PI := PaletteInteractions[I] as PExtendedPaletteInteraction;
      if PI.Palette = Palette then begin
        Result := PI;
        Exit;
      end;
    end;
end;

function PInteractionManager.FindExtendedPaletteItemInteraction(Profile: PProfile; ElementPrototypeName: string): PExtendedPaletteItemInteraction;
var
  PI: PExtendedPaletteItemInteraction;
  I: Integer;
begin
  Result := nil;
  for I := 0 to PaletteItemInteractionCount - 1 do
    if PaletteItemInteractions[I] is PExtendedPaletteItemInteraction then begin
      PI := PaletteItemInteractions[I] as PExtendedPaletteItemInteraction;
      if (PI.ElementPrototype.Profile = Profile) and (PI.ElementPrototype.Name = ElementPrototypeName) then begin
        Result := PI;
        Exit;
      end;
    end;
end;

function PInteractionManager.FindExtendedDiagramMenuInteraction(DiagramTypeName: string): PExtendedDiagramMenuInteraction;
var
  DI: PExtendedDiagramMenuInteraction;
  I: Integer;
begin
  Result := nil;
  for I := 0 to DiagramMenuInteractionCount - 1 do
    if DiagramMenuInteractions[I] is PExtendedDiagramMenuInteraction then begin
      DI := DiagramMenuInteractions[I] as PExtendedDiagramMenuInteraction;
      if DI.DiagramType.Name = DiagramTypeName then begin
        Result := DI;
        Exit;
      end;
    end;
end;

procedure PInteractionManager.AddPredefinedDiagramMenuInteraction(DiagramKind: string; MenuButton: TMenuElementHandle; AvailablePalettes: array of string);
var
  DI: PPredefinedDiagramMenuInteraction;
  I: Integer;
begin
  DI := PPredefinedDiagramMenuInteraction.Create;
  DI.DiagramKind := DiagramKind;
  DI.MenuButton := MenuButton;
  for I := 0 to Length(AvailablePalettes) - 1 do
    DI.AddAvailablePalette(AvailablePalettes[I]);
  FDiagramMenuInteractions.Add(DI);
end;

procedure PInteractionManager.AddPredefinedModelMenuInteraction(ModelKind: string; Argument: Integer; MenuButton: TMenuElementHandle);
var
  MI: PPredefinedModelMenuInteraction;
begin
  MI := PPredefinedModelMenuInteraction.Create;
  MI.ModelKind := ModelKind;
  MI.Argument := Argument;
  MI.MenuButton := MenuButton;
  FModelMenuInteractions.Add(MI);
end;

procedure PInteractionManager.AddPredefinedPaletteInteraction(Name: string; NavBarGroup: TNavBarGroup);
var
  PI: PPredefinedPaletteInteraction;
begin
  PI := PPredefinedPaletteInteraction.Create;
  PI.Name := Name;
  PI.NavBarGroup := NavBarGroup;
  //PI.NavBarGroup := MainForm.PaletteNavBarFrame.CreateNavBarGroup(NavBarGroup);
  FPaletteInteractions.Add(PI);
end;

procedure PInteractionManager.AddPredefinedPaletteItemInteraction(ElementKind: string; Argument: Integer; HandlerName: string; NavBarItem: TNavBarItem);
var
  PII: PPredefinedPaletteItemInteraction;
begin
  PII := PPredefinedPaletteItemInteraction.Create;
  PII.ElementKind := ElementKind;
  PII.Argument := Argument;
  PII.HanderName := HandlerName;
  PII.NavBarItem := NavBarItem;
  FPaletteItemInteractions.Add(PII);
end;

procedure PInteractionManager.AddExtDiagramMenuInteraction(ADiagramType: PDiagramType; IsFirst: Boolean = False);
var
  //BaseDI: PPredefinedDiagramMenuInteraction;
  DI: PExtendedDiagramMenuInteraction;
  MenuButton: TMenuElementHandle;
  //MenuLink: TdxBarItemLink;
  //BarGroup: TdxBarGroup;
  //Submenu: TSubmenuHandle;
  //Category: TMenuElementGroup;
  I: Integer;
begin
  with MainForm do begin
    MenuButton := MenuManager.CreateMenuElement;
    MenuButton.Caption := ADiagramType.DisplayName;
    MenuButton.ImageIndex := ADiagramType.ImageIndex;
    MenuButton.OnClick := MainFormDiagramAddMenuClicked;
    MenuManager.GetSubmenu(MODEL_ADD_DIAGRAM_SUBMENU).AddMenuElement(MenuButton, IsFirst);

    {MenuButton := TdxBarButton.Create(MainForm);
    MenuButton.Caption := ADiagramType.DisplayName;
    MenuButton.ImageIndex := ADiagramType.ImageIndex;
    MenuButton.OnClick := MainFormDiagramAddMenuClicked;
    MenuLink := ModelAddDiagram.ItemLinks.Add;
    MenuLink.Item := MenuButton;
    MenuLink.BeginGroup := IsFirst;}
    //BaseDI := FindPredefinedDiagramMenuInteraction(ADiagramType.BaseDiagram);
    // ASSERTIONS
    //Assert(BaseDI <> nil);
    // ASSERTIONS
    //Submenu := GetContainerMenuBarGroup(BaseDI.MenuButton);
    //Category := MenuManager.GetGroup(BaseDI.MenuButton);
    // ASSERTIONS
    //Assert(Category <> nil);
    // ASSERTIONS
    //Submenu.AddMenuElement(MenuButton);
    //Category.AddElement(MenuButton);
  end;
  DI := PExtendedDiagramMenuInteraction.Create;
  DI.DiagramType := ADiagramType;
  DI.MenuButton := MenuButton;
  for I := 0 to ADiagramType.AvailablePaletteCount - 1 do
    DI.AddAvailablePalette(ADiagramType.AvailablePalettes[I]);
  FDiagramMenuInteractions.Add(DI);
end;


procedure PInteractionManager.AddExtModelMenuInteraction(AModelPrototype: PModelPrototype);
var
  BaseMI: PPredefinedModelMenuInteraction;
  MI: PExtendedModelMenuInteraction;
  MenuButton: TMenuElementHandle;
  //MenuLink: TdxBarItemLink;
  //BarGroup: TdxBarGroup;
  Category: TMenuElementGroup;
begin
  // PRECONDITIONS
  Assert(AModelPrototype.BaseModel <> '');
  Assert(AModelPrototype.ContainerModelCount > 0);
  // PRECONDITIONS
  with MainForm do begin
    {MenuButton := TdxBarButton.Create(MainForm);
    MenuButton.Caption := AModelPrototype.DisplayName;
    MenuButton.ImageIndex := AModelPrototype.ImageIndex;
    MenuButton.OnClick := MainFormModelAddMenuClicked;
    MenuLink := ModelAdd.ItemLinks.Add;
    MenuLink.Index := 0;
    MenuLink.Item := MenuButton;}

    MenuButton := MenuManager.CreateMenuElement;
    MenuButton.Caption := AModelPrototype.DisplayName;
    MenuButton.ImageIndex := AModelPrototype.ImageIndex;
    MenuButton.OnClick := MainFormModelAddMenuClicked;
    MenuManager.GetSubmenu(MODEL_ADD_SUBMENU).AddMenuElement(MenuButton);


    BaseMI := FindPredefinedModelMenuInteraction(AModelPrototype.BaseModel);
    // ASSERTIONS
    Assert(BaseMI <> nil);
    // ASSERTIONS
    //BarGroup := GetContainerMenuBarGroup(BaseMI.MenuButton);
    //BarGroup.Add(MenuButton);
    Category := MenuManager.GetGroup(BaseMI.MenuButton);
    Category.AddElement(MenuButton);
  end;
  MI := PExtendedModelMenuInteraction.Create;
  MI.ModelPrototype := AModelPrototype;
  MI.MenuButton := MenuButton;
  MI.BaseMenuButton := BaseMI.MenuButton;
  FModelMenuInteractions.Add(MI);
end;

procedure PInteractionManager.AddExtPaletteInteraction(APalette: PPalette);
var
  PI: PExtendedPaletteInteraction;
  NavBarGroup: TNavBarGroup;
begin
  //NavBarGroup := MainForm.PaletteNavBarFrame.PaletteNavBar.Groups.Add;
  NavBarGroup := MainForm.PaletteNavBarFrame.CreateNavBarGroup;
  NavBarGroup.Caption := APalette.DisplayName;
  NavBarGroup.Visible := True;
  NavBarGroup.AddItem(MainForm.PaletteNavBarFrame.GetPredefinedInteractionItem(SELECT_HANDLER));
  PI := PExtendedPaletteInteraction.Create;
  PI.Name := APalette.Name;
  PI.NavBarGroup := NavBarGroup;
  PI.Palette := APalette;
  FPaletteInteractions.Add(PI);
end;

procedure PInteractionManager.AddExtPaletteItemInteraction(AElementPrototype: PElementPrototype);
var
  PII: PExtendedPaletteItemInteraction;
  NavBarItem: TNavBarItem;
  HandlerName: string;
begin
  HandlerName := AElementPrototype.Name + HANDLER_POSTFIX;
  MainForm.AddCreateHandler(HandlerName, [], DragTypeToSkeletonPaintKind(AElementPrototype.DragType));
  //NavBarItem := MainForm.PaletteNavBarFrame.PaletteNavBar.Items.Add;
  NavBarItem := MainForm.PaletteNavBarFrame.CreateNavBarItem;
  NavBarItem.Caption := AElementPrototype.DisplayName;
  //NavBarItem.SmallImageIndex := AElementPrototype.ImageIndex;
  //NavBarItem.OnClick := MainFormHandlingButtonClicked;
  NavBarItem.ImageIndex := AElementPrototype.ImageIndex;

  PII := PExtendedPaletteItemInteraction.Create;
  PII.ElementPrototype := AElementPrototype;
  PII.HanderName := HandlerName;
  PII.NavBarItem := NavBarItem;
  FPaletteItemInteractions.Add(PII);
end;

procedure PInteractionManager.CreatePaletteItemLinks(APalette: PPalette);
var
  PI: PExtendedPaletteInteraction;
  PII: PPaletteItemInteraction;
  I: Integer;
begin
  PI := FindExtendedPaletteInteraction(APalette);
  // ASSERTIONS
  Assert(PI <> nil);
  // ASSERTIONS
  for I := 0 to APalette.PaletteItemCount - 1 do begin
    PII := FindExtendedPaletteItemInteraction(APalette.Profile, APalette.PaletteItems[I]);
    if PII = nil then
      PII := FindPredefinedPaletteItemInteraction(APalette.PaletteItems[I]);
    if PII <> nil then
      PI.NavBarGroup.AddItem(PII.NavBarItem);
  end;
end;

procedure PInteractionManager.AddPredefinedCreateHandlers;
begin
  with MainForm do begin
    AddCreateHandler(TEXT_CREATE_HANDLER,                [],              spRect);
    AddCreateHandler(NOTE_CREATE_HANDLER,                [],              spRect);
    AddCreateHandler(NOTE_LINK_CREATE_HANDLER,            [],              spLine);
    AddCreateHandler(SUBSYSTEM_CREATE_HANDLER,           [],              spRect);
    AddCreateHandler(PACKAGE_CREATE_HANDLER,             [],              spRect);
    AddCreateHandler(USE_CASE_CREATE_HANDLER,             [],              spRect);
    AddCreateHandler(ACTOR_CREATE_HANDLER,               [],              spRect);
    AddCreateHandler(CLASS_CREATE_HANDLER,               [],              spRect);
    AddCreateHandler(INTERFACE_CREATE_HANDLER,           [],              spRect);
    AddCreateHandler(ENUMERATION_CREATE_HANDLER,         [],              spRect);
    AddCreateHandler(SIGNAL_CREATE_HANDLER,              [],              spRect);
    AddCreateHandler(EXCEPTION_CREATE_HANDLER,           [],              spRect);
    AddCreateHandler(COMPONENT_CREATE_HANDLER,           [],              spRect);
    AddCreateHandler(COMPONENT_INSTANCE_CREATE_HANDLER,   [],              spRect);
    AddCreateHandler(NODE_CREATE_HANDLER,                [],              spRect);
    AddCreateHandler(NODE_INSTANCE_CREATE_HANDLER,        [],              spRect);
    AddCreateHandler(ASSOCIATION_CREATE_HANDLER,         [],              spLine);
    AddCreateHandler(DIRECTED_ASSOCIATION_HANDLER,       [],              spLine);
    AddCreateHandler(AGGREGATION_HANDLER,               [],              spLine);
    AddCreateHandler(COMPOSITION_HANDLER,               [],              spLine);
    AddCreateHandler(GENERALIZATION_CREATE_HANDLER,      [],              spLine);
    AddCreateHandler(DEPENDENCY_CREATE_HANDLER,          [],              spLine);
    AddCreateHandler(REALIZATION_CREATE_HANDLER,         [],              spLine);
    AddCreateHandler(ASSOCIATION_CLASS_CREATE_HANDLER,    [],              spLine);
    AddCreateHandler(INCLUDE_CREATE_HANDLER,             [],              spLine);
    AddCreateHandler(EXTEND_CREATE_HANDLER,              [],              spLine);
    AddCreateHandler(OBJECT_CREATE_HANDLER,              [],              spRect);
    AddCreateHandler(CLASSIFIER_ROLE_CREATE_HANDLER,      [],              spRect);
    AddCreateHandler(ASSOCIATION_ROLE_CREATE_HANDLER,     [],              spLine);
    AddCreateHandler(SELF_ASSOCIATION_ROLE_CREATE_HANDLER, [],              spLine);
    AddCreateHandler(LINK_CREATE_HANDLER,                [],              spLine);
    AddCreateHandler(SELF_LINK_CREATE_HANDLER,            [],              spLine);
    AddCreateHandler(MESSAGE_CREATE_HANDLER,             [],              spLine);
    AddCreateHandler(SELF_MESSAGE_CREATE_HANDLER,         [],              spLine);
    AddCreateHandler(FORWARD_MESSAGE_CREATE_HANDLER,      [],              spLine);
    AddCreateHandler(REVERSE_MESSAGE_CREATE_HANDLER,      [],              spLine);
    AddCreateHandler(STIMULUS_CREATE_HANDLER,            [],              spLine);
    AddCreateHandler(SELF_STIMULUS_CREATE_HANDLER,        [],              spLine);
    AddCreateHandler(FORWARD_STIMULUS_CREATE_HANDLER,     [],              spLine);
    AddCreateHandler(REVERSE_STIMULUS_CREATE_HANDLER,     [],              spLine);
    AddCreateHandler(STATE_CREATE_HANDLER,               [PUMLStateView], spRect);
    AddCreateHandler(SUBMACHINE_STATE_CREATE_HANDLER,     [PUMLStateView], spRect);
    AddCreateHandler(ACTIVITY_CREATE_HANDLER,            [],              spRect);
    AddCreateHandler(SUBACTIVITY_STATE_CREATE_HANDLER,    [],              spRect);
    AddCreateHandler(FINAL_STATE_CREATE_HANDLER,          [PUMLStateView], spRect);
    AddCreateHandler(INITIAL_STATE_CREATE_HANDLER,        [PUMLStateView], spRect);
    AddCreateHandler(JUNCTION_POINT_CREATE_HANDLER,       [PUMLStateView], spRect);
    AddCreateHandler(CHOICE_POINT_CREATE_HANDLER,         [PUMLStateView], spRect);
    AddCreateHandler(DEEP_HISTORY_CREATE_HANDLER,         [PUMLStateView], spRect);
    AddCreateHandler(SHALLOW_HISTORY_CREATE_HANDLER,      [PUMLStateView], spRect);
    AddCreateHandler(SYNCHRONIZATION_CREATE_HANDLER,     [PUMLStateView], spLine);
    AddCreateHandler(DECISION_CREATE_HANDLER,            [],              spRect);
    AddCreateHandler(TRANSITION_CREATE_HANDLER,          [],              spLine);
    AddCreateHandler(SELF_TRANSITION_CREATE_HANDLER,      [],              spLine);
    AddCreateHandler(VERTICAL_SWIMLANE_CREATE_HANDLER,    [],              spRect);
    AddCreateHandler(HORIZONTAL_SWIMLANE_CREATE_HANDLER,  [],              spRect);
    AddCreateHandler(OBJECT_FLOW_STATE_CREATE_HANDLER,     [PUMLStateView], spRect);
    AddCreateHandler(FLOW_FINAL_STATE_CREATE_HANDLER,      [PUMLStateView], spRect);
    AddCreateHandler(SYSTEM_BOUNDARY_CREATE_HANDLER,      [],              spRect);
    AddCreateHandler(SIGNAL_ACCEPT_STATE_CREATE_HANDLER,   [],              spRect);
    AddCreateHandler(SIGNAL_SEND_STATE_CREATE_HANDLER,     [],              spRect);
    AddCreateHandler(ARTIFACT_CREATE_HANDLER,            [],              spRect);
    AddCreateHandler(PORT_CREATE_HANDLER,                [],              spRect);
    AddCreateHandler(PART_CREATE_HANDLER,                [],              spRect);
    AddCreateHandler(CONNECTOR_CREATE_HANDLER,           [],              spLine);
    AddCreateHandler(COMBINED_FRAGMENT_CREATE_HANDLER,    [],              spRect);
    AddCreateHandler(INTERACTION_OPERAND_CREATE_HANDLER,  [],              spRect);
    AddCreateHandler(FRAME_CREATE_HANDLER,               [],              spRect);
    AddCreateHandler(RECTANGLE_CREATE_HANDLER,           [],              spRect);
    AddCreateHandler(ELLIPSE_CREATE_HANDLER,             [],              spRect);
    AddCreateHandler(ROUND_RECT_CREATE_HANDLER,           [],              spRect);
    AddCreateHandler(LINE_CREATE_HANDLER,                [],              spLine);
    AddCreateHandler(IMAGE_CREATE_HANDLER,               [],              spRect);
  end;
end;

procedure PInteractionManager.BuildPredefinedInteractions;
begin
  AddPredefinedCreateHandlers;
  with MainForm do begin
    { diagram menu interactions }
    with MenuManager do begin
      AddPredefinedDiagramMenuInteraction(DK_USECASE_DIAGRAM, GetPredefinedElement(MODEL_ADD_USE_CASE_DIAGRAM), ['UseCase']);
      AddPredefinedDiagramMenuInteraction(DK_CLASS_DIAGRAM, GetPredefinedElement(MODEL_ADD_CLASS_DIAGRAM), ['Class']);
      AddPredefinedDiagramMenuInteraction(DK_SEQUENCEROLE_DIAGRAM, GetPredefinedElement(MODEL_ADD_SEQUENCE_ROLE_DIAGRAM), ['SequenceRole']);
      AddPredefinedDiagramMenuInteraction(DK_SEQUENCE_DIAGRAM, GetPredefinedElement(MODEL_ADD_SEQUENCE_DIAGRAM), ['Sequence']);
      AddPredefinedDiagramMenuInteraction(DK_COLLABORATIONROLE_DIAGRAM, GetPredefinedElement(MODEL_ADD_COLLABORATION_ROLE_DIAGRAM), ['CollaborationRole']);
      AddPredefinedDiagramMenuInteraction(DK_COLLABORATION_DIAGRAM, GetPredefinedElement(MODEL_ADD_COLLABORATION_DIAGRAM), ['Collaboration']);
      AddPredefinedDiagramMenuInteraction(DK_STATECHART_DIAGRAM, GetPredefinedElement(MODEL_ADD_STATE_CHART_DIAGRAM), ['Statechart']);
      AddPredefinedDiagramMenuInteraction(DK_ACTIVITY_DIAGRAM, GetPredefinedElement(MODEL_ADD_ACTIVITY_DIAGRAM), ['Activity']);
      AddPredefinedDiagramMenuInteraction(DK_COMPONENT_DIAGRAM, GetPredefinedElement(MODEL_ADD_COMPONENT_DIAGRAM), ['Component']);
      AddPredefinedDiagramMenuInteraction(DK_DEPLOYMENT_DIAGRAM, GetPredefinedElement(MODEL_ADD_DEPLOYMENT_DIAGRAM), ['Deployment']);
      AddPredefinedDiagramMenuInteraction(DK_COMPOSITESTRUCTURE_DIAGRAM, GetPredefinedElement(MODEL_ADD_COMPOSITE_STRUCTURE_DIAGRAM), ['CompositeStructure']);
    end;
    { model menu interactions }
    with MenuManager do begin
      AddPredefinedModelMenuInteraction(EK_MODEL, 0, GetPredefinedElement(MODEL_ADD_MODEL));
      AddPredefinedModelMenuInteraction(EK_SUBSYSTEM, 0, GetPredefinedElement(MODEL_ADD_SUBSYSTEM));
      AddPredefinedModelMenuInteraction(EK_PACKAGE, 0, GetPredefinedElement(MODEL_ADD_PACKAGE));
      AddPredefinedModelMenuInteraction(EK_CLASS, 0, GetPredefinedElement(MODEL_ADD_CLASS));
      AddPredefinedModelMenuInteraction(EK_INTERFACE, 0, GetPredefinedElement(MODEL_ADD_INTERFACE));
      AddPredefinedModelMenuInteraction(EK_USECASE, 0, GetPredefinedElement(MODEL_ADD_USE_CASE));
      AddPredefinedModelMenuInteraction(EK_ACTOR, 0, GetPredefinedElement(MODEL_ADD_ACTOR));
      AddPredefinedModelMenuInteraction(EK_SIGNAL, 0, GetPredefinedElement(MODEL_ADD_SIGNAL));
      AddPredefinedModelMenuInteraction(EK_EXCEPTION, 0, GetPredefinedElement(MODEL_ADD_EXCEPTION));
      AddPredefinedModelMenuInteraction(EK_OBJECT, 0, GetPredefinedElement(MODEL_ADD_OBJECT));
      AddPredefinedModelMenuInteraction(EK_ENUMERATION, 0, GetPredefinedElement(MODEL_ADD_ENUMERATION));
      AddPredefinedModelMenuInteraction(EK_COMPONENT, 0, GetPredefinedElement(MODEL_ADD_COMPONENT));
      AddPredefinedModelMenuInteraction(EK_COMPONENTINSTANCE, 0, GetPredefinedElement(MODEL_ADD_COMPONENT_INSTANCE));
      AddPredefinedModelMenuInteraction(EK_NODE, 0, GetPredefinedElement(MODEL_ADD_NODE));
      AddPredefinedModelMenuInteraction(EK_NODEINSTANCE, 0, GetPredefinedElement(MODEL_ADD_NODE_INSTANCE));
      AddPredefinedModelMenuInteraction(EK_OPERATION, 0, GetPredefinedElement(MODEL_ADD_OPERATION));
      AddPredefinedModelMenuInteraction(EK_ATTRIBUTE, 0, GetPredefinedElement(MODEL_ADD_ATTRIBUTE));
      AddPredefinedModelMenuInteraction(EK_PARAMETER, 0, GetPredefinedElement(MODEL_ADD_PARAMETER));
      AddPredefinedModelMenuInteraction(EK_TEMPLATEPARAMETER, 0, GetPredefinedElement(MODEL_ADD_TEMPLATE_PARAMETER));
      AddPredefinedModelMenuInteraction(EK_ENUMERATIONLITERAL, 0, GetPredefinedElement(MODEL_ADD_ENUMERATION_LITERAL));
      AddPredefinedModelMenuInteraction(EK_COLLABORATION, 0, GetPredefinedElement(MODEL_ADD_COLLABORATION));
      AddPredefinedModelMenuInteraction(EK_COLLABORATIONINSTANCESET, 0, GetPredefinedElement(MODEL_ADD_COLLABORATION_INSTANCE_SET));
      AddPredefinedModelMenuInteraction(EK_CLASSIFIERROLE, 0, GetPredefinedElement(MODEL_ADD_CLASSIFIER_ROLE));
      AddPredefinedModelMenuInteraction(EK_INTERACTION, 0, GetPredefinedElement(MODEL_ADD_INTERACTION));
      AddPredefinedModelMenuInteraction(EK_INTERACTIONINSTANCESET, 0, GetPredefinedElement(MODEL_ADD_INTERACTION_INSTANCE_SET));
      AddPredefinedModelMenuInteraction(EK_STATEMACHINE, 0, GetPredefinedElement(MODEL_ADD_STATE_MACHINE));
      AddPredefinedModelMenuInteraction(EK_ACTIVITYGRAPH, 0, GetPredefinedElement(MODEL_ADD_ACTIVITY_GRAPH));
      AddPredefinedModelMenuInteraction(EK_STATE, 0, GetPredefinedElement(MODEL_ADD_STATE));
      AddPredefinedModelMenuInteraction(EK_SUBMACHINESTATE, 0, GetPredefinedElement(MODEL_ADD_SUBMACHINE_STATE));
      AddPredefinedModelMenuInteraction(EK_ACTIONSTATE, 0, GetPredefinedElement(MODEL_ADD_ACTION_STATE));
      AddPredefinedModelMenuInteraction(EK_SUBACTIVITYSTATE, 0, GetPredefinedElement(MODEL_ADD_SUBACTIVITY_STATE));
      AddPredefinedModelMenuInteraction(EK_FINALSTATE, 0, GetPredefinedElement(MODEL_ADD_FINAL_STATE));
      AddPredefinedModelMenuInteraction(EK_PSEUDOSTATE, FA_PSEUDOSTATE_INITIALSTATE, GetPredefinedElement(MODEL_ADD_INITIAL_STATE));
      AddPredefinedModelMenuInteraction(EK_PSEUDOSTATE, FA_PSEUDOSTATE_DECISION, GetPredefinedElement(MODEL_ADD_DECISION));
      AddPredefinedModelMenuInteraction(EK_PSEUDOSTATE, FA_PSEUDOSTATE_JUNCTIONPOINT, GetPredefinedElement(MODEL_ADD_JUNCTION_POINT));
      AddPredefinedModelMenuInteraction(EK_PSEUDOSTATE, FA_PSEUDOSTATE_CHOICEPOINT, GetPredefinedElement(MODEL_ADD_CHOICE_POINT));
      AddPredefinedModelMenuInteraction(EK_PSEUDOSTATE, FA_PSEUDOSTATE_SHALLOWHISTORY, GetPredefinedElement(MODEL_ADD_SHALLOW_HISTORY));
      AddPredefinedModelMenuInteraction(EK_PSEUDOSTATE, FA_PSEUDOSTATE_DEEPHISTORY, GetPredefinedElement(MODEL_ADD_DEEP_HISTORY));
      AddPredefinedModelMenuInteraction(EK_PSEUDOSTATE, FA_PSEUDOSTATE_SYNCHRONIZATION, GetPredefinedElement(MODEL_ADD_SYNCHRONIZATION));
      AddPredefinedModelMenuInteraction(EK_SWIMLANE, 0, GetPredefinedElement(MODEL_ADD_SWIMLANE));
      AddPredefinedModelMenuInteraction(EK_UNINTERPRETEDACTION, -1, GetPredefinedElement(MODEL_ADD_EFFECT));
      AddPredefinedModelMenuInteraction(EK_UNINTERPRETEDACTION, FA_UNINTERPRETEDACTION_ENTRY, GetPredefinedElement(MODEL_ADD_ENTRY_ACTION));
      AddPredefinedModelMenuInteraction(EK_UNINTERPRETEDACTION, FA_UNINTERPRETEDACTION_DO, GetPredefinedElement(MODEL_ADD_DO_ACTION));
      AddPredefinedModelMenuInteraction(EK_UNINTERPRETEDACTION, FA_UNINTERPRETEDACTION_EXIT, GetPredefinedElement(MODEL_ADD_EXIT_ACTION));
      AddPredefinedModelMenuInteraction(EK_SIGNALEVENT, 0, GetPredefinedElement(MODEL_ADD_SIGNAL_EVENT));
      AddPredefinedModelMenuInteraction(EK_CALLEVENT, 0, GetPredefinedElement(MODEL_ADD_CALL_EVENT));
      AddPredefinedModelMenuInteraction(EK_TIMEEVENT, 0, GetPredefinedElement(MODEL_ADD_TIME_EVENT));
      AddPredefinedModelMenuInteraction(EK_CHANGEEVENT, 0, GetPredefinedElement(MODEL_ADD_CHANGE_EVENT));
      AddPredefinedModelMenuInteraction(EK_OBJECTFLOWSTATE, 0, GetPredefinedElement(MODEL_ADD_OBJECT_FLOW_STATE));
      AddPredefinedModelMenuInteraction(EK_FLOWFINALSTATE, 0, GetPredefinedElement(MODEL_ADD_FLOW_FINAL_STATE));
      AddPredefinedModelMenuInteraction(EK_SIGNALACCEPTSTATE, 0, GetPredefinedElement(MODEL_ADD_SIGNAL_ACCEPT_STATE));
      AddPredefinedModelMenuInteraction(EK_SIGNALSENDSTATE, 0, GetPredefinedElement(MODEL_ADD_SIGNAL_SEND_STATE));
      AddPredefinedModelMenuInteraction(EK_ARTIFACT, 0, GetPredefinedElement(MODEL_ADD_ARTIFACT));
      AddPredefinedModelMenuInteraction(EK_ATTRIBUTELINK, 0, GetPredefinedElement(MODEL_ADD_ATTRIBUTE_LINK));
      AddPredefinedModelMenuInteraction(EK_PORT, 0, GetPredefinedElement(MODEL_ADD_PORT));
      AddPredefinedModelMenuInteraction(EK_EXTENSIONPOINT, 0, GetPredefinedElement(MODEL_ADD_EXTENSION_POINT));
      AddPredefinedModelMenuInteraction(EK_COMBINEDFRAGMENT, 0, GetPredefinedElement(MODEL_ADD_COMBINED_FRAGMENT));
      AddPredefinedModelMenuInteraction(EK_INTERACTIONOPERAND, 0, GetPredefinedElement(MODEL_ADD_INTERACTION_OPERAND));
   end;


    { palette interactions }
    with PaletteNavBarFrame do begin
      AddPredefinedPaletteInteraction(ANNOTATION_GROUP, GetPredefinedInteractionGroup(ANNOTATION_GROUP));
      AddPredefinedPaletteInteraction(CLASS_GROUP, GetPredefinedInteractionGroup(CLASS_GROUP));
      AddPredefinedPaletteInteraction(USE_CASE_GROUP, GetPredefinedInteractionGroup(USE_CASE_GROUP));
      AddPredefinedPaletteInteraction(SEQUENCE_ROLE_GROUP, GetPredefinedInteractionGroup(SEQUENCE_ROLE_GROUP));
      AddPredefinedPaletteInteraction(SEQUENCE_GROUP, GetPredefinedInteractionGroup(SEQUENCE_GROUP));
      AddPredefinedPaletteInteraction(COLLABORATION_ROLE_GROUP, GetPredefinedInteractionGroup(COLLABORATION_ROLE_GROUP));
      AddPredefinedPaletteInteraction(COLLABORATION_GROUP, GetPredefinedInteractionGroup(COLLABORATION_GROUP));
      AddPredefinedPaletteInteraction(STATECHART_GROUP, GetPredefinedInteractionGroup(STATECHART_GROUP));
      AddPredefinedPaletteInteraction(ACTIVITY_GROUP, GetPredefinedInteractionGroup(ACTIVITY_GROUP));
      AddPredefinedPaletteInteraction(COMPONENT_GROUP, GetPredefinedInteractionGroup(COMPONENT_GROUP));
      AddPredefinedPaletteInteraction(DEPLOYMENT_GROUP, GetPredefinedInteractionGroup(DEPLOYMENT_GROUP));
      AddPredefinedPaletteInteraction(COMPOSITE_STRUCTURE_GROUP, GetPredefinedInteractionGroup(COMPOSITE_STRUCTURE_GROUP));
      { palette item interactions }
      AddPredefinedPaletteItemInteraction(EK_TEXT, 0, TEXT_CREATE_HANDLER, GetPredefinedInteractionItem(TEXT_CREATE_HANDLER));
      AddPredefinedPaletteItemInteraction(EK_NOTE, 0, NOTE_CREATE_HANDLER, GetPredefinedInteractionItem(NOTE_CREATE_HANDLER));
      AddPredefinedPaletteItemInteraction(EK_NOTELINK, 0, NOTE_LINK_CREATE_HANDLER, GetPredefinedInteractionItem(NOTE_LINK_CREATE_HANDLER));
      AddPredefinedPaletteItemInteraction(EK_SUBSYSTEM, 0, SUBSYSTEM_CREATE_HANDLER, GetPredefinedInteractionItem(SUBSYSTEM_CREATE_HANDLER));
      AddPredefinedPaletteItemInteraction(EK_PACKAGE, 0, PACKAGE_CREATE_HANDLER, GetPredefinedInteractionItem(PACKAGE_CREATE_HANDLER));
      AddPredefinedPaletteItemInteraction(EK_USECASE, 0, USE_CASE_CREATE_HANDLER, GetPredefinedInteractionItem(USE_CASE_CREATE_HANDLER));
      AddPredefinedPaletteItemInteraction(EK_ACTOR, 0, ACTOR_CREATE_HANDLER, GetPredefinedInteractionItem(ACTOR_CREATE_HANDLER));
      AddPredefinedPaletteItemInteraction(EK_CLASS, 0, CLASS_CREATE_HANDLER, GetPredefinedInteractionItem(CLASS_CREATE_HANDLER));
      AddPredefinedPaletteItemInteraction(EK_INTERFACE, 0, INTERFACE_CREATE_HANDLER, GetPredefinedInteractionItem(INTERFACE_CREATE_HANDLER));
      AddPredefinedPaletteItemInteraction(EK_ENUMERATION, 0, ENUMERATION_CREATE_HANDLER, GetPredefinedInteractionItem(ENUMERATION_CREATE_HANDLER));
      AddPredefinedPaletteItemInteraction(EK_SIGNAL, 0, SIGNAL_CREATE_HANDLER, GetPredefinedInteractionItem(SIGNAL_CREATE_HANDLER));
      AddPredefinedPaletteItemInteraction(EK_EXCEPTION, 0, EXCEPTION_CREATE_HANDLER, GetPredefinedInteractionItem(EXCEPTION_CREATE_HANDLER));
      AddPredefinedPaletteItemInteraction(EK_COMPONENT, 0, COMPONENT_CREATE_HANDLER, GetPredefinedInteractionItem(COMPONENT_CREATE_HANDLER));
      AddPredefinedPaletteItemInteraction(EK_COMPONENTINSTANCE, 0, COMPONENT_INSTANCE_CREATE_HANDLER, GetPredefinedInteractionItem(COMPONENT_INSTANCE_CREATE_HANDLER));
      AddPredefinedPaletteItemInteraction(EK_NODE, 0, NODE_CREATE_HANDLER, GetPredefinedInteractionItem(NODE_CREATE_HANDLER));
      AddPredefinedPaletteItemInteraction(EK_NODEINSTANCE, 0, NODE_INSTANCE_CREATE_HANDLER, GetPredefinedInteractionItem(NODE_INSTANCE_CREATE_HANDLER));
      AddPredefinedPaletteItemInteraction(EK_ASSOCIATION, 0, ASSOCIATION_CREATE_HANDLER, GetPredefinedInteractionItem(ASSOCIATION_CREATE_HANDLER));
      AddPredefinedPaletteItemInteraction(EK_ASSOCIATION, FA_DIRECTED_ASSOCIATION, DIRECTED_ASSOCIATION_HANDLER, GetPredefinedInteractionItem(DIRECTED_ASSOCIATION_HANDLER));
      AddPredefinedPaletteItemInteraction(EK_ASSOCIATION, FA_AGGREGATION, AGGREGATION_HANDLER, GetPredefinedInteractionItem(AGGREGATION_HANDLER));
      AddPredefinedPaletteItemInteraction(EK_ASSOCIATION, FA_COMPOSITION, COMPOSITION_HANDLER, GetPredefinedInteractionItem(COMPOSITION_HANDLER));
      AddPredefinedPaletteItemInteraction(EK_GENERALIZATION, 0, GENERALIZATION_CREATE_HANDLER, GetPredefinedInteractionItem(GENERALIZATION_CREATE_HANDLER));
      AddPredefinedPaletteItemInteraction(EK_DEPENDENCY, 0, DEPENDENCY_CREATE_HANDLER, GetPredefinedInteractionItem(DEPENDENCY_CREATE_HANDLER));
      AddPredefinedPaletteItemInteraction(EK_REALIZATION, 0, REALIZATION_CREATE_HANDLER, GetPredefinedInteractionItem(REALIZATION_CREATE_HANDLER));
      AddPredefinedPaletteItemInteraction(EK_ASSOCIATIONCLASS, 0, ASSOCIATION_CLASS_CREATE_HANDLER, GetPredefinedInteractionItem(ASSOCIATION_CLASS_CREATE_HANDLER));
      AddPredefinedPaletteItemInteraction(EK_INCLUDE, 0, INCLUDE_CREATE_HANDLER, GetPredefinedInteractionItem(INCLUDE_CREATE_HANDLER));
      AddPredefinedPaletteItemInteraction(EK_EXTEND, 0, EXTEND_CREATE_HANDLER, GetPredefinedInteractionItem(EXTEND_CREATE_HANDLER));
      AddPredefinedPaletteItemInteraction(EK_OBJECT, 0, OBJECT_CREATE_HANDLER, GetPredefinedInteractionItem(OBJECT_CREATE_HANDLER));
      AddPredefinedPaletteItemInteraction(EK_CLASSIFIERROLE, 0, CLASSIFIER_ROLE_CREATE_HANDLER, GetPredefinedInteractionItem(CLASSIFIER_ROLE_CREATE_HANDLER));
      AddPredefinedPaletteItemInteraction(EK_ASSOCIATIONROLE, 0, ASSOCIATION_ROLE_CREATE_HANDLER, GetPredefinedInteractionItem(ASSOCIATION_ROLE_CREATE_HANDLER));
      AddPredefinedPaletteItemInteraction(EK_ASSOCIATIONROLE, 0, SELF_ASSOCIATION_ROLE_CREATE_HANDLER, GetPredefinedInteractionItem(SELF_ASSOCIATION_ROLE_CREATE_HANDLER));
      AddPredefinedPaletteItemInteraction(EK_LINK, 0, LINK_CREATE_HANDLER, GetPredefinedInteractionItem(LINK_CREATE_HANDLER));
      AddPredefinedPaletteItemInteraction(EK_LINK, 0, SELF_LINK_CREATE_HANDLER, GetPredefinedInteractionItem(SELF_LINK_CREATE_HANDLER));
      AddPredefinedPaletteItemInteraction(EK_MESSAGE, 0, MESSAGE_CREATE_HANDLER, GetPredefinedInteractionItem(MESSAGE_CREATE_HANDLER));
      AddPredefinedPaletteItemInteraction(EK_MESSAGE, 0, FORWARD_MESSAGE_CREATE_HANDLER, GetPredefinedInteractionItem(FORWARD_MESSAGE_CREATE_HANDLER));
      AddPredefinedPaletteItemInteraction(EK_MESSAGE, FA_REVERSE_MESSAGE_CALLACTION, REVERSE_MESSAGE_CREATE_HANDLER, GetPredefinedInteractionItem(REVERSE_MESSAGE_CREATE_HANDLER));
      AddPredefinedPaletteItemInteraction(EK_MESSAGE, 0, SELF_MESSAGE_CREATE_HANDLER, GetPredefinedInteractionItem(SELF_MESSAGE_CREATE_HANDLER));
      AddPredefinedPaletteItemInteraction(EK_STIMULUS, 0, STIMULUS_CREATE_HANDLER, GetPredefinedInteractionItem(STIMULUS_CREATE_HANDLER));
      AddPredefinedPaletteItemInteraction(EK_STIMULUS, 0, FORWARD_STIMULUS_CREATE_HANDLER, GetPredefinedInteractionItem(FORWARD_STIMULUS_CREATE_HANDLER));
      AddPredefinedPaletteItemInteraction(EK_STIMULUS, FA_REVERSE_STIMULUS_CALLACTION, REVERSE_STIMULUS_CREATE_HANDLER, GetPredefinedInteractionItem(REVERSE_STIMULUS_CREATE_HANDLER));
      AddPredefinedPaletteItemInteraction(EK_STIMULUS, 0, SELF_STIMULUS_CREATE_HANDLER, GetPredefinedInteractionItem(SELF_STIMULUS_CREATE_HANDLER));
      AddPredefinedPaletteItemInteraction(EK_STATE, 0, STATE_CREATE_HANDLER, GetPredefinedInteractionItem(STATE_CREATE_HANDLER));
      AddPredefinedPaletteItemInteraction(EK_SUBMACHINESTATE, 0, SUBMACHINE_STATE_CREATE_HANDLER, GetPredefinedInteractionItem(SUBMACHINE_STATE_CREATE_HANDLER));
      AddPredefinedPaletteItemInteraction(EK_ACTIVITY, 0, ACTIVITY_CREATE_HANDLER, GetPredefinedInteractionItem(ACTIVITY_CREATE_HANDLER));
      AddPredefinedPaletteItemInteraction(EK_SUBACTIVITYSTATE, 0, SUBACTIVITY_STATE_CREATE_HANDLER, GetPredefinedInteractionItem(SUBACTIVITY_STATE_CREATE_HANDLER));
      AddPredefinedPaletteItemInteraction(EK_PSEUDOSTATE, FA_PSEUDOSTATE_INITIALSTATE, INITIAL_STATE_CREATE_HANDLER, GetPredefinedInteractionItem(INITIAL_STATE_CREATE_HANDLER));
      AddPredefinedPaletteItemInteraction(EK_FINALSTATE, 0, FINAL_STATE_CREATE_HANDLER, GetPredefinedInteractionItem(FINAL_STATE_CREATE_HANDLER));
      AddPredefinedPaletteItemInteraction(EK_PSEUDOSTATE, FA_PSEUDOSTATE_JUNCTIONPOINT, JUNCTION_POINT_CREATE_HANDLER, GetPredefinedInteractionItem(JUNCTION_POINT_CREATE_HANDLER));
      AddPredefinedPaletteItemInteraction(EK_PSEUDOSTATE, FA_PSEUDOSTATE_CHOICEPOINT, CHOICE_POINT_CREATE_HANDLER, GetPredefinedInteractionItem(CHOICE_POINT_CREATE_HANDLER));
      AddPredefinedPaletteItemInteraction(EK_PSEUDOSTATE, FA_PSEUDOSTATE_SHALLOWHISTORY, SHALLOW_HISTORY_CREATE_HANDLER, GetPredefinedInteractionItem(SHALLOW_HISTORY_CREATE_HANDLER));
      AddPredefinedPaletteItemInteraction(EK_PSEUDOSTATE, FA_PSEUDOSTATE_DEEPHISTORY, DEEP_HISTORY_CREATE_HANDLER, GetPredefinedInteractionItem(DEEP_HISTORY_CREATE_HANDLER));
      AddPredefinedPaletteItemInteraction(EK_PSEUDOSTATE, FA_PSEUDOSTATE_SYNCHRONIZATION, SYNCHRONIZATION_CREATE_HANDLER, GetPredefinedInteractionItem(SYNCHRONIZATION_CREATE_HANDLER));
      AddPredefinedPaletteItemInteraction(EK_PSEUDOSTATE, FA_PSEUDOSTATE_DECISION, DECISION_CREATE_HANDLER, GetPredefinedInteractionItem(DECISION_CREATE_HANDLER));
      AddPredefinedPaletteItemInteraction(EK_TRANSITION, 0, TRANSITION_CREATE_HANDLER, GetPredefinedInteractionItem(TRANSITION_CREATE_HANDLER));
      AddPredefinedPaletteItemInteraction(EK_TRANSITION, 0, SELF_TRANSITION_CREATE_HANDLER, GetPredefinedInteractionItem(SELF_TRANSITION_CREATE_HANDLER));
      AddPredefinedPaletteItemInteraction(EK_SWIMLANE, FA_SWIMLANE_VERTICAL, VERTICAL_SWIMLANE_CREATE_HANDLER, GetPredefinedInteractionItem(VERTICAL_SWIMLANE_CREATE_HANDLER));
      AddPredefinedPaletteItemInteraction(EK_SWIMLANE, FA_SWIMLANE_HORIZONTAL, HORIZONTAL_SWIMLANE_CREATE_HANDLER, GetPredefinedInteractionItem(HORIZONTAL_SWIMLANE_CREATE_HANDLER));
      AddPredefinedPaletteItemInteraction(EK_OBJECTFLOWSTATE, 0, OBJECT_FLOW_STATE_CREATE_HANDLER, GetPredefinedInteractionItem(OBJECT_FLOW_STATE_CREATE_HANDLER));
      AddPredefinedPaletteItemInteraction(EK_FLOWFINALSTATE, 0, FLOW_FINAL_STATE_CREATE_HANDLER, GetPredefinedInteractionItem(FLOW_FINAL_STATE_CREATE_HANDLER));
      AddPredefinedPaletteItemInteraction(EK_SYSTEMBOUNDARY, 0, SYSTEM_BOUNDARY_CREATE_HANDLER, GetPredefinedInteractionItem(SYSTEM_BOUNDARY_CREATE_HANDLER));
      AddPredefinedPaletteItemInteraction(EK_SIGNALACCEPTSTATE, 0, SIGNAL_ACCEPT_STATE_CREATE_HANDLER, GetPredefinedInteractionItem(SIGNAL_ACCEPT_STATE_CREATE_HANDLER));
      AddPredefinedPaletteItemInteraction(EK_SIGNALSENDSTATE, 0, SIGNAL_SEND_STATE_CREATE_HANDLER, GetPredefinedInteractionItem(SIGNAL_SEND_STATE_CREATE_HANDLER));
      AddPredefinedPaletteItemInteraction(EK_ARTIFACT, 0, ARTIFACT_CREATE_HANDLER, GetPredefinedInteractionItem(ARTIFACT_CREATE_HANDLER));
      AddPredefinedPaletteItemInteraction(EK_PORT, 0, PORT_CREATE_HANDLER, GetPredefinedInteractionItem(PORT_CREATE_HANDLER));
      AddPredefinedPaletteItemInteraction(EK_PART, 0, PART_CREATE_HANDLER, GetPredefinedInteractionItem(PART_CREATE_HANDLER));
      AddPredefinedPaletteItemInteraction(EK_CONNECTOR, 0, CONNECTOR_CREATE_HANDLER, GetPredefinedInteractionItem(CONNECTOR_CREATE_HANDLER));
      AddPredefinedPaletteItemInteraction(EK_COMBINEDFRAGMENT, 0, COMBINED_FRAGMENT_CREATE_HANDLER, GetPredefinedInteractionItem(COMBINED_FRAGMENT_CREATE_HANDLER));
      AddPredefinedPaletteItemInteraction(EK_INTERACTIONOPERAND, 0, INTERACTION_OPERAND_CREATE_HANDLER, GetPredefinedInteractionItem(INTERACTION_OPERAND_CREATE_HANDLER));
      AddPredefinedPaletteItemInteraction(EK_RECTANGLE, 0, RECTANGLE_CREATE_HANDLER, GetPredefinedInteractionItem(RECTANGLE_CREATE_HANDLER));
      AddPredefinedPaletteItemInteraction(EK_ELLIPSE, 0, ELLIPSE_CREATE_HANDLER, GetPredefinedInteractionItem(ELLIPSE_CREATE_HANDLER));
      AddPredefinedPaletteItemInteraction(EK_ROUNDRECT, 0, ROUND_RECT_CREATE_HANDLER, GetPredefinedInteractionItem(ROUND_RECT_CREATE_HANDLER));
      AddPredefinedPaletteItemInteraction(EK_LINE, 0, LINE_CREATE_HANDLER, GetPredefinedInteractionItem(LINE_CREATE_HANDLER));
      AddPredefinedPaletteItemInteraction(EK_IMAGE, 0, IMAGE_CREATE_HANDLER, GetPredefinedInteractionItem(IMAGE_CREATE_HANDLER));
      AddPredefinedPaletteItemInteraction(EK_FRAME, 0, FRAME_CREATE_HANDLER, GetPredefinedInteractionItem(FRAME_CREATE_HANDLER));
    end;
  end;
end;

procedure PInteractionManager.BuildExtendedInteractions;
var
  Profile: PProfile;
  Palette: PPalette;
  DiagramMenuAdded: Boolean;
  I, J: Integer;
begin
  DiagramMenuAdded := False;
  for I := 0 to ExtensionManager.AvailableProfileCount - 1 do begin
    Profile := ExtensionManager.AvailableProfiles[I];
    for J := 0 to Profile.ElementPrototypeCount - 1 do
      AddExtPaletteItemInteraction(Profile.ElementPrototypes[J]);
    for J := 0 to Profile.PaletteCount - 1 do begin
      Palette := Profile.Palettes[J];
      AddExtPaletteInteraction(Palette);
      CreatePaletteItemLinks(Palette);
    end;
    for J := 0 to Profile.DiagramTypeCount - 1 do begin
      AddExtDiagramMenuInteraction(Profile.DiagramTypes[J], not DiagramMenuAdded);
      DiagramMenuAdded := True;
    end;
    MainForm.ModelAdd.ItemLinks[0].BeginGroup := True;
    for J := Profile.ModelPrototypeCount - 1 downto 0 do
      if Profile.ModelPrototypes[J].ContainerModelCount > 0 then
        AddExtModelMenuInteraction(Profile.ModelPrototypes[J]);
  end;
end;

procedure PInteractionManager.AddAllProfileElementIcons;
var
  Profile: PProfile;
  DiagramType: PDiagramType;
  Stereotype: PStereotype;
  ElemPrototype: PElementPrototype;
  ModelPrototype: PModelPrototype;
  I, J: Integer;
begin
  for I := 0 to ExtensionManager.AvailableProfileCount - 1 do begin
    Profile := ExtensionManager.AvailableProfiles[I];
    for J := 0 to Profile.StereotypeCount - 1 do begin
      Stereotype := Profile.Stereotypes[J];
      Stereotype.ImageIndex := AddBitmap(MainForm.TotalImageList, Stereotype.SmallIconFile);
    end;
    for J := 0 to Profile.DiagramTypeCount - 1 do begin
      DiagramType := Profile.DiagramTypes[J];
      DiagramType.ImageIndex := AddBitmap(MainForm.TotalImageList, DiagramType.IconFile);
    end;
    for J := 0 to Profile.ElementPrototypeCount - 1 do begin
      ElemPrototype := Profile.ElementPrototypes[J];
      ElemPrototype.ImageIndex := AddBitmap(MainForm.TotalImageList, ElemPrototype.IconFile);
    end;
    for J := 0 to Profile.ModelPrototypeCount - 1 do begin
      ModelPrototype := Profile.ModelPrototypes[J];
      ModelPrototype.ImageIndex := AddBitmap(MainForm.TotalImageList, ModelPrototype.IconFile);
    end;
  end;
end;

function PInteractionManager.GetDiagramKindName(Diagram: PUMLDiagram): string;
var
  S: string;
begin
  S := '';
  if Diagram.DiagramType <> '' then
    S := Diagram.DiagramType
  else if Diagram is PUMLClassDiagram then
    S := DK_CLASS_DIAGRAM
  else if Diagram is PUMLUseCaseDiagram then
    S := DK_USECASE_DIAGRAM
  else if Diagram is PUMLSequenceDiagram then
    S := DK_SEQUENCE_DIAGRAM
  else if Diagram is PUMLSequenceRoleDiagram then
    S := DK_SEQUENCEROLE_DIAGRAM
  else if Diagram is PUMLCollaborationDiagram then
    S := DK_COLLABORATION_DIAGRAM
  else if Diagram is PUMLCollaborationRoleDiagram then
    S := DK_COLLABORATIONROLE_DIAGRAM
  else if Diagram is PUMLStatechartDiagram then
    S := DK_STATECHART_DIAGRAM
  else if Diagram is PUMLActivityDiagram then
    S := DK_ACTIVITY_DIAGRAM
  else if Diagram is PUMLComponentDiagram then
    S := DK_COMPONENT_DIAGRAM
  else if Diagram is PUMLDeploymentDiagram then
    S := DK_DEPLOYMENT_DIAGRAM
  else if Diagram is PUMLCompositeStructureDiagram then
    S := DK_COMPOSITESTRUCTURE_DIAGRAM;
  // ASSERTIONS
  Assert(S <> '');
  // ASSERTIONS
  Result := S;
end;

{function PInteractionManager.GetContainerMenuBarGroup(Button: TdxBarButton): TdxBarGroup;
var
  Group: TdxBarGroup;
  I: Integer;
begin
  Result := nil;
  for I := 0 to Button.BarManager.GroupCount - 1 do begin
    Group := Button.BarManager.Groups[I];
    if Group.IndexOf(Button) <> -1 then begin
      Result := Group;
      Exit;
    end;
  end;
end;}

{function PInteractionManager.GetContainerMenuBarGroup(Button: TMenuElementHandle): TMenuElementCategory;
begin
  Result := MenuManager.GetCategory(Button)
end;}


procedure PInteractionManager.BuildInteractions;
begin
  AddAllProfileElementIcons;
  BuildPredefinedInteractions;
  BuildExtendedInteractions;
  ChangePaletteVisibility(nil);
end;

procedure PInteractionManager.AcquireAvailableNavBarGroups(Diagram: PUMLDiagram; NavBarGroups: TNavBarGroups);
var
  DI: PDiagramMenuInteraction;
  PI: PPaletteInteraction;
  I: Integer;
begin
  NavBarGroups.Clear;
  if Diagram.DiagramType = '' then
    DI := FindPredefinedDiagramMenuInteraction(GetDiagramKindName(Diagram))
  else
    DI := FindExtendedDiagramMenuInteraction(Diagram.DiagramType);
  // ASSERTIONS
  Assert(DI <> nil);
  // ASSERTIONS
  for I := 0 to DI.AvailablePaletteCount - 1 do begin
    PI := FindPaletteInteraction(DI.AvailablePalettes[I]);
    if PI <> nil then
      NavBarGroups.Add(PI.NavBarGroup);
  end;
end;

procedure PInteractionManager.SetExtMenuButtonsState(Owner: PModel);
var
  DI: PExtendedDiagramMenuInteraction;
  MI: PExtendedModelMenuInteraction;
  I: Integer;
begin
  for I := 0 to ModelMenuInteractionCount - 1 do begin
    if ModelMenuInteractions[I] is PExtendedModelMenuInteraction then begin
      MI := ModelMenuInteractions[I] as PExtendedModelMenuInteraction;
      // ASSERTIONS
      Assert(MI.ModelPrototype.ContainerModelCount > 0);
      Assert(MI.BaseMenuButton <> nil);
      // ASSERTIONS
      if (MI.BaseMenuButton.Visible = True) and ExtensionManager.IsIncluded(MI.ModelPrototype.Profile) and MI.IsOneOfContainer(Owner) then
        MI.MenuButton.Visible := True
      else
        MI.MenuButton.Visible := False;
    end;
  end;
  for I := 0 to DiagramMenuInteractionCount - 1 do begin
    if DiagramMenuInteractions[I] is PExtendedDiagramMenuInteraction then begin
      DI := DiagramMenuInteractions[I] as PExtendedDiagramMenuInteraction;
      DI.MenuButton.Visible := ExtensionManager.IsIncluded(DI.DiagramType.Profile);
    end;
  end;
end;

procedure PInteractionManager.ChangePaletteVisibility(Diagram: PUMLDiagram);

  function GetFirstVisibleNavBarGroup(NavBarGroups: TNavBarGroups): TNavBarGroup;
  var
    NavBarGroup: TNavBarGroup;
    //I: Integer;
  begin
    Result := nil;
    //for I := 0 to NavBarGroups.Count - 1 do
    for NavBarGroup in NavBarGroups do
      if NavBarGroup.Visible then begin
        Result := NavBarGroup;
        Exit;
      end;
  end;

var
  NavBarGroup: TNavBarGroup;
  NavBarGroups: TNavBarGroups;
  Profile: PProfile;
  Palette: PPalette;
  PI: PPaletteInteraction;
  I, J: Integer;
begin
  with MainForm do begin
    //for I := 0 to PaletteNavBarFrame.Groups.Count - 1 do
    for NavBarGroup in PaletteNavBarFrame.Groups do
      NavBarGroup.Visible := False;
    NavBarGroups := TNavBarGroups.Create;
    try
      if Diagram <> nil then begin
        AcquireAvailableNavBarGroups(Diagram, NavBarGroups);
        for NavBarGroup in NavBarGroups do
          NavBarGroup.Visible := True;
        for I := 0 to ExtensionManager.AvailableProfileCount - 1 do begin
          Profile := ExtensionManager.AvailableProfiles[I];
          if not ExtensionManager.IsIncluded(Profile) then
            for J := 0 to Profile.PaletteCount - 1 do begin
              Palette := Profile.Palettes[J];
              PI := FindPaletteInteraction(Palette.Name);
              // ASSERTIONS
              Assert(PI <> nil);
              // ASSERTIONS
              PI.NavBarGroup.Visible := False;
            end;
        end;
        //PaletteNavBarFrame.PaletteNavBar.ActiveGroup := GetFirstVisibleNavBarGroup(NavBarGroups);
        //PaletteNavBarFrame.GetPredefinedInteractionGroup('Annotation').Visible := True;
        PaletteNavBarFrame.SetActiveGroup(GetFirstVisibleNavBarGroup(NavBarGroups));
        //PaletteNavBarFrame.AnnotationNavBarGroup.Visible := True;
        PaletteNavBarFrame.GetPredefinedInteractionGroup('Annotation').Visible := True;
      end;
    finally
      NavBarGroups.Free;
    end;
  end;
end;

// PInteractionManager
////////////////////////////////////////////////////////////////////////////////

function DragTypeToSkeletonPaintKind(Value: PDragTypeKind): PSkeletonPaintingKind;
begin
  if Value = dkRect then
    Result := spRect
  else if Value = dkLine then
    Result := spLine
  else
    Result := spRect;
end;

end.

