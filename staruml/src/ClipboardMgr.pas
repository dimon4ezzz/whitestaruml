unit ClipboardMgr;

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
  BasicClasses, Core,
  Classes, Windows, Graphics, Messages, Dialogs, xmldom, XMLIntf, msxmldom, XMLDoc;

type
  // Enumeration type
  PClipboardDataKind = (ckModel, ckView, ckElse);
  // Event type
  PClipboardDataChangedEvent = procedure(Kind: PClipboardDataKind) of object;

  // PClipboardWriter
  PClipboardWriter = class(PXMLObjectWriter)
  private
    function GetCBBeginNode: string;
    function GetCBEndNode: string;
    function GetParamBeginNode(NodeName: string): string;
    function GetParamEndNode(NodeName: string): string;
    function GetValuedNode(NodeName, NodeValue: string): string;
    function IsIgnorable(AElement: PElement; Key: string): Boolean;
  public
    procedure WriteReference(Key: string; Value: PObject; Default: PObject = nil); override;
  end;

  // PClipboardManager
  PClipboardManager = class
  private
    //XMLDoc: TXMLDocument;
    FClipboardUsable: Boolean;
    FCBFormatIDOfModel: UINT;
    FCBFormatIDOfViews: UINT;
    FClipboardDataBuffer: string;
    FClipboardDataKind: PClipboardDataKind;
    FClipboardElementKind: string;
    FClipboardCopyContext: string;
    FApplicationHandle: THandle;
    FNextCBViewerHandle: THandle;
    FOnClipboardDataChanged: PClipboardDataChangedEvent;
    procedure RemoveNamespaceRef(AModel: PModel; var ContainedIndex: Integer;
        var OtherSide: PMetaAssociationEnd);
    procedure RollbackNamespaceRef(AModel, Container: PModel; ContainedIndex: Integer;
        OtherSide: PMetaAssociationEnd);
    procedure RemoveContainerViewRef(AView: PView; var Container: PView; var ContainedIndex: Integer);
    procedure RemoveDiagramViewRef(AView: PView; var Container: PView; var ContainedIndex: Integer);
    procedure RollbackContainerViewRef(AView, Container: PView; ContainedIndex: Integer);
    procedure RollbackDiagramViewRef(AView, Container: PView; ContainedIndex: Integer);
    procedure SetStrDataBuffer(AModel: PModel); overload;
    procedure SetStrDataBuffer(Views: POrderedSet; ADiagramView: PDiagramView); overload;
    function GetStrDataBuffer(Kind: PClipboardDataKind): string;
    procedure ExtractClipboardElementKind;
    function RegulateGUID(AnElement: PElement; AResolver: PReferenceResolver): Boolean; overload;
    function RegulateGUID(Views: PViewOrderedSet; AResolver: PReferenceResolver): Boolean; overload;
    procedure DrawClipboardProc;
  public
    procedure SetHandle(AHandle: THandle);
    procedure OpenClipboard;
    procedure CloseClipboard;
    // Set data to clipboard
    function SetModelData(AModel: PModel): Boolean;
    function SetViewsData(ADiagramView: PDiagramView; SelectedViewsOnly: Boolean): Boolean;
    function CopyDiagramAsBitmap(ADiagramView: PDiagramView; SelectedViewsOnly: Boolean): Boolean;
    // Get data from clipboard
    function GetModelData: PModel;
    function GetViewsData: PViewOrderedSet;
    // Windows Clipboard-related message handling procedures
    procedure WMDrawClipboardHandler(var Msg: TMessage);
    procedure WMChangeCBChainHandler(var Msg: TMessage);
    // Properties
    property ClipboardDataKind: PClipboardDataKind read FClipboardDataKind;
    property ClipboardElementKind: string read FClipboardElementKind;
    property ClipboardCopyContext: string read FClipboardCopyContext;
    property OnClipboardDataChanged: PClipboardDataChangedEvent write FOnClipboardDataChanged;
  end;

const
  CF_PSM: PChar = 'PLASTICSOFTWARE_STARUML_MODEL';
  CF_PSV: PChar = 'PLASTICSOFTWARE_STARUML_VIEWS';
  CB_XN_ROOT = 'CLIPBOARDDATA';
  CB_DOC_VERSION = '1';
  CB_KEY_MDL = 'MODELDATA';
  CB_KEY_VIEW = 'VIEWDATA';
  CB_XN_DATAKIND = 'DATAKIND';
  CB_XN_VAL_MDL = 'STARUML_MODEL';
  CB_XN_VAL_VIEW = 'STARUML_VIEWS';
  CB_XN_ELEMENTKIND = 'ELEMENTKIND';
  CB_XN_COPYCONTEXT = 'COPYCONTEXT';

implementation

uses
  System.Types, System.UITypes, GraphicClasses, ViewCore, UMLViews, Forms,
  SysUtils, Clipbrd, Controls,
  OptionDeps, NLS_StarUML;

////////////////////////////////////////////////////////////////////////////////
// PClipboardWriter

function PClipboardWriter.GetCBBeginNode: string;
var
  S: string;
begin
  S := '<' + XPD_PREFIX + ':' + CB_XN_ROOT;
  S := S + ' xmlns:' + XPD_PREFIX + '="' + XPD_NAMESPACE_URI + '"';
  S := S + ' ' + XPD_VERSION + '="' + CB_DOC_VERSION + '"';
  S := S + '>';
  Result := S;
end;

function PClipboardWriter.GetCBEndNode: string;
begin
  Result := '</' + XPD_PREFIX + ':' + CB_XN_ROOT + '>';
end;

function PClipboardWriter.GetParamBeginNode(NodeName: string): string;
begin
  // PRECONDITION
  Assert(NodeName <> '');
  // PRECONIDTION
  Result := '<' + XPD_PREFIX + ':' + NodeName + '>';
end;

function PClipboardWriter.GetParamEndNode(NodeName: string): string;
begin
  // PRECONDITION
  Assert(NodeName <> '');
  // PRECONIDTION
  Result := '</' + XPD_PREFIX + ':' + NodeName + '>';
end;

function PClipboardWriter.GetValuedNode(NodeName, NodeValue: string): string;
var
  S: string;
begin
  // PRECONDITIONS
  Assert(NodeName <> '');
  Assert(NodeValue <> '');
  // PRECONIDTIONS
  S := '<' + XPD_PREFIX + ':' + NodeName + '>';
  S := S + NodeValue;
  S := S +   '</' + XPD_PREFIX + ':' + NodeName + '>';
  Result := S;
end;

function PClipboardWriter.IsIgnorable(AElement: PElement; Key: string): Boolean;
var
  I: Integer;
  MetaClass: PMetaClass;
  R, OtherSide: PMetaAssociationEnd;
  ARef: PElement;
begin
  Result := False;
  MetaClass := AElement.MetaClass;
  for I := 0 to MetaClass.MetaReferenceCount - 1 do begin
    R := MetaClass.MetaReferences[I];
    if (R.Aggregate <> makComposite) then
    begin
      ARef := AElement.MOF_GetReference(R.Name);
      if ARef = CurrentObject then begin
        OtherSide := R.GetOtherSideEnd;
        if (OtherSide <> nil) and
           (OtherSide.Aggregate <> makComposite) then
        begin
          Result := True;
          Exit;
        end;
      end;
    end;
  end;
end;

procedure PClipboardWriter.WriteReference(Key: string; Value: PObject; Default: PObject = nil);
var
  Ref: string;
  D: PDocument;
begin
  D := nil;
  if not IsFiltered(Key) then begin
    if Value <> Default then begin
      if Value = nil then begin
        Ref := GetRefBeginNode(Key) + GetRefEndNode;
        XMLStrings.Add(Ref);
      end
      else begin
        if Value is PElement then
          if IsIgnorable(Value as PElement, Key) then begin
            Ref := GetRefBeginNode(Key) + GetRefEndNode;
            XMLStrings.Add(Ref);
            Exit;
          end else D := (Value as PElement).GetContainingDocument;
          D := (Value as PElement).GetContainingDocument;
        if (Value is PModel) and (CurrentDocument <> D) then
        begin
          Ref := GetRefBeginNode(Key, (Value as PModel).Pathname)+ Value.GUID + GetRefEndNode;
          XMLStrings.Add(Ref);
        end
        else begin
          Ref := GetRefBeginNode(Key)+ Value.GUID + GetRefEndNode;
          XMLStrings.Add(Ref);
        end;
      end;
    end;
  end;
end;

// PClipboardWriter
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PClipboardManager

procedure PClipboardManager.SetHandle(AHandle: THandle);
begin
  FApplicationHandle := AHandle;
end;

procedure PClipboardManager.OpenClipboard;
begin
  FClipboardUsable := True;
  //XMLDoc := TXMLDocument.Create(Application);
  FNextCBViewerHandle := SetClipboardViewer(FApplicationHandle);

  FCBFormatIDOfModel := RegisterClipboardFormat(ClipboardMgr.CF_PSM);
  if FCBFormatIDOfModel = 0 then begin
    MessageDlg(ERR_CLIPBRD_REG_FORMAT, mtError, [mbOK], 0);
    FClipboardUsable := False;
  end;
  FCBFormatIDOfViews := RegisterClipboardFormat(ClipboardMgr.CF_PSV);
  if FCBFormatIDOfViews = 0 then begin
    MessageDlg(ERR_CLIPBRD_REG_FORMAT, mtError, [mbOK], 0);
    FClipboardUsable := False;
  end;
  FClipboardDataKind := ckElse;
  FClipboardElementKind := '';
  DrawClipboardProc;
end;

procedure PClipboardManager.CloseClipboard;
begin
  //Clipboard.Clear;
  ChangeClipboardChain(FApplicationHandle, FNextCBViewerHandle);
  //XMLDoc.Free;
end;

procedure PClipboardManager.RemoveNamespaceRef(AModel: PModel; var ContainedIndex: Integer;
    var OtherSide: PMetaAssociationEnd);
var
  R: PMetaAssociationEnd;
  Container: PModel;
begin
  { disconnect relationship between model and cotainer }
  Container := AModel.VirtualNamespace;
  ContainedIndex := -1;
  R := AModel.GetContainerRelation(Container);
  if R <> nil then OtherSide := R.GetOtherSideEnd else OtherSide := nil;
  if OtherSide is PMetaCollection then
  begin
    ContainedIndex := Container.MOF_IndexOfCollectionItem(OtherSide.Name, AModel);
    Container.MOF_DeleteCollectionItem(OtherSide.Name, ContainedIndex);
  end
  else if OtherSide is PMetaReference then
    Container.MOF_SetReference(OtherSide.Name, nil);
end;

procedure PClipboardManager.RollbackNamespaceRef(AModel, Container: PModel;
    ContainedIndex: Integer; OtherSide: PMetaAssociationEnd);
begin
  { restore relationship between model and container }
  if (OtherSide is PMetaCollection) and (ContainedIndex >= 0) then
    Container.MOF_InsertCollectionItem(OtherSide.Name, ContainedIndex, AModel)
  else if OtherSide is PMetaReference then
    Container.MOF_SetReference(OtherSide.Name, AModel);
end;

procedure PClipboardManager.RemoveContainerViewRef(AView: PView; var Container: PView; var ContainedIndex: Integer);
var
  Elem: PElement;
begin
  Elem := AView.MOF_GetReference('ContainerView');
  if Assigned(Elem) then begin
    Container := Elem as PView;
    ContainedIndex := Container.MOF_IndexOfCollectionItem('ContainedViews', AView);
    if ContainedIndex >= 0 then Container.MOF_DeleteCollectionItem('ContainedViews', ContainedIndex);
  end;
end;

procedure PClipboardManager.RemoveDiagramViewRef(AView: PView; var Container: PView; var ContainedIndex: Integer);
var
  Elem: PElement;
begin
  Elem := AView.MOF_GetReference('OwnerDiagramView');
  if Assigned(Elem) then begin
    Container := Elem as PView;
    ContainedIndex := Container.MOF_IndexOfCollectionItem('OwnedViews', AView);
    if ContainedIndex >= 0 then Container.MOF_DeleteCollectionItem('OwnedViews', ContainedIndex);
  end;
end;

procedure PClipboardManager.RollbackContainerViewRef(AView, Container: PView; ContainedIndex: Integer);
begin
  if Assigned(Container) and (ContainedIndex >= 0) then
    Container.MOF_InsertCollectionItem('ContainedViews', ContainedIndex, AView);
end;

procedure PClipboardManager.RollbackDiagramViewRef(AView, Container: PView; ContainedIndex: Integer);
begin
  if Assigned(Container) and (ContainedIndex >= 0) then
    Container.MOF_InsertCollectionItem('OwnedViews', ContainedIndex, AView);
end;

procedure PClipboardManager.SetStrDataBuffer(AModel: PModel);
var
  AWriter: PClipboardWriter;
  StrValues: TStringList;
  H: string;
  ModelType: string;
  CopyContext: string;
  Container: PModel;
  ContainedIndex: Integer;
  OtherSide: PMetaAssociationEnd;
begin
  FClipboardDataBuffer := '';
  ContainedIndex := -1;
  StrValues := TStringList.Create;
  AWriter := PClipboardWriter.Create(StrValues);
  try
    H := '<?xml version="' + DEFAULT_XML_VERSION + '"'
      + ' encoding="' + DEFAULT_XML_ENCODING + '"?>';
    StrValues.Add(H);
    with AWriter do begin
      StrValues.Add(GetCBBeginNode);
      StrValues.Add(GetParamBeginNode(XPD_HEADER));
      StrValues.Add(GetValuedNode(CB_XN_DATAKIND, CB_XN_VAL_MDL));
      ModelType := AModel.ClassName;
      ModelType := Copy(ModelType, 2, Length(ModelType) - 1);
      StrValues.Add(GetValuedNode(CB_XN_ELEMENTKIND, ModelType));
      Container := AModel.VirtualNamespace;
      CopyContext := Container.GUID;
      StrValues.Add(GetValuedNode(CB_XN_COPYCONTEXT, CopyContext));
      StrValues.Add(GetParamEndNode(XPD_HEADER));
      StrValues.Add(GetParamBeginNode(XPD_BODY));
      RemoveNamespaceRef(AModel, ContainedIndex, OtherSide);
      try
        WriteObject(CB_KEY_MDL, AModel);
        StrValues.Add(GetParamEndNode(XPD_BODY));
        StrValues.Add((GetCBEndNode));
        // to resolve MSXML DOM Parser (esp. below version 3) bug (we guess)
        // (ExtractClipboardElementKind not to utilize DOM Parser,
        // to add a line below this
        FClipboardDataBuffer := ModelType + #13 + CopyContext + #13;
        FClipboardDataBuffer := FClipboardDataBuffer + XMLStrings.Text;
      finally
        RollbackNamespaceRef(AModel, Container, ContainedIndex, OtherSide);
      end;
    end;
  finally
    AWriter.Free;
    StrValues.Free;
  end;
end;

procedure PClipboardManager.SetStrDataBuffer(Views: POrderedSet; ADiagramView: PDiagramView);
var
  I: Integer;
  Key: string;
  AView: PView;
  AWriter: PClipboardWriter;
  StrValues: TStringList;
  H: string;
  DiagramType: string;
  CopyContext: string;
  ContainerView, DiagramView: PView;
  ContainedIdx, DiagramOwnedIdx: Integer;
begin
  FClipboardDataBuffer := '';
  if Views.Count <= 0 then Exit;

  StrValues := TStringList.Create;
  AWriter := PClipboardWriter.Create(StrValues);
  try
    H := '<?xml version="' + DEFAULT_XML_VERSION + '"'
      + ' encoding="' + DEFAULT_XML_ENCODING + '"?>';
    StrValues.Add(H);
    with AWriter do begin
      StrValues.Add(GetCBBeginNode);
      StrValues.Add(GetParamBeginNode(XPD_HEADER));
      StrValues.Add(GetValuedNode(CB_XN_DATAKIND, CB_XN_VAL_VIEW));
      DiagramType := ADiagramView.ClassName;
      DiagramType := Copy(DiagramType, 2, Length(DiagramType) - 1);
      StrValues.Add(GetValuedNode(CB_XN_ELEMENTKIND, DiagramType));
      CopyContext := ADiagramView.Diagram.DiagramOwner.GUID;
      StrValues.Add(GetValuedNode(CB_XN_COPYCONTEXT, CopyContext));
      StrValues.Add(GetParamEndNode(XPD_HEADER));
      StrValues.Add(GetParamBeginNode(XPD_BODY));
      for I := 0 to Views.Count - 1 do begin
        AView := Views.Items[I] as PView;
        Key := CB_KEY_VIEW + IntToStr(I);
        ContainedIdx := -1;
        DiagramOwnedIdx := -1;
        try
          RemoveContainerViewRef(AView, ContainerView, ContainedIdx);
          RemoveDiagramViewRef(AView, DiagramView, DiagramOwnedIdx);
          WriteObject(Key, AView);
        finally
          RollbackContainerViewRef(AView, ContainerView, ContainedIdx);
          RollbackDiagramViewRef(AView, DiagramView, DiagramOwnedIdx);
        end;
      end;
      StrValues.Add(GetParamEndNode(XPD_BODY));
      StrValues.Add((GetCBEndNode));
      // to resolve MSXML DOM Parser (esp. below version 3) bug (we guess)
      // (ExtractClipboardElementKind not to utilize DOM Parser,
      // to add a line below this
      FClipboardDataBuffer := DiagramType + #13 + CopyContext + #13;
      FClipboardDataBuffer := FClipboardDataBuffer + XMLStrings.Text;
    end;
  finally
    AWriter.Free;
    StrValues.Free;
  end;
end;

function PClipboardManager.GetStrDataBuffer(Kind: PClipboardDataKind): string;
var
  AHandle: THandle;
  TextPtr: PChar;
begin
  Result := '';
  AHandle := 0;
  Clipboard.Open;
  try
    case Kind of
      ckModel: AHandle := GetClipboardData(FCBFormatIDOfModel);
      ckView: AHandle := GetClipboardData(FCBFormatIDOfViews);
    end;
    if AHandle <> 0 then begin
      TextPtr := GlobalLock(AHandle);
      if TextPtr <> nil then Result := TextPtr;
      GlobalUnlock(AHandle);
      //GlobalFree(AHandle);
    end;
  finally
    Clipboard.Close;
  end;
end;

procedure PClipboardManager.ExtractClipboardElementKind;
var
  ANode: IXMLNode;
  Strs: TStringList;
begin
  if FClipboardDataKind = ckElse then Exit;
  FClipboardDataBuffer := GetStrDataBuffer(FClipboardDataKind);
  if FClipboardDataBuffer <> '' then begin
    Strs := TStringList.Create;
    try
      Strs.Text := FClipboardDataBuffer;
      if Strs.Count >= 2 then begin
        FClipboardElementKind := Strs.Strings[0];
        FClipboardCopyContext := Strs.Strings[1];
        Strs.Delete(0);
        Strs.Delete(0);
        FClipboardDataBuffer := Strs.Text;
      end else FClipboardDataBuffer := '';
    finally
      Strs.Free;
    end;
  end;
end;

function PClipboardManager.RegulateGUID(AnElement: PElement; AResolver: PReferenceResolver): Boolean;
var
  AVisitor: PReferenceCollectionVisitor;
  AnObj: PObject;
  OldGUID, NewGUID: string;
  I: Integer;
begin
  Result := False;

  AVisitor := PReferenceCollectionVisitor.Create;
  try
    AnElement.Accept(AVisitor);
    for I := 0 to AVisitor.ReferenceCount - 1 do begin
      AnObj := AVisitor.References[I];
      OldGUID := AnObj.GUID;
      NewGUID := CreateGUIDBase64;
      AnObj.GUID := NewGUID;
      AResolver.ReplaceGUID(OldGUID, NewGUID);
    end;
    Result := True;
  finally
    AVisitor.Free;
  end;
end;

function PClipboardManager.RegulateGUID(Views: PViewOrderedSet; AResolver: PReferenceResolver): Boolean;
var
  AVisitor: PReferenceCollectionVisitor;
  AView: PView;
  AnObj: PObject;
  OldGUID, NewGUID: string;
  I: Integer;
begin
  Result := False;

  AVisitor := PReferenceCollectionVisitor.Create;
  try
    for I := 0 to Views.Count - 1 do begin
      AView := Views.Items[I] as PView;
      AView.Accept(AVisitor);
    end;
    for I := 0 to AVisitor.ReferenceCount - 1 do begin
      AnObj := AVisitor.References[I];
      OldGUID := AnObj.GUID;
      NewGUID := CreateGUIDBase64;
      AnObj.GUID := NewGUID;
      AResolver.ReplaceGUID(OldGUID, NewGUID);
    end;
    Result := True;
  finally
    AVisitor.Free;
  end;
end;

procedure PClipboardManager.DrawClipboardProc;
begin
  // Determine the ClipboardDataKind (Model, Views, or Else) and
  // ClipboardElementKind (Element's string name)
  // then propagate ClipboardDataChanged event
  try
    if Clipboard.HasFormat(FCBFormatIDOfModel) then FClipboardDataKind := ckModel
    else if Clipboard.HasFormat(FCBFormatIDOfViews) then FClipboardDataKind := ckView
    else FClipboardDataKind := ckElse;
  except on Exception do FClipboardDataKind := ckElse;
  end;

  if FClipboardDataKind <> ckElse then ExtractClipboardElementKind
  else FClipboardDataBuffer := '';

  if Assigned(FOnClipboardDataChanged) then FOnClipboardDataChanged(FClipboardDataKind);
end;

function PClipboardManager.SetModelData(AModel: PModel): Boolean;
var
  AHandle: THandle;
  TextPtr: PChar;
begin
  Result := False;
  if not Assigned(AModel) then Exit;
  if not FClipboardUsable then begin
    MessageDlg(ERR_CLIPBRD_MENU_EXECUTION, mtError, [mbOK], 0);
    Exit;
  end;

  Screen.Cursor := crHourGlass;
  try
    // Encode Model Information to XML data
    SetStrDataBuffer(AModel);
    // Encoding된 data를 clipboard에 쓴다
    if FClipboardDataBuffer <> '' then begin
      Clipboard.Open;
      EmptyClipboard;
      try
        AHandle := GlobalAlloc(GMEM_MOVEABLE + GMEM_DDESHARE, (Length(FClipboardDataBuffer)+1)*SizeOf(FClipboardDataBuffer[1]));
        TextPtr := GlobalLock(AHandle);
        StrPCopy(TextPtr, FClipboardDataBuffer);
        GlobalUnlock(AHandle);
        SetClipboardData(FCBFormatIDOfModel, AHandle);
        Result := True;
      finally
        Clipboard.Close;
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

function PClipboardManager.SetViewsData(ADiagramView: PDiagramView; SelectedViewsOnly: Boolean): Boolean;
    function ValidView(AView: PView): Boolean;
    var HeadOK, TailOK: Boolean;
    begin
      Result := True;
      if AView is PUMLCustomSeqMessageView then begin
        HeadOK := (AView as PUMLCustomSeqMessageView).Head.Parent.Selected;
        TailOK := (AView as PUMLCustomSeqMessageView).Tail.Parent.Selected;
        if not (HeadOK and TailOK) then Result := False;
      end else if AView is PUMLCustomColMessageView then begin
        HeadOK := (AView as PUMLCustomColMessageView).HostEdge.Head.Selected;
        TailOK := (AView as PUMLCustomColMessageView).HostEdge.Tail.Selected;
        if not (HeadOK and TailOK) then Result := False;
      end else if AView is PEdgeView then begin
        HeadOK := (AView as PEdgeView).Head.Selected;
        TailOK := (AView as PEdgeView).Tail.Selected;
        if not (HeadOK and TailOK) then Result := False;
      end;
    end;
var
  AMetafile: TMetafile;
  Views: POrderedSet;
  AView: PView;
  I: Integer;
  AHandle: THandle;
  //TextPtr: PChar;
  TextPtr: PWideChar;
  AFormat: Word;
  AData: THandle;
  APalette: HPALETTE;
begin
  Result := False;
  if not Assigned(ADiagramView) then Exit;
  if not FClipboardUsable then begin
    MessageDlg(ERR_CLIPBRD_MENU_EXECUTION, mtError, [mbOK], 0);
    Exit;
  end;

  AMetafile := MetafileFromDiagram(ADiagramView, SelectedViewsOnly, True);
  if not Assigned(AMetafile) then Exit;

  Screen.Cursor := crHourGlass;
  Views := POrderedSet.Create;
  try
    // Gather target(view) written in clipboard
    if SelectedViewsOnly then begin
      for I := 0 to ADiagramView.SelectedViewCount - 1 do begin
        AView := ADiagramView.SelectedViews[I];
        if AView is PParasiticView then Continue;
        if ValidView(AView) then Views.Add(AView);
      end;
    end else for I := 0 to ADiagramView.OwnedViewCount - 1 do Views.Add(ADiagramView.OwnedView[I]);
    // encode views data to XML data
    SetStrDataBuffer(Views, ADiagramView);
    // write Data in Clipboard
    Clipboard.Open;
    EmptyClipboard;
    try
      // write Metafile format data to clipboard
      AMetafile.SaveToClipBoardFormat(AFormat, AData, APalette);
      ClipBoard.SetAsHandle(AFormat, AData);
      AMetafile.Free;
      // write Eencoded views data to clipboard
      if FClipboardDataBuffer <> '' then begin
        AHandle := GlobalAlloc(GMEM_MOVEABLE + GMEM_DDESHARE, (Length(FClipboardDataBuffer)+1)*SizeOf(FClipboardDataBuffer[1]));
        TextPtr := GlobalLock(AHandle);
        StrPCopy(TextPtr, FClipboardDataBuffer);
        GlobalUnlock(AHandle);
        SetClipboardData(FCBFormatIDOfViews, AHandle);
      end;
      Result := True;
    finally
      Clipboard.Close;
    end;
  finally
    Views.Free;
    Screen.Cursor := crDefault;
  end;
end;

function PClipboardManager.CopyDiagramAsBitmap(ADiagramView: PDiagramView; SelectedViewsOnly: Boolean): Boolean;
var
  Bitmap: TBitmap;
  Format: Word;
  Data: THandle;
  Palette: HPalette;
begin
  Bitmap := BitmapFromDiagram(ADiagramView, SelectedViewsOnly);
  if Bitmap = nil then
    Exit;
  try
    Bitmap.SaveToClipboardFormat(Format, Data, Palette);
    Clipboard.SetAsHandle(Format, Data);
  finally
    Bitmap.Free;
  end;
end;

function PClipboardManager.GetModelData: PModel;
var
  AReader: PXMLObjectReader;
  AResolver: PReferenceResolver;
  HeaderNode, BodyNode: IXMLNode;
  AModel: PModel;
  XMLDoc: TXMLDocument;
begin
  Result := nil;
  if FClipboardDataKind <> ckModel then Exit;
  if FClipboardDataBuffer = '' then Exit;

  Screen.Cursor := crHourGlass;
  XMLDoc := TXMLDocument.Create(Application);
  try
    // convert Data field's data to XML data
    XMLDoc.LoadFromXML(FClipboardDataBuffer);
    XMLDoc.Active := True;
    if XMLDoc.DocumentElement <> nil then begin
      HeaderNode := XMLDoc.DocumentElement.ChildNodes.Nodes[XPD_HEADER];
      BodyNode := XMLDoc.DocumentElement.ChildNodes.Nodes[XPD_BODY];
      if HeaderNode.ChildNodes.Nodes[CB_XN_DATAKIND].NodeValue <> CB_XN_VAL_MDL then Exit;
      if BodyNode = nil then Exit;
      // decode XML data to Model Information
      AResolver := PReferenceResolver.Create;
      AReader := PXMLObjectReader.Create(BodyNode, AResolver);
      try
        AModel := AReader.ReadObject(CB_KEY_MDL) as PModel;
        if RegulateGUID(AModel, AResolver) then begin
          AResolver.ResolveAll;
          Result := AModel;
        end else AModel.Free;
      finally
        AResolver.Free;
        AReader.Free;
      end;
    end;
  finally
    XMLDoc.Active := False;
    XMLDoc.Free;
    Screen.Cursor := crDefault;
  end;
end;

function PClipboardManager.GetViewsData: PViewOrderedSet;
var
  AReader: PXMLObjectReader;
  AResolver: PReferenceResolver;
  HeaderNode, BodyNode: IXMLNode;
  Views: PViewOrderedSet;
  AView: PView;
  Key: string;
  I: Integer;
  XMLDoc: TXMLDocument;
begin
  Result := nil;
  //if FClipboardDataKind <> ckView then Exit;
  if FClipboardDataBuffer = '' then Exit;

  // there is views data in clipboard and execute this after reading clipboard data
  Screen.Cursor := crHourGlass;
  XMLDoc := TXMLDocument.Create(Application);
  try
    // convert Data. field's data to XML data
    XMLDoc.LoadFromXML(FClipboardDataBuffer);
    XMLDoc.Active := True;
    if XMLDoc.DocumentElement <> nil then begin
      HeaderNode := XMLDoc.DocumentElement.ChildNodes.Nodes[XPD_HEADER];
      BodyNode := XMLDoc.DocumentElement.ChildNodes.Nodes[XPD_BODY];
      if HeaderNode.ChildNodes.Nodes[CB_XN_DATAKIND].NodeValue <> CB_XN_VAL_VIEW then Exit;
      if BodyNode = nil then Exit;
      Views := PViewOrderedSet.Create;
      AResolver := PReferenceResolver.Create;
      AReader := PXMLObjectReader.Create(BodyNode, AResolver);
      try
        for I := 0 to BodyNode.ChildNodes.Count - 1 do begin
          Key := CB_KEY_VIEW + IntToStr(I);
          AView := AReader.ReadObject(Key) as PView;
          if AView <> nil then Views.Add(AView);
        end;
        if Views.Count <= 0 then Exit;
        if RegulateGUID(Views, AResolver) then begin
          AResolver.ResolveAll;
          for I := 0 to Views.Count - 1 do begin
            AView := Views.Items[I] as PView;
            AView.OwnerDiagramView := nil;
          end;
          Result := Views;
        end else begin
          for I := Views.Count - 1 downto 0 do begin
            AView := Views.Items[I] as PView;
            AView.Free;
          end;
          Views.Free;
        end;
      finally
        AResolver.Free;
        AReader.Free;
      end;
    end;
  finally
    XMLDoc.Active := False;
    XMLDoc.Free;
    Screen.Cursor := crDefault;
  end;
end;

//------------------------------------------------------------------------------
// This will be executed whenever any type data is copied to the windows clipboard
//------------------------------------------------------------------------------
procedure PClipboardManager.WMDrawClipboardHandler(var Msg: TMessage);
begin
  // First, Send the WM_DRAWCLIPBOARD msg to the next clipboard viewer
  if FNextCBViewerHandle > 0 then begin
    Msg.Result := SendMessage(FNextCBViewerHandle, WM_DRAWCLIPBOARD, 0, 0);
    //Msg.Result := Ord(PostMessage(FNextCBViewerHandle, WM_DRAWCLIPBOARD, 0, 0));
  end;
  // Then, do our works
  DrawClipboardProc;
end;

//------------------------------------------------------------------------------
// This will be executed when clipboard viwer chain is changed
//------------------------------------------------------------------------------
procedure PClipboardManager.WMChangeCBChainHandler(var Msg: TMessage);
begin
 if HWND(Msg.wParam) = FNextCBViewerHandle then begin
   // case next viewer removed, chain FNextCBViewerHandle to the next-next viewer
   FNextCBViewerHandle := HWND(Msg.lParam);
   //Msg.Result := SendMessage(FNextCBViewerHandle, WM_CHANGECBCHAIN, Msg.wParam, Msg.lParam);
   //Msg.Result := Ord(PostMessage(FNextCBViewerHandle, WM_CHANGECBCHAIN, wParam(Msg.wParam), lParam(Msg.lParam)));
   //Msg.Result := 0;
 end else if FNextCBViewerHandle > 0 then begin
   // else, send WM_CHANGECBCHAIN msg to next viewer
   //Msg.Result := SendMessage(FNextCBViewerHandle, WM_CHANGECBCHAIN, Msg.wParam, Msg.lParam);
   Msg.Result := Ord(PostMessage(FNextCBViewerHandle, WM_CHANGECBCHAIN, wParam(Msg.wParam), lParam(Msg.lParam)));
 end;
end;

// PClipboardManager
////////////////////////////////////////////////////////////////////////////////

end.
