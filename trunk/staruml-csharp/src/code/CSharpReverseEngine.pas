unit CSharpReverseEngine;

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
  Classes, Types,
  CSharpElements, PGMR101Lib_TLB, WhiteStarUML_TLB;

type
	// Forward Interface declarations

	// Forward Class declarations
	PRevEngine = class;
	PCSharpElementBuilder = class;
	PCSharpUMLBuilder = class;
  PTranslateItem = class;
  PClassName = class;

	// Enumerations
  PTranslateItemKind = (tkExtends, tkImplements, tkFieldType, tkFieldAsAssoc, tkReturnType, tkParameterType, tkPackageUsing, tkMethodCSharpDoc);
  PParseProcessKind = (ppkRead, ppkParse, ppkClose, ppkError);

  {Event}
  PParseEvent = procedure(Sender: TObject; FileName: string; Index, Total: Integer; State: PParseProcessKind) of object;
  PUMLElementCreate = procedure(Sender: TObject; Index, Total: Integer; ProcessType: Boolean = True) of object;
  PViewCreateEvent = procedure(Sender: TObject; View: IView; Index, Total: Integer) of object;
  PLogEvent = procedure(Sender: TObject; Msg: string) of object;

  // PClassName
  PClassName = class
  private
    FName: string;
  public
    constructor Create(AName:string);
    property Name: string read FName write FName;
  end;
   // PTranslateItem
  PTranslateItem = class
  private
    FTranslateItemKind: PTranslateItemKind;
    FCSharpElement: PCSharpElement;
    FUMLElement: IUMLElement;
  public
    constructor Create(ATranslateItemKind: PTranslateItemKind; ACSharpElement: PCSharpElement; AUMLElement: IUMLElement);
    property TranslateItemKind: PTranslateItemKind read FTranslateItemKind write FTranslateItemKind;
    property CSharpElement: PCSharpElement read FCSharpElement write FCSharpElement;
    property UMLElement: IUMLElement read FUMLElement write FUMLElement;
  end;

	// PRevEngine
	PRevEngine = class
  private
		{ Member Fields }
		FRootNamespace: PCSharpNamespace;
    FRootUMLPackage: IUMLPackage;
    FSourceFiles: TStringList;
    FDocChk: Boolean;
    FFieldInitValChk: Boolean;
    FPublicChk: Boolean;
    FInternalChk: Boolean;
    FProtectedChk: Boolean;
    FPrivateChk: Boolean;
    FRefFieldTypeChk: Boolean;
    FDefaultViewChk: Boolean;
    FDefaultViewText: string;
    FHiddenClsAttrChk: Boolean;
    FHiddenClsOprChk: Boolean;
    FHiddenOprChk: Boolean;
    FViewOnlyGNRLChk: Boolean;
    FIsCancel: Boolean;
    FDiagramCount: Integer;
    { Internal Variables }
    ViewCount: Integer;
    CurViewPos: Integer;

    { Event }
    FOnParsingFile: PParseEvent;
    FOnUMLElementCreate: PUMLElementCreate;
    FOnUMLDiagramCreate: PUMLElementCreate;
    FOnCreateView: PViewCreateEvent;
    FOnLog: PLogEvent;

		{ Getter/Setter }
		procedure Set_RootNamespace(Value: PCSharpNamespace);

		{ Member procedure/function }
    procedure InitializeRootNamespace;
    function EvaluateViewCount(AUMLPackage: IUMLPackage): Integer;
    procedure ViewCreated(AView: IView);
    procedure CreateOverviewDiagram(AUMLPackage: IUMLPackage);
    procedure CreateOverviewDiagrams;
    procedure SetupCSharpElementBuilder(ACSharpUMLBuilder: PCSharpUMLBuilder);
    procedure Log(Msg: string);

  public
		{ Constructor/Destructor }
		constructor Create; virtual;
		destructor Destroy; override;
		{ Member procedure/function }
    procedure Reverse();
		{ List Type Handling }
		{ Properties }
		property RootNamespace: PCSharpNamespace read FRootNamespace write Set_RootNamespace;
		property RootUMLPackage: IUMLPackage read FRootUMLPackage write FRootUMLPackage;
    property SourceFiles: TStringList read FSourceFiles write FSourceFiles;

    property DocChk: Boolean read FDocChk write FDocChk;
    property FieldInitValChk: Boolean read FFieldInitValChk write FFieldInitValChk;
    property PublicChk: Boolean read FPublicChk write FPublicChk;
    property InternalChk: Boolean read FInternalChk write FInternalChk;
    property ProtectedChk: Boolean read FProtectedChk write FProtectedChk;
    property PrivateChk: Boolean read FPrivateChk write FPrivateChk;
    property RefFieldTypeChk: Boolean read FRefFieldTypeChk write FRefFieldTypeChk;
    property DefaultViewChk: Boolean read FDefaultViewChk  write FDefaultViewChk;
    property DefaultViewText: string  read FDefaultViewText write FDefaultViewText;
    property HiddenClsAttrChk: Boolean read FHiddenClsAttrChk write FHiddenClsAttrChk;
    property HiddenClsOprChk: Boolean read FHiddenClsOprChk write FHiddenClsOprChk;
    property HiddenOprChk: Boolean read FHiddenOprChk write FHiddenOprChk;
    property ViewOnlyGNRLChk: Boolean read FViewOnlyGNRLChk write FViewOnlyGNRLChk;
    property OnParsingFile: PParseEvent read FOnParsingFile write FOnParsingFile;
    property OnUMLElementCreate: PUMLElementCreate read FOnUMLElementCreate write FOnUMLElementCreate;
    property OnUMLDiagramCreate: PUMLElementCreate read FOnUMLDiagramCreate write FOnUMLDiagramCreate;
    property OnCreateView: PViewCreateEvent read FOnCreateView write FOnCreateView;
    property IsCancel: Boolean read FIsCancel write FIsCancel;
    property OnLog: PLogEvent read FOnLog write FOnLog;    
  end;

	// PParseErrorRec
	PParseErrorRec = record
    ErrorCode: Integer;
    ErrorLine: Integer;
    ErrorLinePos: Integer;
    ErrorNumChar: Integer;
    ErrorDescription: string;
  end;

	// PCSharpElementBuilder
	PCSharpElementBuilder = class
  private
		{ Member Fields }
		FSourceFile: string;
		FProGMR: TPgmr;
    ParseErrorRec: PParseErrorRec;
    FReferenceCount: Integer;
    FElementCount: Integer;
    FOnLog: PLogEvent;
		{ Getter/Setter }
		procedure Set_SourceFile(Value: string);
		procedure Set_ProGMR(Value: TPgmr);
    { Member procedure/function }
    procedure InitializeProGMR;
    procedure DetailPGMRErr;

    procedure CreateCSharpNamespace(ParentCSharpElement: PCSharpElement; BaseID: Integer);
    procedure CreateCSharpUsing(ParentCSharpElement: PCSharpElement;BaseID: Integer);
    procedure CreateCSharpClass(ParentCSharpElement: PCSharpElement; BaseID: Integer);
    procedure CreateCSharpClassType(ParentCSharpElement: PCSharpElement; BaseID: Integer);
    procedure CreateCSharpDelegate(ParentCSharpElement: PCSharpElement; BaseID: Integer);
    procedure CreateCSharpEnum(ParentCSharpElement: PCSharpElement; BaseID: Integer);
    procedure CreateCSharpInterface(ParentCSharpElement: PCSharpElement; BaseID: Integer);
    procedure CreateCSharpStruct(ParentCSharpElement: PCSharpElement; BaseID: Integer);
    procedure CreateCSharpConstant(ParentCSharpElement: PCSharpElement; BaseID: Integer);
    procedure CreateCSharpConstructor(ParentCSharpElement: PCSharpElement; BaseID: Integer);
    procedure CreateCSharpDestructor(ParentCSharpElement: PCSharpElement; BaseID: Integer);
    procedure CreateCSharpEvent(ParentCSharpElement: PCSharpElement; BaseID: Integer);
    procedure CreateCSharpField(ParentCSharpElement: PCSharpElement; BaseID: Integer);
    procedure CreateCSharpIndexer(ParentCSharpElement: PCSharpElement; BaseID: Integer);
    procedure CreateCSharpMethod(ParentCSharpElement: PCSharpElement; BaseID: Integer);
    procedure CreateCSharpOperator(ParentCSharpElement: PCSharpElement; BaseID: Integer);
    procedure CreateCSharpProperty(ParentCSharpElement: PCSharpElement; BaseID: Integer);
    procedure CreateCSharpStaticConstructor(ParentCSharpElement: PCSharpElement; BaseID: Integer);
    procedure CreateCSharpParameter(ParentCSharpElement: PCSharpElement; BaseID: Integer);
    procedure CreateCSharpInterfaceEvent(ParentCSharpElement: PCSharpElement; BaseID: Integer);
    procedure CreateCSharpInterfaceIndexer(ParentCSharpElement: PCSharpElement; BaseID: Integer);
    procedure CreateCSharpInterfaceMethod(ParentCSharpElement: PCSharpElement; BaseID: Integer);
    procedure CreateCSharpInterfaceProperty(ParentCSharpElement: PCSharpElement; BaseID: Integer);
    procedure CreateCSharpOperatorParameter( ParentCSharpElement: PCSharpElement; BaseID: Integer);

    function MakeFixedParameter(BaseNode: Integer): PCSharpParameter;
    function MakeParameterArray(BaseNode: Integer): PCSharpParameter;
    function MakeClassAccessibility(CSharpClass : PCSharpClassType; BaseID: Integer): PAccessibilityKind;
    function MakeConstantAccessibility( BaseID: Integer): PAccessibilityKind;
    function MakeFieldAccessibility(CSharpField: PCSharpField; BaseID: Integer): PAccessibilityKind;
    function MakeMethodAccessibility(CSharpMethod: PCSharpClassTypeMember; BaseID: Integer): PAccessibilityKind;
    function MakePropertyAccessor(BaseID:Integer): PPropertyAccessorKind;
    function MakeEventAccessor(BaseID: Integer): PEventAccessorKind;
    function MakeOperatorAccessibility(CSharpOperator: PCSharpClassTypeMember; BaseID: Integer): PAccessibilityKind;
    function MakeConstructorAccessibility(CSharpConstructor: PCSharpClassTypeMember; BaseID: Integer): PAccessibilityKind;
    function MakeDestructorAccessibility(CSharpConstructor: PCSharpClassTypeMember; BaseID: Integer): PAccessibilityKind;
    function MakeStructAccessibility(CSharpStruct: PCSharpClassType; BaseID: Integer): PAccessibilityKind;
    function MakeInterfaceAccessibility(CSharpInterface: PCSharpClassType; BaseID: Integer): PAccessibilityKind;
    function MakeEnumAccessibility(CSharpEnum: PCSharpClassType; BaseID: Integer): PAccessibilityKind;
    function MakeDelegateAccessibility(CSharpDelegate: PCSharpClassType; BaseID: Integer): PAccessibilityKind;

    function ParseSoureFile(Value : string):boolean;
    function GetChildNodesValue(BaseID: Integer): TStringList;
    function GetExistNamespace(CSharpNamespaceName: string; ParentCSharpNamespace: PCSharpNamespace): PCSharpNamespace;
    function SearchNodeValue(StrSearch: string; BaseNode: Integer): string;
    function GetCSharpDoc(SearchID: Integer; BaseID: Integer): string;
    procedure Log(Msg: string);
  public
		{ Constructor/Destructor }
		constructor Create; virtual;
		destructor Destroy; override;
    { Member procedure/function }
    function CreateCSharpElement(ParentCSharpElement:PCSharpElement;BaseID:Integer):Boolean;
    procedure Reset;

		{ Properties }
		property SourceFile: string read FSourceFile write Set_SourceFile;
		property ProGMR: TPgmr read FProGMR write Set_ProGMR;
    property ReferenceCount: Integer read FReferenceCount write FReferenceCount;
    property ElementCount : Integer read FElementCount write FElementCount;
    property OnLog: PLogEvent read FOnLog write FOnLog;    

  end;

	// PCSharpUMLBuilder
	PCSharpUMLBuilder = class
  private
		{ Member Fields }
		FStarUMLApp: IStarUMLApplication;
    FUMLFactory : IUMLFactory;
    FRootUMLPackage : IUMLPackage;
    TranslateItems: TList;

    FCSharpElementCount : Integer;
    FDocChk : Boolean;
    FFieldInitValChk : Boolean;
    FPublicChk : Boolean;
    FInternalChk : Boolean;
    FProtectedChk : Boolean;
    FPrivateChk : Boolean;
    FRefFieldTypeChk : Boolean;
    FOnUMLElementCreate : PUMLElementCreate;
    FTranslateItemsCount: Integer;
    FIsCancel : Boolean;
    FOnLog: PLogEvent;

    function FindCSharpClassType(SearchValue: string; BaseUMLPackage: IUMLClassifier): IUMLClassifier;
    function TrimBasePackageName(ATrimValue: string): string;
    function AccessVisibility(AUMLModelElement: IUMLModelElement): boolean;
    function GetSafeName(ChildName: string; ParentUMLModel: IModel): string;

    procedure AnalysisInheritance(ParentCSharpNamespace: PCSharpNamespace; ParentUMLPackage: IUMLPackage);
    procedure AnalysisExtendInheritance(AChildCSharpClassType: PCSharpClassType; AChildUMLClassifier: IUMLClassifier; AParentUMLPackage: IUMLClassifier);
    procedure AnalysisImplementsInheritance(AChildCSharpClassType: PCSharpClassType; AChildUMLClassifier: IUMLClassifier; AParentUMLPackage: IUMLClassifier);
    procedure AnalysisUMLPackage(ParentCSharpNamespace: PCSharpNamespace; ParentUMLPackage: IUMLPackage);
    procedure AnalysisClassType(ParentCSharpElement: PCSharpElement; ParentUMLPackage: IUMLClassifier);
    procedure AnalysisClassTypeMember(ParentCSharpClassType: PCSharpClassType; ParentUMLClassifier: IUMLClassifier);
    procedure AnalysisParameter(ParentCSharpClassTypeMember: PCSharpClassTypeMember; ParentUMLOperation: IUMLOperation);
    procedure AnalysisUsing(ParentCSharpNamespace: PCSharpNamespace; ParentUMLPackage: IUMLPackage);
    procedure AttachNamespace(CSharpNamespace:PCSharpNamespace; UMLPackage: IUMLPackage);
    procedure AttachClassType(CSharpClassType:PCSharpClassType; UMLClassifier : IUMLClassifier);

    procedure CreateNamespace(CSharpNamespace: PCSharpNamespace; UMLPackage: IUMLPackage);
    procedure CreateClassType(CSharpClassType: PCSharpClassType; UMLClassifier : IUMLClassifier);
    procedure CreateUMLField(CSharpField: PCSharpField; UMLAttribute: IUMLAttribute);
    procedure CreateUMLOperation(CSharpClassTypeMember: PCSharpClassTypeMember; UMLOperation: IUMLOperation);
    procedure CreateUMLParameter(CSharpParameter: PCSharpParameter; UMLParameter: IUMLParameter);

    procedure MakeCSharpClass(CSharpClassType: PCSharpClassType; UMLClassifier: IUMLClassifier);
    procedure MakeCSharpDelegate(CSharpClassType: PCSharpClassType; UMLClassifier: IUMLClassifier);
    procedure MakeCSharpEnum(CSharpClassType: PCSharpClassType; UMLClassifier: IUMLClassifier);
    procedure MakeCSharpInterface(CSharpClassType: PCSharpClassType; UMLClassifier: IUMLClassifier);
    procedure MakeCSharpStruct(CSharpClassType: PCSharpClassType; UMLClassifier: IUMLClassifier);

		procedure Set_StarUMLApp(Value: IStarUMLApplication);
    procedure SetClassTypeProperty(CSharpClassType: PCSharpClassType; UMLClassifier: IUMLClassifier);
    procedure SetOperationProperty(CSharpClassTypeMember: PCSharpClassTypeMember; UMLOperation: IUMLOperation);
    procedure SetOperationEtcProperty(CSharpClassTypeMember: PCSharpClassTypeMember; UMLOperation: IUMLOperation);
    procedure SetTranslateItemsCount(Count : Integer);
    procedure SetUMLAccessibility(CSharpMember: PCSharpMember; UMLModelElement:IUMLModelElement);

    procedure RelateOwnedElementType(ACSharpClassType: PCSharpClassType; AUMLClassifier: IUMLClassifier);
    procedure RelateAttributeType(ATranslateItem: PTranslateItem);
    procedure RelateOpertaionReturnType(ATranslateItem: PTranslateItem);
    procedure RelateParameterType(ATranslateItem: PTranslateItem);
    procedure RelateAssociation(ATranslateItem: PTranslateItem);

    procedure RegisterTranslateItem(ATranslateItemKind: PTranslateItemKind; ACSharpElement: PCSharpElement; AUMLElement: IUMLElement);
    procedure Log(Msg: string);
    procedure SetBooleanTaggedValue(AExtModel: IExtensibleModel; Profile, TagDefSet, TagName: string; AValue: Boolean);
    procedure SetIntegerTaggedValue(AExtModel: IExtensibleModel; Profile, TagDefSet, TagName: string; AValue: Integer);
    procedure SetStringTaggedValue(AExtModel: IExtensibleModel; Profile, TagDefSet, TagName, AValue: string);
    procedure SetStereotype(AExtModel: IExtensibleModel; Profile, StereotypeName: string);
  public
		{ Constructor/Destructor }
		constructor Create; virtual;
		destructor Destroy; override;

    procedure CreateUMLModel(RootNamespace:PCSharpNamespace;RootUMLPackage:IUMLPackage);
    procedure RelateUMLModel(ANamespace:PCSharpNamespace;AUMLPackage:IUMLPackage);
		{ Properties }
		property StarUMLApp: IStarUMLApplication read FStarUMLApp write Set_StarUMLApp;
    property DocChk: Boolean read FDocChk write FDocChk;
    property FieldInitValChk: Boolean read FFieldInitValChk write FFieldInitValChk;
    property PublicChk: Boolean read FPublicChk write FPublicChk;
    property InternalChk: Boolean read FInternalChk write FInternalChk;
    property ProtectedChk: Boolean read FProtectedChk write FProtectedChk;
    property PrivateChk: Boolean read FPrivateChk write FPrivateChk;
    property RefFieldTypeChk: Boolean read FRefFieldTypeChk write FRefFieldTypeChk;
    property CSharpElementCount: Integer read FCSharpElementCount write FCSharpElementCount;
    property TranslateItemsCount: Integer write SetTranslateItemsCount;
    property IsCancel: Boolean read FIsCancel write FIsCancel;
    property OnUMLElementCreate: PUMLElementCreate read FOnUMLElementCreate write FOnUMLElementCreate;
    property OnLog: PLogEvent read FOnLog write FOnLog;
 end;

implementation

uses
Symbols, Utility,
Forms, SysUtils,Dialogs, NLS_CSharpAddIn;

/////////////////////////////////////////////////////////////////////////////
// PClassName

constructor PClassName.Create(AName: string);
begin
  FName := AName;
end;
// PClassName
/////////////////////////////////////////////////////////////////////////////


/////////////////////////////////////////////////////////////////////////////
// PTranslateItem

constructor PTranslateItem.Create(ATranslateItemKind: PTranslateItemKind; ACSharpElement: PCSharpElement; AUMLElement: IUMLElement);
begin
  FTranslateItemKind := ATranslateItemKind;
  FCSharpElement := ACSharpElement;
  FUMLElement := AUMLElement;
end;
// PTranslateItem
/////////////////////////////////////////////////////////////////////////////


/////////////////////////////////////////////////////////////////////////////
//  PRevEngine

constructor PRevEngine.Create;
begin
  inherited Create;
	FRootNamespace := nil;
  FSourceFiles := TStringList.Create;
end;

destructor PRevEngine.Destroy;
begin
  if FSourceFiles <> nil then begin
    FsourceFiles.Free;
  end;

	if FRootNamespace <> nil then begin
		FRootNamespace.Free;
		FRootNamespace := nil;
	end;
	inherited;
end;


{## private ##################################################################}

procedure PRevEngine.Log(Msg: string);
begin
  if Assigned(FOnLog) then
    FOnLog(Self, Msg);
end;

procedure PRevEngine.InitializeRootNamespace;
begin
  FRootNamespace := PCSharpNamespace.Create;
  FRootNamespace.SuperNamespace := nil;
  FRootNamespace.Name := '.';
end;


{## public ###################################################################}

procedure PRevEngine.Reverse;
var
  CSharpElementBuilder: PCSharpElementBuilder;
  CSharpUMLBuilder: PCSharpUMLBuilder;
  I: Integer;
  ParseResult: Boolean;
begin
  InitializeRootNamespace();

  CSharpElementBuilder := PCSharpElementBuilder.Create;
  CSharpElementBuilder.OnLog := FOnLog;
  for I := 0 to FSourceFiles.Count -1 do begin
    if FIsCancel then exit;
    CSharpElementBuilder.Reset;
    CSharpElementBuilder.SourceFile := FSourceFiles.Strings[I];

    OnParsingFile(Self, FSourceFiles.Strings[I], I, FSourceFiles.Count, ppkRead);
    OnParsingFile(Self, FSourceFiles.Strings[I], I, FSourceFiles.Count, ppkParse);

    ParseResult := CSharpElementBuilder.CreateCSharpElement(FRootNamespace, 0);
    if ParseResult then
      OnParsingFile(Self, FSourceFiles.Strings[I], I, FSourceFiles.Count, ppkClose)
    else
      OnParsingFile(Self, FSourceFiles.Strings[I], I, FSourceFiles.Count, ppkError);

    Application.ProcessMessages;
  end;

  if FIsCancel then exit;
  CSharpUMLBuilder := PCSharpUMLBuilder.Create;
  CSharpUMLBuilder.OnLog := FOnLog;
  CSharpUMLBuilder.CSharpElementCount := CSharpElementBuilder.ElementCount;
  SetupCSharpElementBuilder(CSharpUMLBuilder);
  Application.ProcessMessages;
  if FIsCancel then exit;
  try
    CSharpUMLBuilder.StarUMLApp.BeginUpdate;
    CSharpUMLBuilder.CreateUMLModel(FRootNamespace, FRootUMLPackage);
    Application.ProcessMessages;
    CSharpUMLBuilder.TranslateItemsCount := CSharpElementBuilder.ReferenceCount;
    FDiagramCount := CSharpElementBuilder.ReferenceCount;
    CSharpUMLBuilder.RelateUMLModel(FRootNamespace, FRootUMLPackage);
  // Overview Diagram Create
    if IsCancel then exit;
    if DefaultViewChk then
    begin
      CreateOverviewDiagrams;
    end;
  finally
    CSharpUMLBuilder.StarUMLApp.EndUpdate2(True, True);
  end;

  CSharpElementBuilder.Free;
  CSharpUMLBuilder.Free;
end;

procedure PRevEngine.SetupCSharpElementBuilder(ACSharpUMLBuilder:PCSharpUMLBuilder);
begin
  ACSharpUMLBuilder.StarUMLApp := CoWhiteStarUMLApplication.Create;
  ACSharpUMLBuilder.DocChk := DocChk;
  ACSharpUMLBuilder.FieldInitValChk := FieldInitValChk;
  ACSharpUMLBuilder.PublicChk := PublicChk;
  ACSharpUMLBuilder.InternalChk := InternalChk;
  ACSharpUMLBuilder.ProtectedChk := ProtectedChk;
  ACSharpUMLBuilder.PrivateChk := PrivateChk;
  ACSharpUMLBuilder.RefFieldTypeChk := RefFieldTypeChk;
  ACSharpUMLBuilder.OnUMLElementCreate := FOnUMLElementCreate;
end;

function PRevEngine.EvaluateViewCount(AUMLPackage: IUMLPackage): Integer;
var
  Pkg: IUMLPackage;
  M: IUMLModelElement;
  C, I: Integer;
begin
  C := 0;
  for I := 0 to AUMLPackage.GetOwnedElementCount - 1 do begin
    M := AUMLPackage.GetOwnedElementAt(I);
    if M.IsKindOf(ELEM_CLASS) or M.IsKindOf(ELEM_INTERFACE) or M.IsKindOf(ELEM_ENUMERATION) then
      Inc(C)
    else if M.QueryInterface(IUMLPackage, Pkg) = S_OK then
      C := C + EvaluateViewCount(Pkg);
  end;
  Result := C;
end;

procedure PRevEngine.ViewCreated(AView: IView);
begin
  Inc(CurViewPos);
  if Assigned(FOnCreateView) then
    FOnCreateView(Self, AView, CurViewPos, ViewCount);
end;

procedure PRevEngine.CreateOverviewDiagram(AUMLPackage: IUMLPackage);
var
  UMLDiagram: IUMLClassDiagram;
  UMLDiagramView: IDiagramView;
  StarUMLApp: IStarUMLApplication;
  ExistRealization: Boolean;
  XUMLModel: IUMLModelElement;
  XUMLModelView: IView;
  XChildUMLPackage: IUMLPackage;
  I, J: Integer;
begin
  if FIsCancel then exit;
  StarUMLApp := CoWhiteStarUMLApplication.Create;
  try
    UMLDiagram := StarUMLApp.UMLFactory.CreateClassDiagram(AUMLPackage);
    UMLDiagramView := UMLDiagram.DiagramView;

    if Length(DefaultViewText) = 0 then
      UMLDiagram.Name := StringReplace('Overview of %s', '%s', AUMLPackage.Name, [rfReplaceAll])
    else
      UMLDiagram.Name := StringReplace(DefaultViewText, '%s', AUMLPackage.Name, [rfReplaceAll]);

    for I := 0 to AUMLPackage.GetOwnedElementCount - 1 do
    begin
      if FIsCancel then exit;
      XUMLModel := AUMLPackage.GetOwnedElementAt(I);
      FOnUMLDiagramCreate(PClassName.Create(XUMLModel.Name), 1, FDiagramCount);

      if ViewOnlyGNRLChk then
      begin
        ExistRealization := False;
        if XUMLModel.IsKindOf(ELEM_ENUMERATION) then
          continue;

        if XUMLModel.IsKindOf(ELEM_CLASS) or XUMLModel.IsKindOf(ELEM_INTERFACE) then
        begin
          if (XUMLModel as IUMLClassifier).GetGeneralizationCount = 0 then
          begin
            for J := 0 to (XUMLModel as IUMLClassifier).GetClientDependencyCount -1 do
            begin
              if (XUMLModel as IUMLClassifier).GetClientDependencyAt(J).IsKindOf(ELEM_REALIZATION) then
                ExistRealization := True;
            end;
            if FIsCancel then exit;
            for J := 0 to (XUMLModel as IUMLClassifier).GetSupplierDependencyCount -1 do
            begin
              if (XUMLModel as IUMLClassifier).GetSupplierDependencyAt(J).IsKindOf(ELEM_REALIZATION) then
                ExistRealization := True;
            end;
          end
          else
            ExistRealization := True;

          if ExistRealization = False then
            continue;
        end;
      end;
      if IsCancel then exit;
      if XUMLModel.IsKindOf(ELEM_CLASS) or
        XUMLModel.IsKindOf(ELEM_INTERFACE) then
      begin
        XUMLModelView := UMLDiagramView.CreateViewOf(XUMLModel,0,0);
        ViewCreated(XUMLModelView);
         if not XUMLModel.IsKindOf(ELEM_INTERFACE) then
         begin
          (XUMLModelView as IUMLClassifierView).SuppressAttributes := HiddenClsAttrChk;
          (XUMLModelView as IUMLClassifierView).SuppressOperations := HiddenClsOprChk;
          (XUMLModelView as IUMLClassifierView).ShowOperationSignature := Not(HiddenOprChk);
         end;
      end;

      if XUMLModel.IsKindOf(ELEM_ENUMERATION) then
      begin
        XUMLModelView := UMLDiagramView.CreateViewOf(XUMLModel,0,0);
        ViewCreated(XUMLModelView);
        (XUMLModelView as IUMLEnumerationView).SuppressLiterals := HiddenClsAttrChk;
        (XUMLModelView as IUMLEnumerationView).SuppressOperations := HiddenClsOprChk;
        (XUMLModelView as IUMLEnumerationView).ShowOperationSignature := Not(HiddenOprChk);
      end;

      if XUMLModel.IsKindOf(ELEM_PACKAGE) then
      begin
        XChildUMLPackage := XUMLModel as IUMLPackage;
        CreateOverviewDiagram(XChildUMLPackage);
      end;
    end;
    if IsCancel then exit;
    StarUMLApp.OpenDiagram(UMLDiagram);
    Application.ProcessMessages;
    UMLDiagramView.LayoutDiagram;
  finally
    StarUMLApp := nil;
  end;
end;

procedure PRevEngine.CreateOverviewDiagrams;
begin
  ViewCount := EvaluateViewCount(FRootUMLPackage);
  CurViewPos := 0;
  try
    CreateOverviewDiagram(FRootUMLPackage);
  finally
    ViewCount := 0;
    CurViewPos := 0;
  end;
end;

procedure PRevEngine.Set_RootNamespace(Value: PCSharpNamespace);
begin
  if FRootNamespace <> Value then begin
    FRootNamespace := Value;
  end;
end;

//  PRevEngine
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  PCSharpElementBuilder

constructor PCSharpElementBuilder.Create;
begin
  inherited Create;
  InitializeProGMR;
  FElementCount := 0;
end;

destructor PCSharpElementBuilder.Destroy;
begin
  if FProGMR <> nil then
    FProGMR.Free;
	inherited;
end;
{## private ##################################################################}
procedure PCSharpElementBuilder.InitializeProGMR;
begin
  FProGMR := TPgmr.Create(Application);

  FProGMR.SetGrammar(GetDllDirectory + '\' + CSHARP_GRAMMAR_FILE_NAME);
end;

procedure PCSharpElementBuilder.Log(Msg: string);
begin
  if Assigned(FOnLog) then
    FOnLog(Self, Msg);
end;

function PCSharpElementBuilder.ParseSoureFile(Value : String):boolean;
begin
  FProGMR.SetInputFilename(Value);
  FProGMR.Parse;
  if FProGMR.GetNumErrors > 0 then begin
    DetailPGMRErr;
    Result := False
  end
  else
  begin
    Result := True;
  end;
end;

procedure PCSharpElementBuilder.DetailPGMRErr;
var
  ErrPos: Integer;
begin
  ErrPos := StrToIntDef(FProGMR.GetErrorDetail(0, PGMR_ERR_STARTPOS), -1);
  with ParseErrorRec do begin
    ErrorCode := FProGMR.GetErrorCode(0);
    ErrorLine := FProGMR.GetInputLineNumber(ErrPos);
    ErrorLinePos := ErrPos - FProGMR.GetInputLinePos(ErrorLine);
    ErrorNumChar := StrToIntDef(FProGMR.GetErrorDetail(0, PGMR_ERR_NUMCHAR), 0);
    ErrorDescription := FProGMR.GetErrorDescription(0);
  end;
end;

{## public ###################################################################}
procedure PCSharpElementBuilder.Reset;
begin

  FSourceFile := '';
  with ParseErrorRec do begin
    ErrorCode := -1;
    ErrorLine := -1;
    ErrorLinePos := -1;
    ErrorNumChar := -1;
    ErrorDescription := '';
  end;
end;

function PCSharpElementBuilder.CreateCSharpElement(ParentCSharpElement: PCSharpElement; BaseID: Integer): Boolean;
begin
  Result := ParseSoureFile(FSourceFile);
  if Result then
  begin
    BaseID := FProGMR.Find('/.*compilation_unit',BaseID);
    CreateCSharpNamespace(ParentCSharpElement,BaseID);
  end
  else
    Log(Format(ERR_PARSING_ERROR,[FSourceFile,ParseErrorRec.ErrorDescription,ParseErrorRec.ErrorLine,ParseErrorRec.ErrorLinePos]));

end;

procedure PCSharpElementBuilder.CreateCSharpNamespace(ParentCSharpElement: PCSharpElement; BaseID: Integer);
var
  ChildrenNum: Integer;
  ChildID: Integer;
  ChildLabel: string;
  CSharpNamespace: PCSharpNamespace;
  ParentCSharpNamespace: PCSharpNamespace;
  NodesValue: TStringList;
  I: Integer;  
begin

  if PGMR_NODE_NAMESPACE_DECLARATION = FProGMR.GetLabel(BaseID) then
  begin

    ParentCSharpNamespace := ParentCSharpElement as PCSharpNamespace;
    NodesValue :=  GetChildNodesValue(FProGMR.Find('qualified_identifier', BaseID));

    for I := 0 to NodesValue.Count -1 do
    begin
      CSharpNamespace := GetExistNamespace(NodesValue.Strings[I], ParentCSharpNamespace);

      if CSharpNamespace = nil then
      begin
        CSharpNamespace := PCSharpNamespace.Create;
        FElementCount := FElementCount + 1;
        CSharpNamespace.Name := NodesValue.Strings[I];
        CSharpNamespace.Documentation := GetCSharpDoc(BaseID,BaseID);
      end;

      if I < (NodesValue.Count - 1) then
      begin
        ParentCSharpNamespace.Add_SubNamespace(CSharpNamespace);
        ParentCSharpNamespace := CSharpNamespace;
      end;
    end;

    ParentCSharpNamespace.Add_SubNamespace(CSharpNamespace);
    ParentCSharpElement := CSharpNamespace;
  end;

// 계속 하위 탐색
  ChildrenNum := FProGMR.GetNumChildren(BaseID);
  for I:=0 to ChildrenNum -1 do
  begin
    ChildID := FProGMR.GetChild(BaseID,I);
    ChildLabel := FProGMR.GetLabel(ChildID);

    if PGMR_NODE_USING_DIRECTIVE = ChildLabel then
      CreateCSharpUsing(ParentCSharpElement, ChildID)
    else if PGMR_NODE_NAMESPACE_DECLARATION = ChildLabel then
      CreateCSharpNamespace(ParentCSharpElement, ChildID)
    else if PGMR_NODE_TYPE_DECLARATION = ChildLabel then
      CreateCSharpClassType(ParentCSharpElement, ChildID)
    else
      CreateCSharpNamespace(ParentCSharpElement, ChildID);
  end;
end;

function PCSharpElementBuilder.GetExistNamespace(CSharpNamespaceName: string; ParentCSharpNamespace: PCSharpNamespace): PCSharpNamespace;
var
  XCSharpNamespace: PCSharpNamespace;
  I: Integer;
begin

  XCSharpNamespace := nil;

  for I:= 0 to ParentCSharpNamespace.SubNamespaceCount -1 do
  begin
    if ParentCSharpnamespace.SubNamespaces[I].Name = CSharpNamespaceName then
    begin
       XCSharpNamespace := ParentCSharpnamespace.SubNamespaces[I];
       Break ;
    end;
  end;

  Result := XCSharpNamespace;
end;

procedure PCSharpElementBuilder.CreateCSharpClassType(ParentCSharpElement: PCSharpElement; BaseID: Integer);
var
  BaseLabel: string;
begin
  BaseID := FProGMR.GetChild(BaseID,FProGMR.GetNumChildren(BaseID)-1);
  BaseLabel := FProGMR.GetLabel(BaseID);
  if PGMR_NODE_CLASS_DECLARATION = BaseLabel then
    CreateCSharpClass(ParentCSharpElement, BaseID)
  else if PGMR_NODE_STRUCT_DECLARATION = BaseLabel then
    CreateCSharpStruct(ParentCSharpElement,BaseID)
  else if PGMR_NODE_INTERFACE_DECLARATION = BaseLabel then
    CreateCSharpInterface(ParentCSharpElement,BaseID)
  else if PGMR_NODE_ENUM_DECLARATION = BaseLabel then
    CreateCSharpEnum(ParentCSharpElement, BaseID)
  else if PGMR_NODE_DELEGATE_DECLARATION = BaseLabel then
    CreateCSharpDelegate(ParentCSharpElement, BaseID);
end;

function PCSharpElementBuilder.GetCSharpDoc(SearchID: Integer; BaseID: Integer):string;
var
  XID: Integer;
  Idx: Integer;
  BeginIdx: Integer;
  EndIdx: Integer;
  StrTmp: string;
  CSharpDoc: string;
begin
  XID :=  SearchID;
  
  while (XID <> PGMR_NODE_NOT_EXISTS) do begin
    XID := FProGMR.GetPrevSibling(XID);
    StrTmp := FProGMR.GetLabel(XID);
    if PGMR_NODE_DISREGARDED_SYMBOL = FProGMR.GetLabel(XID)then
    begin
      if Pos(CSHARP_DOC_BEGIN, string(FProGMR.GetValue(XID))) > 0 then
      begin
        BeginIdx := Pos(CSHARP_DOC_BEGIN, string(FProGMR.GetValue(XID)));
        EndIdx := Pos(CSHARP_DOC_END,string(FProGMR.GetValue(XID)));
        CSharpDoc := Copy(FProGMR.GetValue(XID), BeginIdx + Length(CSHARP_DOC_BEGIN), EndIdx - BeginIdx - Length(CSHARP_DOC_BEGIN));
        CSharpDoc := Trim(CSharpDoc);
        if Pos('///', CSharpDoc) = 1 then
          CSharpDoc := Copy(CSharpDoc,4,Length(CSharpDoc) - 3);

        if Pos('//', CSharpDoc) = 1 then
          CSharpDoc := Copy(CSharpDoc,3,Length(CSharpDoc) - 2);

        Result := CSharpDoc;
        exit;
      end
    end;
  end;

  XID := FProGMR.GetParent(SearchID);
  StrTmp := FProGMR.GetLabel(XID);
  if ( XID <> PGMR_NODE_NOT_EXISTS)
    and (FProGMR.GetLabel(XID) <> PGMR_NODE_USING_DIRECTIVE )
    and ( FProGMR.GetLabel(XID) <> PGMR_NODE_NAMESPACE_DECLARATION )
    and ( FProGMR.GetLabel(XID) <> PGMR_NODE_USING_ALIAS_DIRECTIVE )
    and ( FProGMR.GetLabel(XID) <> PGMR_NODE_USING_NAMESPACE_DIRECTIVE )
    and ( FProGMR.GetLabel(XID) <> PGMR_NODE_CLASS_DECLARATION )
    and ( FProGMR.GetLabel(XID) <> PGMR_NODE_STRUCT_DECLARATION )
    and ( FProGMR.GetLabel(XID) <> PGMR_NODE_INTERFACE_DECLARATION )
    and ( FProGMR.GetLabel(XID) <> PGMR_NODE_ENUM_DECLARATION )
    and ( FProGMR.GetLabel(XID) <> PGMR_NODE_DELEGATE_DECLARATION )
    and ( FProGMR.GetLabel(XID) <> PGMR_NODE_CONSTANT_DECLARATION )
    and ( FProGMR.GetLabel(XID) <> PGMR_NODE_FIELD_DECLARATION )
    and ( FProGMR.GetLabel(XID) <> PGMR_NODE_METHOD_DECLARATION )
    and ( FProGMR.GetLabel(XID) <> PGMR_NODE_PROPERTY_DECLARATION )
    and ( FProGMR.GetLabel(XID) <> PGMR_NODE_EVENT_DECLARATION )
    and ( FProGMR.GetLabel(XID) <> PGMR_NODE_INDEXER_DECLARATION )
    and ( FProGMR.GetLabel(XID) <> PGMR_NODE_OPERATOR_DECLARATION )
    and ( FProGMR.GetLabel(XID) <> PGMR_NODE_CONSTRUCTOR_DECLARATION )
    and ( FProGMR.GetLabel(XID) <> PGMR_NODE_DESTRUCTOR_DECLARATION )
    and ( FProGMR.GetLabel(XID) <> PGMR_NODE_STATIC_CONSTRUCTOR_DECLARATION )
    and ( FProGMR.GetLabel(XID) <> PGMR_NODE_INTERFACE_METHOD_DECLARATION )
    and ( FProGMR.GetLabel(XID) <> PGMR_NODE_INTERFACE_PROPERTY_DECLARATION )
    and ( FProGMR.GetLabel(XID) <> PGMR_NODE_INTERFACE_EVENT_DECLARATION )
    and ( FProGMR.GetLabel(XID) <> PGMR_NODE_INTERFACE_INDEXER_DECLARATION )
  then
    Result := GetCSharpDoc(XID,BaseID);
end;

procedure PCSharpElementBuilder.CreateCSharpClass(ParentCSharpElement: PCSharpElement; BaseID: Integer);
var
  ChildrenNum : Integer;
  ChildID : Integer;
  ChildLabel : string;
  CSharpClass : PCSharpClassType;
  ParentCSharpClass : PCSharpClassType;
  ParentCSharpNamespace : PCSharpNamespace;
  NodeValueList : TStringList;
  I: Integer;  
begin

  if PGMR_NODE_CLASS_DECLARATION = FProGMR.GetLabel(BaseID) then
  begin
    if ParentCSharpElement is PCSharpNamespace then
      ParentCSharpNamespace := ParentCSharpElement as PCSharpNamespace;

    if ParentCSharpElement is PCSharpClassType then
      ParentCSharpClass := ParentCSharpElement as PCSharpClassType;

    CSharpClass := PCSharpClassType.Create;
    FElementCount := FElementCount + 1;
    CSharpClass.CSharpMemberKind := mkClass;
    CSharpClass.Name := SearchNodeValue('cs_ident',BaseID);
    CSharpClass.Accessibility := MakeClassAccessibility(CSharpClass, BaseID);
    CSharpClass.Documentation := GetCSharpDoc(BaseID, BaseID);

    CSharpClass.Extend := SearchNodeValue('class_base.class_type',BaseID);
    ReferenceCount := ReferenceCount + 1;
    NodeValueList := GetChildNodesValue(FProGMR.Find('.class_base.interface_type_list',BaseID));
    for I := 0 to NodeValueList.Count - 1 do
    begin
      CSharpClass.Add_Implement(NodeValueList.Strings[I]);
      ReferenceCount := ReferenceCount + 1;
    end;

    if ParentCSharpElement is PCSharpNamespace then
      ParentCSharpNamespace.Add_ClassType_(CSharpClass);

    if ParentCSharpElement is PCSharpClassType then
      ParentCSharpClass.Add_InnerClass(CSharpClass);

    ParentCSharpElement := CSharpClass;
  end;

  ChildrenNum := FProGMR.GetNumChildren(BaseID);
  for I:=0 to ChildrenNum - 1 do
  begin
    ChildID := FProGMR.GetChild(BaseID,I);
    ChildLabel := FProGMR.GetLabel(ChildID);

    if PGMR_NODE_CONSTANT_DECLARATION = ChildLabel then
      CreateCSharpConstant(ParentCSharpElement, ChildID)
    else if PGMR_NODE_FIELD_DECLARATION = ChildLabel then
      CreateCSharpField(ParentCSharpElement, ChildID)
    else if PGMR_NODE_METHOD_DECLARATION = ChildLabel then
      CreateCSharpMethod(ParentCSharpElement, ChildID)
    else if PGMR_NODE_PROPERTY_DECLARATION = ChildLabel then
      CreateCSharpProperty(ParentCSharpElement, ChildID)
    else if PGMR_NODE_EVENT_DECLARATION = ChildLabel then
      CreateCSharpEvent(ParentCSharpElement, ChildID)
    else if PGMR_NODE_INDEXER_DECLARATION = ChildLabel then
      CreateCSharpIndexer(ParentCSharpElement, ChildID)
    else if PGMR_NODE_OPERATOR_DECLARATION = ChildLabel then
      CreateCSharpOperator(ParentCSharpElement, ChildID)
    else if PGMR_NODE_CONSTRUCTOR_DECLARATION = ChildLabel then
      CreateCSharpConstructor(ParentCSharpElement, ChildID)
    else if PGMR_NODE_DESTRUCTOR_DECLARATION = ChildLabel then
      CreateCSharpDestructor(ParentCSharpElement, ChildID)
    else if PGMR_NODE_STATIC_CONSTRUCTOR_DECLARATION = ChildLabel then
      CreateCSharpConstructor(ParentCSharpElement, ChildID) //      CreateCSharpStaticConstructor(ParentCSharpElement, ChildID)
    else if PGMR_NODE_TYPE_DECLARATION = ChildLabel then
      CreateCSharpClassType(ParentCSharpElement, ChildID) // inner ClassType
    else
      CreateCSharpClass(ParentCSharpElement,ChildID); // 하위 탐색
  end;

end;

function PCSharpElementBuilder.MakeClassAccessibility(CSharpClass : PCSharpClassType; BaseID: Integer): PAccessibilityKind;
var
  Accessibility : PAccessibilityKind;
  NodeValueList : TStringList;
  I : Integer;
  NodeValue : String;
begin
    Accessibility := akInternal;

    NodeValueList := GetChildNodesValue(FProGMR.Find('class_modifiers', BaseID));

    CSharpClass.IsSafe := True;

    for I:=0 to NodeValueList.Count -1 do
    begin
      NodeValue := NodeValueList.Strings[I];
      if 'new' = NodeValue then
        CSharpClass.IsNew := True
      else if 'public' = NodeValue then
        Accessibility := akPublic
      else if 'protected' = NodeValue then
        Accessibility := akProtected
      else if 'internal' = NodeValue then
        if Accessibility = akProtected then
          Accessibility := akProtectedInternal
        else
          Accessibility := akInternal
      else if 'private' = NodeValue then
        Accessibility := akPrivate
      else if 'abstract' = NodeValue then
        CSharpClass.IsAbstract := True
      else if 'sealed' = NodeValue then
        CSharpClass.IsSealed := True
      else if 'unsafe' = NodeValue then
        CSharpClass.IsSafe := False;
    end;

    Result := Accessibility;
end;


procedure PCSharpElementBuilder.CreateCSharpConstant(ParentCSharpElement: PCSharpElement; BaseID: Integer);
var
  ParentCSharpClassType : PCSharpClassType;
  CSharpConstant : PCSharpField;
  CSharpConstantDelsNum : Integer;
  CSharpConstantDelsID : Integer;
  I : Integer;
begin

  if PGMR_NODE_CONSTANT_DECLARATION = FProGMR.GetLabel(BaseID) then
  begin
    ParentCSharpClassType := ParentCSharpElement as PCSharpClassType;
    CSharpConstantDelsID := FProGMR.Find('constant_declarators',BaseID);
    CSharpConstantDelsNum := FProGMR.GetNumChildren(CSharpConstantDelsID);
    for I:=0 to CSharpConstantDelsNum -1 do
    begin
      CSharpConstant := PCSharpField.Create;
      FElementCount := FElementCount + 1;       
      CSharpConstant.IsConstant := True;
      CSharpConstant.Type_ := SearchNodeValue('type', BaseID);
      CSharpConstant.TypeDimension := FProGMR.GetNumChildren(FProGMR.Find('.type.rank_specifiers', BaseID));
      CSharpConstant.Accessibility := MakeConstantAccessibility(BaseID);
      CSharpConstant.Documentation := GetCSharpDoc(BaseID,BaseID);

      CSharpConstant.Name := SearchNodeValue('cs_ident', FProGMR.GetChild(CSharpConstantDelsID,I));
      CSharpConstant.InitializerExpression := SearchNodeValue('constant_expression', FProGMR.GetChild(CSharpConstantDelsID, I));

      ParentCSharpClassType.Add_Field(CSharpConstant);
    end;
  end;
end;

function PCSharpElementBuilder.MakeConstantAccessibility(BaseID: Integer): PAccessibilityKind;
var
  Accessibility : PAccessibilityKind;
  NodeValueList : TStringList;
  I : Integer;
  NodeValue : string;
begin
  Accessibility := akPrivate;
  NodeValueList := GetChildNodesValue(FProGMR.Find('.constant_modifiers', BaseID));

  for I:=0 to NodeValueList.Count -1 do
  begin
    NodeValue := NodeValueList.Strings[I];
    if 'public' = NodeValue then
      Accessibility := akPublic
    else if 'protected' = NodeValue then
      Accessibility := akProtected
    else if 'internal' = NodeValue then
      if Accessibility = akProtected then
        Accessibility := akProtectedInternal
      else
        Accessibility := akInternal
    else if 'private' = NodeValue then
      Accessibility := akPrivate;
  end;

  Result := Accessibility;
end;

procedure PCSharpElementBuilder.CreateCSharpField(ParentCSharpElement: PCSharpElement; BaseID:Integer);
var
  ParentCSharpClassType : PCSharpClassType;
  CSharpField : PCSharpField;
  CSharpFieldDelsID : Integer;
  CSharpFieldDelsNum : Integer;
  I : Integer;
begin
  if PGMR_NODE_FIELD_DECLARATION = FProGMR.GetLabel(BaseID) then
  begin
    ParentCSharpClassType := ParentCSharpElement as PCSharpClassType;

    CSharpFieldDelsID := FProGMR.Find('variable_declarators',BaseID);
    CSharpFieldDelsNum := FProGMR.GetNumChildren(CSharpFieldDelsID);
    for I:= 0 to CSharpFieldDelsNum - 1 do
    begin
      CSharpField := PCSharpField.Create;
      FElementCount := FElementCount + 1;
      CSharpField.Name := SearchNodeValue('cs_ident',FProGMR.GetChild(CSharpFieldDelsID,I));
      CSharpField.InitializerExpression := SearchNodeValue('variable_initializer', FProGMR.GetChild(CSharpFieldDelsID, I));
      CSharpField.Documentation := GetCSharpDoc(BaseID,BaseID);

      CSharpField.Type_ := SearchNodeValue('type', BaseID);
      CSharpField.TypeDimension := FProGMR.GetNumChildren(FProGMR.Find('.type.rank_specifiers', BaseID));

      CSharpField.Accessibility := MakeFieldAccessibility(CSharpField, BaseID);
      CSharpField.IsConstant := False;
      ParentCSharpClassType.Add_Field(CSharpField);
    end;
  end;
end;

procedure PCSharpUMLBuilder.RegisterTranslateItem(ATranslateItemKind: PTranslateItemKind; ACSharpElement: PCSharpElement;AUMLElement: IUMLElement);
var
  T: PTranslateItem;
begin
  if FIsCancel then exit;

  T := PTranslateItem.Create(ATranslateItemKind, ACSharpElement, AUMLElement);
  TranslateItems.Add(T);
end;


function PCSharpElementBuilder.MakeFieldAccessibility(CSharpField : PCSharpField; BaseID: Integer): PAccessibilityKind;
var
  Accessibility : PAccessibilityKind;
  NodeValueList : TStringList;
  I : Integer;
  NodeValue : string;
begin
  Accessibility := akPrivate;
  NodeValueList := GetChildNodesValue(FProGMR.Find('field_modifiers', BaseID));

  CSharpField.IsSafe := True;

  for I:=0 to NodeValueList.Count -1 do
  begin
    NodeValue := NodeValueList.Strings[I];
    if 'public' = NodeValue then
      Accessibility := akPublic
    else if 'protected' = NodeValue then
      Accessibility := akProtected
    else if 'internal' = NodeValue then
      if Accessibility = akProtected then
        Accessibility := akProtectedInternal
      else
        Accessibility := akInternal
    else if 'private' = NodeValue then
      Accessibility := akPrivate
    else if 'static' = NodeValue then
      CSharpField.IsStatic := True
    else if 'readonly' = NodeValue then
      CSharpField.IsReadOnly := True
    else if 'volatile' = NodeValue then
      CSharpField.IsVolatile := True
    else if 'unsafe' = NodeValue then  //
      CSharpField.IsSafe := False
  end;

  Result := Accessibility
end;

procedure PCSharpElementBuilder.CreateCSharpMethod(ParentCSharpElement: PCSharpElement; BaseID: Integer);
var
  ParentCSharpClassType : PCSharpClassType;
  CSharpMethod : PCSharpClassTypeMember;
begin
  if PGMR_NODE_METHOD_DECLARATION = FProGMR.GetLabel(BaseID) then
  begin
    ParentCSharpClassType := ParentCSharpElement as PCSharpClassType;
    CSharpMethod := PCSharpClassTypeMember.Create;
    FElementCount := FElementCount + 1;    
    CSharpMethod.Documentation := GetCSharpDoc(BaseID,BaseID);
    CSharpMethod.CSharpClassTypeMemberKind := cmkMethod;
    CSharpMethod.Name := SearchNodeValue('method_header.member_name', BaseID);
    CSharpMethod.ReturnType := SearchNodeValue('method_header.return_type.type', BaseID);
    CSharpMethod.ReturnTypeDimension := FProGMR.GetNumChildren(FProGMR.Find('method_header.return_type.type.rank_specifiers', BaseID));
    CSharpMethod.Accessibility := MakeMethodAccessibility(CSharpMethod, BaseID);
    ParentCSharpClassType.Add_ClassTypeMember(CSharpMethod);
    ParentCSharpElement := CSharpMethod;
    CreateCSharpParameter(ParentCSharpElement,BaseID);
  end;
end;

function PCSharpElementBuilder.MakeMethodAccessibility(CSharpMethod : PCSharpClassTypeMember; BaseID: Integer): PAccessibilityKind;
var
  Accessibility : PAccessibilityKind;
  NodeValueList : TStringList;
  I : Integer;
  NodeValue : string;
begin
  Accessibility := akPrivate;
  NodeValueList := GetChildNodesValue(FProGMR.Find('method_header.method_modifiers', BaseID));

  CSharpMethod.IsSafe := True;;

  for I := 0 to NodeValueList.Count -1 do
  begin
    NodeValue := NodeValueList.Strings[I];
    if 'public' = NodeValue then
      Accessibility := akPublic
    else if 'protected' = NodeValue then
      Accessibility := akProtected
    else if 'internal' = NodeValue then
      if Accessibility = akProtected then
        Accessibility := akProtectedInternal
      else
        Accessibility := akInternal
    else if 'private' = NodeValue then
      Accessibility := akPrivate
    else if 'static' = NodeValue then
      CSharpMethod.IsStatic := True
    else if 'virtual' = NodeValue then
      CSharpMethod.IsVirtual:= True
    else if 'sealed' = NodeValue then
      CSharpMethod.IsSealed := True
    else if 'override' = NodeValue then
      CSharpMethod.IsOverride := True
    else if 'abstract' = NodeValue then
      CSharpMethod.IsAbstract := True
    else if 'extern' = NodeValue then
      CSharpMethod.IsExtern := True
    else if 'unsafe' = NodeValue then  //
      CSharpMethod.IsSafe := False;
  end;

  Result := Accessibility;
end;

procedure PCSharpElementBuilder.CreateCSharpProperty(ParentCSharpElement: PCSharpElement; BaseID: Integer);
var
  ParentCSharpClassType : PCSharpClassType;
  CSharpProperty : PCSharpProperty;
begin
  if PGMR_NODE_PROPERTY_DECLARATION = FProGMR.GetLabel(BaseID) then
  begin
    ParentCSharpClassType := ParentCSharpElement as PCSharpClassType;
    CSharpProperty := PCSharpProperty.Create;
    FElementCount := FElementCount + 1;    
    CSharpProperty.Documentation := GetCSharpDoc(BaseID,BaseID);
    CSharpProperty.CSharpClassTypeMemberKind := cmkProperty;
// 내용 채워 넣기
    CSharpProperty.Name := SearchNodeValue('member_name', BaseID);
    CSharpProperty.ReturnType := SearchNodeValue('type', BaseID);
    CSharpProperty.ReturnTypeDimension :=  FProGMR.GetNumChildren(FProGMR.Find('type.rank_specifiers', BaseID));
    CSharpProperty.Accessibility := MakeMethodAccessibility(CSharpProperty, BaseID);
    CSharpProperty.CSharpPropertyAccessorKind := MakePropertyAccessor(BaseID);

    ParentCSharpClassType.Add_ClassTypeMember(CSharpProperty);
  end;
end;

function PCSharpElementBuilder.MakePropertyAccessor(BaseID: Integer): PPropertyAccessorKind;
var
  PropertyAccessorKind : PPropertyAccessorKind;
  GetAccessor : Boolean;
  SetAccessor : Boolean;
begin
  if FProGMR.Find('accessor_declarations.set_accessor_declaration', BaseID) <> PGMR_NODE_NOT_EXISTS then
    SetAccessor := True
  else
    SetAccessor := False;

  if FProGMR.Find('accessor_declarations.get_accessor_declaration', BaseID) <> PGMR_NODE_NOT_EXISTS then
    GetAccessor := True
  else
    GetAccessor := False;

  if SetAccessor and GetAccessor then
    PropertyAccessorKind := pakSetGet
  else if SetAccessor and (GetAccessor = False) then
    PropertyAccessorKind := pakSet
  else if (SetAccessor = False) and GetAccessor then
    PropertyAccessorKind := pakGet
  else
    PropertyAccessorKind := pakNone;

  Result := PropertyAccessorKind;
end;

procedure PCSharpElementBuilder.CreateCSharpEvent(ParentCSharpElement: PCSharpElement; BaseID: Integer);
var
  ParentCSharpClassType : PCSharpClassType;
  CSharpEvent : PCSharpEvent;
  CSharpCSharpEventDelsID : Integer;
  CSharpCSharpEventDelsNum : Integer;
  I : Integer;
begin
  if PGMR_NODE_EVENT_DECLARATION = FProGMR.GetLabel(BaseID) then
  begin
    ParentCSharpClassType := ParentCSharpElement as PCSharpClassType;

    if FProGMR.Find('member_name',BaseID) <> PGMR_NODE_NOT_EXISTS then
    begin
  // 프로퍼티 형태 구현
      CSharpEvent := PCSharpEvent.Create;
      FElementCount := FElementCount + 1;
      CSharpEvent.Documentation := GetCSharpDoc(BaseID,BaseID);
      CSharpEvent.CSharpClassTypeMemberKind := cmkEvent;
      CSharpEvent.Name := SearchNodeValue('member_name', BaseID);
      CSharpEvent.ReturnType := SearchNodeValue('type', BaseID);
      CSharpEvent.ReturnTypeDimension :=  FProGMR.GetNumChildren(FProGMR.Find('type.rank_specifiers', BaseID));
      CSharpEvent.Accessibility := MakeMethodAccessibility(CSharpEvent, BaseID);
      CSharpEvent.CSharpEventAccessorKind  := eakNone;
      ParentCSharpClassType.Add_ClassTypeMember(CSharpEvent);
    end;
// 변수 선언 형태 구현
    if FProGMR.Find('variable_declarators',BaseID) <> PGMR_NODE_NOT_EXISTS then
    begin
      CSharpCSharpEventDelsID := FProGMR.Find('variable_declarators', BaseID);
      CSharpCSharpEventDelsNum := FProGMR.GetNumChildren(CSharpCSharpEventDelsID);
      for I:= 0 to CSharpCSharpEventDelsNum - 1 do
      begin
        CSharpEvent := PCSharpEvent.Create;
        ElementCount := FElementCount + 1;
        CSharpEvent.Documentation := GetCSharpDoc(BaseID,BaseID);
        CSharpEvent.CSharpClassTypeMemberKind := cmkEvent;
        CSharpEvent.Name := SearchNodeValue('cs_ident', FProGMR.GetChild(CSharpCSharpEventDelsID, I));

        CSharpEvent.ReturnType := SearchNodeValue('type', BaseID);
        CSharpEvent.ReturnTypeDimension := FProGMR.GetNumChildren(FProGMR.Find('.type.rank_specifiers', BaseID));

        CSharpEvent.Accessibility := MakeMethodAccessibility(CSharpEvent, BaseID);
        CSharpEvent.CSharpEventAccessorKind := MakeEventAccessor(BaseID);
        ParentCSharpClassType.Add_ClassTypeMember(CSharpEvent);
      end;// for
    end; // if
  end; // if
end;  // procedure

function PCSharpElementBuilder.MakeEventAccessor(BaseID: Integer): PEventAccessorKind;
var
  EventAccessorKind: PEventAccessorKind;
  AddAccessor: Boolean;
  RemoveAccessor: Boolean;
begin
  if FProGMR.Find('event_accessor_declarations.add_accessor_declaration', BaseID) <> PGMR_NODE_NOT_EXISTS then
    AddAccessor := True
  else
    AddAccessor := False;

  if FProGMR.Find('event_accessor_declarations.remove_accessor_declaration',BaseID) <> PGMR_NODE_NOT_EXISTS then
    RemoveAccessor := True
  else
    RemoveAccessor := False;

  if AddAccessor and RemoveAccessor then
    EventAccessorKind := eakAddRemove
  else if AddAccessor and (RemoveAccessor = False) then
    EventAccessorKind := eakAdd
  else if (AddAccessor = False) and RemoveAccessor then
    EventAccessorKind := eakRemove
  else
    EventAccessorKind := eakNone;

  Result := EventAccessorKind;
end;

procedure PCSharpElementBuilder.CreateCSharpIndexer(ParentCSharpElement: PCSharpElement; BaseID: Integer);
var
  ParentCSharpClassType: PCSharpClassType;
  CSharpIndexer: PCSharpProperty;
begin
  if PGMR_NODE_INDEXER_DECLARATION = FProGMR.GetLabel(BaseID) then
  begin
    ParentCSharpClassType:= ParentCSharpElement as PCSharpClassType;
    CSharpIndexer:= PCSharpProperty.Create;
    ElementCount := FElementCount + 1;
    CSharpIndexer.CSharpClassTypeMemberKind := cmkIndexer;
    CSharpIndexer.Documentation := GetCSharpDoc(BaseID,BaseID);
    CSharpIndexer.Name := CSHARP_INDEXER_NAME;

    CSharpIndexer.ReturnType := SearchNodeValue('indexer_declarator.type',BaseID);
    CSharpIndexer.ReturnTypeDimension :=  FProGMR.GetNumChildren(FProGMR.Find('indexer_declarator.type.rank_specifiers',BaseID));
    CSharpIndexer.Accessibility := MakeMethodAccessibility(CSharpIndexer, BaseID);
    CSharpIndexer.CSharpPropertyAccessorKind := MakePropertyAccessor(BaseID);

    ParentCSharpClassType.Add_ClassTypeMember(CSharpIndexer);
    ParentCSharpElement := CSharpIndexer;
    CreateCSharpParameter(ParentCSharpElement, BaseID);
  end;
end;

procedure PCSharpElementBuilder.CreateCSharpOperator(ParentCSharpElement: PCSharpElement; BaseID: Integer);
var
  ParentCSharpClassType: PCSharpClassType;
  CSharpOperator: PCSharpOperator;
begin
  if PGMR_NODE_OPERATOR_DECLARATION = FProGMR.GetLabel(BaseID) then
  begin
    ParentCSharpClassType := ParentCSharpElement as PCSharpClassType;
    CSharpOperator := PCSharpOperator.Create;
    ElementCount := FElementCount + 1;
    CSharpOperator.Documentation := GetCSharpDoc(BaseID,BaseID);
    CSharpOperator.CSharpClassTypeMemberKind := cmkOperator;
// 내용 채워 넣기
    CSharpOperator.Accessibility := MakeOperatorAccessibility(CSharpOperator, BaseID);

    if FProGMR.Find('operator_declarator.unary_operator_declarator',BaseID) <> PGMR_NODE_NOT_EXISTS then
    begin
      CSharpOperator.Name := SearchNodeValue('operator_declarator.unary_operator_declarator.overloadable_unary_operator', BaseID);
      CSharpOperator.ReturnType := SearchNodeValue('operator_declarator.unary_operator_declarator.type', BaseID);
      CSharpOperator.ReturnTypeDimension :=  FProGMR.GetNumChildren(FProGMR.Find('operator_declarator.unary_operator_declarator.type.rank_specifiers', BaseID));
      CSharpOperator.CSharpConversionOperatiorKind := cokNone;      
    end;

    if FProGMR.Find('operator_declarator.binary_operator_declarator', BaseID) <> PGMR_NODE_NOT_EXISTS then
    begin
      CSharpOperator.Name := SearchNodeValue('operator_declarator.binary_operator_declarator.overloadable_binary_operator', BaseID);
      CSharpOperator.ReturnType := SearchNodeValue('operator_declarator.binary_operator_declarator.type', BaseID);
      CSharpOperator.ReturnTypeDimension :=  FProGMR.GetNumChildren(FProGMR.Find('operator_declarator.binary_operator_declarator.type.rank_specifiers', BaseID));
      CSharpOperator.CSharpConversionOperatiorKind := cokNone;
    end;

    if FProGMR.Find('operator_declarator.conversion_operator_declarator',BaseID) <> PGMR_NODE_NOT_EXISTS then
    begin
      CSharpOperator.Name := SearchNodeValue('operator_declarator.conversion_operator_declarator.type', BaseID);
      CSharpOperator.ReturnType := SearchNodeValue('operator_declarator.conversion_operator_declarator.type', BaseID);
      CSharpOperator.ReturnTypeDimension :=  FProGMR.GetNumChildren(FProGMR.Find('operator_declarator.conversion_operator_declarator.type.rank_specifiers', BaseID));

      if 'implicit' = SearchNodeValue('operator_declarator.conversion_operator_declarator.conversion_operator_type', BaseID) then
        CSharpOperator.CSharpConversionOperatiorKind := cokImplicit
      else if 'explicit' = SearchNodeValue('operator_declarator.conversion_operator_declarator.conversion_operator_type', BaseID) then
        CSharpOperator.CSharpConversionOperatiorKind := cokExplicit
      else
        CSharpOperator.CSharpConversionOperatiorKind := cokNone;
    end;


    ParentCSharpClassType.Add_ClassTypeMember(CSharpOperator);
    ParentCSharpElement := CSharpOperator;
// operator_parameters
// Operation Type 변경할것
    CreateCSharpOperatorParameter(ParentCSharpElement, BaseID);
  end;
end;

function PCSharpElementBuilder.MakeOperatorAccessibility(CSharpOperator: PCSharpClassTypeMember; BaseID: Integer): PAccessibilityKind;
var
  Accessibility: PAccessibilityKind;
  NodeValueList: TStringList;
  I: Integer;
  NodeValue: string;
begin
  Accessibility := akPrivate;
  NodeValueList := GetChildNodesValue(FProGMR.Find('operator_modifiers', BaseID));

  CSharpOperator.IsSafe := True;

  for I := 0 to NodeValueList.Count - 1 do
  begin
    NodeValue := NodeValueList.Strings[I];
    if 'public' = NodeValue then
      Accessibility := akPublic
    else if 'static' = NodeValue then
      CSharpOperator.IsStatic := True
    else if 'extern' = NodeValue then
      CSharpOperator.IsExtern := True
    else if 'unsafe' = NodeValue then  //
      CSharpOperator.IsSafe := False;
  end;

  Result := Accessibility;
end;

procedure PCSharpElementBuilder.CreateCSharpConstructor(ParentCSharpElement: PCSharpElement; BaseID: Integer);
var
  ParentCSharpClassType: PCSharpClassType;
  CSharpConstructor: PCSharpConstructor;
  NodeValueList: TStringList;
  I: Integer;
begin
  if PGMR_NODE_CONSTRUCTOR_DECLARATION = FProGMR.GetLabel(BaseID) then
  begin
    ParentCSharpClassType := ParentCSharpElement as PCSharpClassType;
    CSharpConstructor := PCSharpConstructor.Create;
    ElementCount := FElementCount + 1;
    CSharpConstructor.Documentation := GetCSharpDoc(BaseID,BaseID);
    CSharpConstructor.CSharpClassTypeMemberKind := cmkConstructor;
// 내용 채워 넣기
    CSharpConstructor.Name := SearchNodeValue('constructor_declarator.cs_ident', BaseID);
    CSharpConstructor.Accessibility := MakeConstructorAccessibility(CSharpConstructor, BaseID);

    if 0 < Pos('base',SearchNodeValue('constructor_declarator.constructor_initializer', BaseID)) then
      CSharpConstructor.CSharpConstructorInitializerKind := cikBase
    else if 0 < Pos('this',SearchNodeValue('constructor_declarator.constructor_initializer', BaseID)) then
      CSharpConstructor.CSharpConstructorInitializerKind := cikThis
    else
      CSharpConstructor.CSharpConstructorInitializerKind := cikNone;

    NodeValueList := GetChildNodesValue(FProGMR.Find('constructor_declarator.constructor_initializer.argument_list', BaseID));
    for I:=0 to NodeValueList.Count -1 do
      CSharpConstructor.Add_CSharpConstructorInitializerArguments(NodeValueList[I]);

    ParentCSharpClassType.Add_ClassTypeMember(CSharpConstructor);
    ParentCSharpElement := CSharpConstructor;
    CreateCSharpParameter(ParentCSharpElement,BaseID);
  end;
end;

function PCSharpElementBuilder.MakeConstructorAccessibility(CSharpConstructor: PCSharpClassTypeMember; BaseID: Integer): PAccessibilityKind;
var
  Accessibility: PAccessibilityKind;
  NodeValueList: TStringList;
  NodeValue: string;
  I: Integer;  
begin
  Accessibility := akPrivate;
  NodeValueList := GetChildNodesValue(FProGMR.Find('constructor_modifiers', BaseID));

  CSharpConstructor.IsSafe := True;;

  for I := 0 to NodeValueList.Count - 1 do
  begin
    NodeValue := NodeValueList.Strings[I];
    if 'public' = NodeValue then
      Accessibility := akPublic
    else if 'protected' = NodeValue then
      Accessibility := akProtected
    else if 'internal' = NodeValue then
      if Accessibility = akProtected then
        Accessibility := akProtectedInternal
      else
        Accessibility := akInternal
    else if 'private' = NodeValue then
      Accessibility := akPrivate
    else if 'static' = NodeValue then   // static Constructor
      CSharpConstructor.IsStatic := True
    else if 'extern' = NodeValue then
      CSharpConstructor.IsExtern := True
    else if 'unsafe' = NodeValue then  //
      CSharpConstructor.IsSafe := False;
  end;

  Result := Accessibility;
end;

procedure PCSharpElementBuilder.CreateCSharpDestructor(ParentCSharpElement: PCSharpElement; BaseID: Integer);
var
  ParentCSharpClassType: PCSharpClassType;
  CSharpDestructor: PCSharpClassTypeMember;
begin
  if PGMR_NODE_DESTRUCTOR_DECLARATION = FProGMR.GetLabel(BaseID) then
  begin
    ParentCSharpClassType := ParentCSharpElement as PCSharpClassType;
    CSharpDestructor := PCSharpClassTypeMember.Create;
    ElementCount := FElementCount + 1;
    CSharpDestructor.Documentation := GetCSharpDoc(BaseID,BaseID);
    CSharpDestructor.CSharpClassTypeMemberKind := cmkDestructor;
// 내용 채워 넣기
    CSharpDestructor.Name := SearchNodeValue('cs_ident', BaseID);
    CSharpDestructor.Accessibility := MakeDestructorAccessibility(CSharpDestructor, BaseID);

    ParentCSharpClassType.Add_ClassTypeMember(CSharpDestructor);
  end;

end;

function PCSharpElementBuilder.MakeDestructorAccessibility(CSharpConstructor: PCSharpClassTypeMember; BaseID:Integer): PAccessibilityKind;
var
  Accessibility: PAccessibilityKind;
  NodeValueList: TStringList;
  NodeValue: string;
  I: Integer;  
begin
  Accessibility := akPrivate;
  NodeValueList := GetChildNodesValue(FProGMR.Find('destructor_modifiers', BaseID));

  CSharpConstructor.IsSafe := True;;

  for I := 0 to NodeValueList.Count -1 do
  begin
    NodeValue := NodeValueList.Strings[I];
    if 'extern' = NodeValue then
      CSharpConstructor.IsExtern := True
    else if 'unsafe' = NodeValue then  //
      CSharpConstructor.IsSafe := False;
  end;

  Result := Accessibility;
end;

procedure PCSharpElementBuilder.CreateCSharpStaticConstructor(ParentCSharpElement: PCSharpElement; BaseID: Integer);
var
  ParentCSharpClassType: PCSharpClassType;
  CSharpConstructor: PCSharpClassTypeMember;
begin
  if PGMR_NODE_STATIC_CONSTRUCTOR_DECLARATION = FProGMR.GetLabel(BaseID) then
  begin
    ParentCSharpClassType := ParentCSharpElement as PCSharpClassType;
    CSharpConstructor := PCSharpClassTypeMember.Create;
    ElementCount := FElementCount + 1;
    CSharpConstructor.Documentation := GetCSharpDoc(BaseID,BaseID);
    CSharpConstructor.CSharpClassTypeMemberKind := cmkConstructor;
    CSharpConstructor.IsStatic := True;

    ParentCSharpClassType.Add_ClassTypeMember(CSharpConstructor);
    ParentCSharpElement := CSharpConstructor;
    CreateCSharpParameter(ParentCSharpElement,BaseID);
  end;
end;
////////////////////////////////////////////////////////////////////////////////
procedure PCSharpElementBuilder.CreateCSharpOperatorParameter(ParentCSharpElement: PCSharpElement; BaseID: Integer);
var
  CSharpClassTypeMember: PCSharpClassTypeMember;
  ParamID: Integer;
  ChildNum: Integer;
  OperatorParameterNode: Integer;
  CSharpParameter: PCSharpParameter;
  I: Integer;  
begin

  CSharpClassTypeMember := ParentCSharpElement as PCSharpClassTypeMember;
  ParamID := FProGMR.Find('.*operator_parameters', BaseID);

    if 'operator_parameters' = FProGMR.GetLabel(ParamID) then
    begin
      for I := 0 to FProGMR.GetNumChildren(ParamID) - 1 do
      begin
        OperatorParameterNode := FProGMR.GetChild(ParamID,I);

        CSharpParameter := PCSharpParameter.Create;
        ElementCount := FElementCount + 1;
        CSharpParameter.Name := SearchNodeValue('parameter_name', OperatorParameterNode);
        CSharpParameter.Type_ := SearchNodeValue('type', OperatorParameterNode);
        CSharpParameter.TypeDimension := FProGMR.GetNumChildren(FProGMR.Find('.*rank_specifiers', OperatorParameterNode));

        CSharpClassTypeMember.Add_Parameter(CSharpParameter);
      end;
    end
end;

procedure PCSharpElementBuilder.CreateCSharpParameter(ParentCSharpElement: PCSharpElement; BaseID: Integer);
var
  CSharpClassTypeMember: PCSharpClassTypeMember;
  ChildID: Integer;
  ParamID: Integer;
  ChildNum: Integer;
  FixedParameterNode: Integer;
  I, J: Integer;  
begin
  CSharpClassTypeMember := ParentCSharpElement as PCSharpClassTypeMember;

  ParamID := FProGMR.Find('.*formal_parameter_list', BaseID);
  ChildNum := FProGMR.GetNumChildren(ParamID);
  for I := 0 to ChildNum -1 do
  begin
    ChildID := FProGMR.GetChild(ParamID,I);
    if 'fixed_parameters' = FProGMR.GetLabel(ChildID) then
    begin
      for J := 0 to FProGMR.GetNumChildren(ChildID) - 1 do
      begin
        FixedParameterNode := FProGMR.GetChild(ChildID,J);
        if 'fixed_parameter' = FProGMR.GetLabel(FixedParameterNode) then
        begin
          CSharpClassTypeMember.Add_Parameter(MakeFixedParameter(FixedParameterNode));
        end;
      end;
    end
    else if 'parameter_array' = FProGMR.GetLabel(ChildID) then
    begin
      CSharpClassTypeMember.Add_Parameter(MakeParameterArray(ChildID));
    end;
  end;
end;

function PCSharpElementBuilder.MakeFixedParameter(BaseNode: Integer): PCSharpParameter;
var
  CSharpParameter: PCSharpParameter;
  StrLabel : string;
begin
  CSharpParameter := PCSharpParameter.Create;
  ElementCount := FElementCount + 1;
  CSharpParameter.Name := SearchNodeValue('cs_ident', BaseNode);
  CSharpParameter.Type_ := SearchNodeValue('type', BaseNode);
  CSharpParameter.TypeDimension := FProGMR.GetNumChildren(FProGMR.Find('.*rank_specifiers', BaseNode));

  CSharpParameter.CSharpParmeterModifier := pmkIn;
  if 'out' = SearchNodeValue('parameter_modifier', BaseNode) then
    CSharpParameter.CSharpParmeterModifier := pmkOut
  else if 'Ref' = SearchNodeValue('parameter_modifier', BaseNode) then
    CSharpParameter.CSharpParmeterModifier := pmkRef;

  Result := CSharpParameter;
end;

function PCSharpElementBuilder.MakeParameterArray(BaseNode: Integer): PCSharpParameter;
var
  CSharpParameter: PCSharpParameter;
begin
  CSharpParameter := PCSharpParameter.Create;
  ElementCount := FElementCount + 1;
  CSharpParameter.Name := SearchNodeValue('cs_ident', BaseNode);
  CSharpParameter.Type_ := SearchNodeValue('type', BaseNode);
  CSharpParameter.TypeDimension := FProGMR.GetNumChildren(FProGMR.Find('.*rank_specifiers', BaseNode));
  CSharpParameter.CSharpParmeterModifier  := pmkParams;
  Result := CSharpParameter;
end;


////////////////////////////////////////////////////////////////////////////////

procedure PCSharpElementBuilder.CreateCSharpStruct(ParentCSharpElement: PCSharpElement; BaseID: Integer);
var
  ChildrenNum: Integer;
  ChildID: Integer;
  ChildLabel: string;
  CSharpStruct: PCSharpClassType;
  ParentCSharpClassType: PCSharpClassType;
  ParentCSharpNamespace: PCSharpNamespace;
  NodeValueList: TStringList;
  I: Integer;
begin
  if PGMR_NODE_STRUCT_DECLARATION = FProGMR.GetLabel(BaseID) then
  begin
    if ParentCSharpElement is PCSharpNamespace then
      ParentCSharpNamespace := ParentCSharpElement as PCSharpNamespace;

    if ParentCSharpElement is PCSharpClassType then
      ParentCSharpClassType := ParentCSharpElement as PCSharpClassType;

    CSharpStruct := PCSharpClassType.Create;
    ElementCount := FElementCount + 1;
    CSharpStruct.Documentation := GetCSharpDoc(BaseID,BaseID);
    CSharpStruct.CSharpMemberKind := mkStruct;

    CSharpStruct.Name := SearchNodeValue('cs_ident', BaseID);
    CSharpStruct.Accessibility := MakeStructAccessibility(CSharpStruct, BaseID);

    NodeValueList := GetChildNodesValue(FProGMR.Find('.struct_interfaces.interface_type_list', BaseID));

    for I := 0 to NodeValueList.Count -1 do
    begin
      CSharpStruct.Add_Implement(NodeValueList.Strings[I]);
      ReferenceCount := ReferenceCount +1;
    end;

    if ParentCSharpElement is PCSharpNamespace then
      ParentCSharpNamespace.Add_ClassType_(CSharpStruct);

    if ParentCSharpElement is PCSharpClassType then
      ParentCSharpClassType.Add_InnerClass(CSharpStruct);

    ParentCSharpElement := CSharpStruct;
  end;

// 하위 탐색
  ChildrenNum := FProGMR.GetNumChildren(BaseID);
  for I:=0 to ChildrenNum do
  begin
    ChildID := FProGMR.GetChild(BaseID, I);
    ChildLabel := FProGMR.GetLabel(ChildID);

    if PGMR_NODE_CONSTANT_DECLARATION = ChildLabel then
      CreateCSharpConstant(ParentCSharpElement, ChildID)
    else if PGMR_NODE_FIELD_DECLARATION = ChildLabel then
      CreateCSharpField(ParentCSharpElement, ChildID)
    else if PGMR_NODE_METHOD_DECLARATION = ChildLabel then
      CreateCSharpMethod(ParentCSharpElement, ChildID)
    else if PGMR_NODE_PROPERTY_DECLARATION = ChildLabel then
      CreateCSharpProperty(ParentCSharpElement, ChildID)
    else if PGMR_NODE_EVENT_DECLARATION = ChildLabel then
      CreateCSharpEvent(ParentCSharpElement, ChildID)
    else if PGMR_NODE_INDEXER_DECLARATION = ChildLabel then
      CreateCSharpIndexer(ParentCSharpElement, ChildID)
    else if PGMR_NODE_OPERATOR_DECLARATION = ChildLabel then
      CreateCSharpOperator(ParentCSharpElement, ChildID)
    else if PGMR_NODE_CONSTRUCTOR_DECLARATION = ChildLabel then
      CreateCSharpConstructor(ParentCSharpElement, ChildID)
    else if PGMR_NODE_DESTRUCTOR_DECLARATION = ChildLabel then
      CreateCSharpDestructor(ParentCSharpElement, ChildID)
    else if PGMR_NODE_STATIC_CONSTRUCTOR_DECLARATION = ChildLabel then
      CreateCSharpConstructor(ParentCSharpElement, ChildID) //      CreateCSharpStaticConstructor(ParentCSharpElement, ChildID)
    else if PGMR_NODE_TYPE_DECLARATION = ChildLabel then
      CreateCSharpClassType(ParentCSharpElement, ChildID) // inner ClassType
    else
      CreateCSharpClass(ParentCSharpElement,ChildID); // 하위 탐색
  end;
end;

function PCSharpElementBuilder.MakeStructAccessibility(CSharpStruct : PCSharpClassType; BaseID: Integer): PAccessibilityKind;
var
  Accessibility: PAccessibilityKind;
  NodeValueList: TStringList;
  I: Integer;
  NodeValue: string;
begin
    Accessibility := akPrivate;
    NodeValueList := GetChildNodesValue(FProGMR.Find('struct_modifiers', BaseID));
    CSharpStruct.IsSafe := True;;

    for I := 0 to NodeValueList.Count -1 do
    begin
      NodeValue := NodeValueList.Strings[I];
      if 'new' = NodeValue then
        CSharpStruct.IsNew := True
      else if 'public' = NodeValue then
        Accessibility := akPublic
      else if 'protected' = NodeValue then
        Accessibility := akProtected
      else if 'internal' = NodeValue then
        if Accessibility = akProtected then
          Accessibility := akProtectedInternal
        else
          Accessibility := akInternal
      else if 'private' = NodeValue then
        Accessibility := akPrivate
      else if 'unsafe' = NodeValue then
        CSharpStruct.IsSafe := False;
    end;

    Result := Accessibility;
end;

procedure PCSharpElementBuilder.CreateCSharpInterface(ParentCSharpElement: PCSharpElement; BaseID: Integer);
var
  ChildrenNum: Integer;
  ChildID: Integer;
  ChildLabel: string;
  CSharpInterface: PCSharpClassType;
  ParentCSharpNamespace: PCSharpNamespace;
  ParentCSharpClassType: PCSharpClassType;
  NodeValueList: TStringList;
  I: Integer;  
begin

  if PGMR_NODE_INTERFACE_DECLARATION = FProGMR.GetLabel(BaseID) then
  begin
    if ParentCSharpElement is PCSharpNamespace then
      ParentCSharpNamespace := ParentCSharpElement as PCSharpNamespace;

    if ParentCSharpElement is PCSharpClassType then
      ParentCSharpClassType := ParentCSharpElement as PCSharpClassType;

    CSharpInterface := PCSharpClassType.Create;
    FElementCount := FElementCount + 1;
    CSharpInterface.Documentation := GetCSharpDoc(BaseID,BaseID);
    CSharpInterface.CSharpMemberKind := mkInterface;
// 내용 채워 넣기

    CSharpInterface.Name := SearchNodeValue('cs_ident', BaseID);
    CSharpInterface.Accessibility := MakeInterfaceAccessibility(CSharpInterface, BaseID);

    NodeValueList := GetChildNodesValue(FProGMR.Find('.interface_base.interface_type_list', BaseID));
    for I := 0 to NodeValueList.Count -1 do
    begin
      CSharpInterface.Add_Implement(NodeValueList.Strings[I]);
      ReferenceCount := ReferenceCount +1;
    end;

    if ParentCSharpElement is PCSharpNamespace then
      ParentCSharpNamespace.Add_ClassType_(CSharpInterface);

    if ParentCSharpElement is PCSharpClassType then
      ParentCSharpClassType.Add_InnerClass(CSharpInterface);

    ParentCSharpElement := CSharpInterface;
  end;

// 하위 탐색
  ChildrenNum := FProGMR.GetNumChildren(BaseID);
  for I:=0 to ChildrenNum - 1 do
  begin
    ChildID := FProGMR.GetChild(BaseID,I);
    ChildLabel := FProGMR.GetLabel(ChildID);

    if PGMR_NODE_INTERFACE_METHOD_DECLARATION = ChildLabel then
      CreateCSharpInterfaceMethod(ParentCSharpElement, ChildID)
    else if PGMR_NODE_INTERFACE_PROPERTY_DECLARATION = ChildLabel then
      CreateCSharpInterfaceProperty(ParentCSharpElement, ChildID)
    else if PGMR_NODE_INTERFACE_EVENT_DECLARATION = ChildLabel then
      CreateCSharpInterfaceEvent(ParentCSharpElement, ChildID)
    else if PGMR_NODE_INTERFACE_INDEXER_DECLARATION = ChildLabel then
      CreateCSharpInterfaceIndexer(ParentCSharpElement, ChildID)
    else
      CreateCSharpInterface(ParentCSharpElement,ChildID); // 하위 탐색
  end;
end;

//////////////////// Interface member Start ///////////////////////////////////
//
procedure PCSharpElementBuilder.CreateCSharpInterfaceMethod(ParentCSharpElement: PCSharpElement; BaseID: Integer);
var
  ParentCSharpInterface: PCSharpClassType;
  CSharpMethod: PCSharpClassTypeMember;
begin
  ParentCSharpInterface := ParentCSharpElement as pCSharpClassType;
  CSharpMethod := PCSharpClassTypeMember.Create;
  ElementCount := FElementCount + 1;
  CSharpMethod.Documentation := GetCSharpDoc(BaseID,BaseID);
  CSharpMethod.Name := SearchNodeValue('cs_ident', BaseID);
  CSharpMethod.ReturnType := SearchNodeValue('return_type.type', BaseID);
  CSharpMethod.ReturnTypeDimension :=FProGMR.GetNumChildren(FProGMR.Find('return_type.type.rank_specifiers', BaseID));
  CreateCSharpParameter(CSharpMethod, BaseID);
  ParentCSharpInterface.Add_ClassTypeMember(CSharpMethod);
end;

procedure PCSharpElementBuilder.CreateCSharpInterfaceProperty(ParentCSharpElement: PCSharpElement; BaseID: Integer);
var
  ParentCSharpInterface: PCSharpClassType;
  CSharpProperty: PCSharpProperty;
begin
  ParentCSharpInterface := ParentCSharpElement as pCSharpClassType;
  CSharpProperty := PCSharpProperty.Create;
  ElementCount := FElementCount + 1;
  CSharpProperty.Documentation := GetCSharpDoc(BaseID,BaseID);
  CSharpProperty.Name := SearchNodeValue('cs_ident', BaseID);
  CSharpProperty.CSharpClassTypeMemberKind := cmkProperty;
  CSharpProperty.ReturnType := SearchNodeValue('type', BaseID);
  CSharpProperty.ReturnTypeDimension :=FProGMR.GetNumChildren(FProGMR.Find('type.rank_specifiers', BaseID));

  if FProGMR.Find('interface_accessors.get_accessor', BaseID) <> PGMR_NODE_NOT_EXISTS then
    CSharpProperty.CSharpPropertyAccessorKind := pakGet;

  if FProGMR.Find('interface_accessors.set_accessor', BaseID) <> PGMR_NODE_NOT_EXISTS then
    CSharpProperty.CSharpPropertyAccessorKind := pakSet;

  if (FProGMR.Find('interface_accessors.set_accessor', BaseID) <> PGMR_NODE_NOT_EXISTS)
    and (FProGMR.Find('interface_accessors.set_accessor', BaseID) <> PGMR_NODE_NOT_EXISTS) then
    CSharpProperty.CSharpPropertyAccessorKind := pakSetGet;

  if (FProGMR.Find('interface_accessors.get_accessor', BaseID) = PGMR_NODE_NOT_EXISTS)
    and (FProGMR.Find('interface_accessors.set_accessor', BaseID) = PGMR_NODE_NOT_EXISTS) then
    CSharpProperty.CSharpPropertyAccessorKind := pakNone;

  ParentCSharpInterface.Add_ClassTypeMember(CSharpProperty);
end;

procedure PCSharpElementBuilder.CreateCSharpInterfaceEvent(ParentCSharpElement: PCSharpElement; BaseID: Integer);
var
  ParentCSharpInterface: PCSharpClassType;
  CSharpEvent: PCSharpClassTypeMember;
begin
  ParentCSharpInterface := ParentCSharpElement as pCSharpClassType;
  CSharpEvent := PCSharpEvent.Create;
  ElementCount := FElementCount + 1;
  CSharpEvent.Documentation := GetCSharpDoc(BaseID,BaseID);
  CSharpEvent.Name := SearchNodeValue('cs_ident', BaseID);
  CSharpEvent.CSharpClassTypeMemberKind := cmkEvent;  
  CSharpEvent.ReturnType := SearchNodeValue('type', BaseID);
  CSharpEvent.ReturnTypeDimension :=FProGMR.GetNumChildren(
    FProGMR.Find('type.rank_specifiers', BaseID));
  ParentCSharpInterface.Add_ClassTypeMember(CSharpEvent);
end;

procedure PCSharpElementBuilder.CreateCSharpInterfaceIndexer(ParentCSharpElement: PCSharpElement; BaseID: Integer);
var
  ParentCSharpInterface: PCSharpClassType;
  CSharpIndexer: PCSharpProperty;
begin
  ParentCSharpInterface := ParentCSharpElement as pCSharpClassType;
  CSharpIndexer := PCSharpProperty.Create;
  ElementCount := FElementCount + 1;
  CSharpIndexer.Documentation := GetCSharpDoc(BaseID,BaseID);
  CSharpIndexer.Name := 'this';
  CSharpIndexer.CSharpClassTypeMemberKind := cmkIndexer;
  CSharpIndexer.ReturnType := SearchNodeValue('type', BaseID);
  CSharpIndexer.ReturnTypeDimension :=FProGMR.GetNumChildren(FProGMR.Find('type.rank_specifiers',BaseID));


  if FProGMR.Find('interface_accessors.get_accessor', BaseID) <> PGMR_NODE_NOT_EXISTS then
    CSharpIndexer.CSharpPropertyAccessorKind := pakGet;

  if FProGMR.Find('interface_accessors.set_accessor', BaseID) <> PGMR_NODE_NOT_EXISTS then
    CSharpIndexer.CSharpPropertyAccessorKind := pakSet;

  if (FProGMR.Find('interface_accessors.set_accessor', BaseID) <> PGMR_NODE_NOT_EXISTS)
    and (FProGMR.Find('interface_accessors.set_accessor', BaseID) <> PGMR_NODE_NOT_EXISTS) then
    CSharpIndexer.CSharpPropertyAccessorKind := pakSetGet;

  if (FProGMR.Find('interface_accessors.set_accessor', BaseID) = PGMR_NODE_NOT_EXISTS)
    and (FProGMR.Find('interface_accessors.set_accessor', BaseID) = PGMR_NODE_NOT_EXISTS) then
    CSharpIndexer.CSharpPropertyAccessorKind := pakNone;

  ParentCSharpInterface.Add_ClassTypeMember(CSharpIndexer);
  ParentCSharpElement := CSharpIndexer;
  CreateCSharpParameter(ParentCSharpElement, BaseID);
end;
//
//////////////////// Interface member End ///////////////////////////////////

function PCSharpElementBuilder.MakeInterfaceAccessibility(CSharpInterface : PCSharpClassType; BaseID: Integer): PAccessibilityKind;
var
  Accessibility: PAccessibilityKind;
  NodeValueList: TStringList;
  NodeValue: string;
  I: Integer;  
begin
    Accessibility := akPublic;
    NodeValueList := GetChildNodesValue(FProGMR.Find('interface_modifiers', BaseID));
    CSharpInterface.IsSafe := True;;

    for I:=0 to NodeValueList.Count -1 do
    begin
      NodeValue := NodeValueList.Strings[I];
      if 'new' = NodeValue then
        CSharpInterface.IsNew := True
      else if 'public' = NodeValue then
        Accessibility := akPublic
      else if 'protected' = NodeValue then
        Accessibility := akProtected
      else if 'internal' = NodeValue then
        if Accessibility = akProtected then
          Accessibility := akProtectedInternal
        else
          Accessibility := akInternal
      else if 'private' = NodeValue then
        Accessibility := akPrivate
      else if 'unsafe' = NodeValue then
        CSharpInterface.IsSafe := False;
    end;

    Result := Accessibility;
end;

procedure PCSharpElementBuilder.CreateCSharpEnum(ParentCSharpElement: PCSharpElement; BaseID: Integer);
var
  CSharpEnum : PCSharpClassType;
  ParentCSharpNamespace : PCSharpNamespace;
  ParentCSharpClassType : PCSharpClassType;
  ChildCSharpConstant : PCSharpField;
  ChildNodeNum : Integer;
  ChildNodeID : Integer;
  ChildLabel : string;
  I: Integer;
begin

  if PGMR_NODE_ENUM_DECLARATION = FProGMR.GetLabel(BaseID) then
  begin
    if ParentCSharpElement is PCSharpNamespace then
      ParentCSharpNamespace := ParentCSharpElement as PCSharpNamespace;

    if ParentCSharpElement is PCSharpClassType then
      ParentCSharpClassType := ParentCSharpElement as PCSharpClassType;

    CSharpEnum := PCSharpClassType.Create;
    ElementCount := FElementCount + 1;
    CSharpEnum.Documentation := GetCSharpDoc(BaseID,BaseID);
    CSharpEnum.CSharpMemberKind := mkEnumeration;
// 내용 채워 넣기

    CSharpEnum.Name := SearchNodeValue('cs_ident',BaseID);
    CSharpEnum.Accessibility := MakeEnumAccessibility(CSharpEnum, BaseID);

    CSharpEnum.Extend := SearchNodeValue('enum_base.integral_type', BaseID);
    ReferenceCount := ReferenceCount +1;
// Constant 항목 만들기
    BaseID := FProGMR.Find('enum_body.enum_member_declarations', BaseID);
    ChildNodeNum := FProGMR.GetNumChildren(BaseID);
    for I := 0 to ChildNodeNum - 1 do
    begin
      ChildNodeID := FProGMR.GetChild(BaseID, I);
      ChildLabel := FProGMR.GetLabel(ChildNodeID);
      if ChildLabel = 'disregarded_symbol' then
        Continue;

      ChildCSharpConstant := PCSharpField.Create;
      ChildCSharpConstant.Documentation := GetCSharpDoc(BaseID,BaseID);
      ChildCSharpConstant.IsConstant := True;
      ChildCSharpConstant.Name := SearchNodeValue('cs_ident', ChildNodeID);
      ChildCSharpConstant.InitializerExpression := SearchNodeValue('constant_expression', ChildNodeID);
      CSharpEnum.Add_Field(ChildCSharpConstant);
    end;

    if ParentCSharpElement is PCSharpNamespace then
      ParentCSharpNamespace.Add_ClassType_(CSharpEnum);

    if ParentCSharpElement is PCSharpClassType then
      ParentCSharpClassType.Add_InnerClass(CSharpEnum);

  end;
end;

function PCSharpElementBuilder.MakeEnumAccessibility(CSharpEnum: PCSharpClassType; BaseID: Integer): PAccessibilityKind;
var
  Accessibility: PAccessibilityKind;
  NodeValueList: TStringList;
  NodeValue: string;
  I: Integer;
begin
    Accessibility := akPublic;
    NodeValueList := GetChildNodesValue(FProGMR.Find('enum_modifiers', BaseID));
    CSharpEnum.IsSafe := True;;

    for I := 0 to NodeValueList.Count - 1 do
    begin
      NodeValue := NodeValueList.Strings[I];
      if 'public' = NodeValue then
        Accessibility := akPublic
      else if 'protected' = NodeValue then
        Accessibility := akProtected
      else if 'internal' = NodeValue then
        if Accessibility = akProtected then
          Accessibility := akProtectedInternal
        else
          Accessibility := akInternal
      else if 'private' = NodeValue then
        Accessibility := akPrivate
      else if 'unsafe' = NodeValue then
        CSharpEnum.IsSafe := False;
    end;

    Result := Accessibility;
end;

procedure PCSharpElementBuilder.CreateCSharpDelegate(ParentCSharpElement: PCSharpElement; BaseID: Integer);
var
  CSharpDelegate: PCSharpClassType;
  ChildCSharpClassTypeMember: PCSharpClassTypeMember;
  ParentCSharpNamespace: PCSharpNamespace;
  ParentCSharpClassType: PCSharpClassType;
begin

  if PGMR_NODE_DELEGATE_DECLARATION = FProGMR.GetLabel(BaseID) then
  begin
    CSharpDelegate := PCSharpClassType.Create;
    ElementCount := FElementCount + 1;
    CSharpDelegate.Documentation := GetCSharpDoc(BaseID,BaseID);
    CSharpDelegate.CSharpMemberKind := mkDelegate;

    CSharpDelegate.Name := SearchNodeValue('cs_ident',BaseID);
// ClassTypeMemeber 하나 만들기
    ChildCSharpClassTypeMember := PCSharpClassTypeMember.Create;
    ChildCSharpClassTypeMember.Name := CSharpDelegate.Name;
    ChildCSharpClassTypeMember.Accessibility := MakeDelegateAccessibility(CSharpDelegate, BaseID);
    ChildCSharpClassTypeMember.ReturnType := SearchNodeValue('return_type.type', BaseID);
    ChildCSharpClassTypeMember.ReturnTypeDimension :=FProGMR.GetNumChildren(
      FProGMR.Find('return_type.type.rank_specifiers', BaseID));
    CreateCSharpParameter(ChildCSharpClassTypeMember, BaseID);
//  ClassTypeMemeber 하나 만들기 끝

    CSharpDelegate.Add_ClassTypeMember(ChildCSharpClassTypeMember);
    if ParentCSharpElement is PCSharpClassType then
    begin
      ParentCSharpClassType := ParentCSharpElement as PCSharpClassType;
      ParentCSharpClassType.Add_InnerClass(CSharpDelegate);
    end
    else if ParentCSharpElement is PCSharpNamespace then
    begin
      ParentCSharpNamespace := ParentCSharpElement as PCSharpNamespace;
      ParentCSharpNamespace.Add_ClassType_(CSharpDelegate);
    end;
  end;
end;


function PCSharpElementBuilder.MakeDelegateAccessibility(CSharpDelegate: PCSharpClassType; BaseID: Integer): PAccessibilityKind;
var
  Accessibility: PAccessibilityKind;
  NodeValueList: TStringList;
  NodeValue: string;
  I: Integer;
begin
    Accessibility := akInternal;
    NodeValueList := GetChildNodesValue(FProGMR.Find('delegate_modifiers', BaseID));
    CSharpDelegate.IsSafe := True;

    for I := 0 to NodeValueList.Count - 1 do
    begin
      NodeValue := NodeValueList.Strings[I];
      if 'public' = NodeValue then
        Accessibility := akPublic
      else if 'protected' = NodeValue then
        Accessibility := akProtected
      else if 'internal' = NodeValue then
        if Accessibility = akProtected then
          Accessibility := akProtectedInternal
        else
          Accessibility := akInternal
      else if 'private' = NodeValue then
        Accessibility := akPrivate
      else if 'unsafe' = NodeValue then
        CSharpDelegate.IsSafe := False;
    end;
    Result := Accessibility;
end;

procedure PCSharpElementBuilder.CreateCSharpUsing(ParentCSharpElement: PCSharpElement; BaseID: Integer);
var
  ParentCSharpNamespace: PCSharpNamespace;
  CSharpUsing: PCSharpUsing;
begin
  ParentCSharpNamespace := ParentCSharpElement as PCSharpNamespace;
  CSharpUsing := PCSharpUsing.Create;
  ElementCount := FElementCount + 1;
  CSharpUsing.Documentation := GetCSharpDoc(BaseID,BaseID);

  if FProGMR.Find(PGMR_NODE_USING_ALIAS_DIRECTIVE,BaseID) > 0 then
  begin
    CSharpUsing.UsingAlias := SearchNodeValue(PGMR_NODE_USING_ALIAS_DIRECTIVE+'.cs_ident', BaseID);
    CSharpUsing.NamespacePath := SearchNodeValue(PGMR_NODE_USING_ALIAS_DIRECTIVE+'.namespace_or_type_name', BaseID)
  end
  else
    CSharpUsing.NamespacePath := SearchNodeValue('using_namespace_directive.namespace_name.namespace_or_type_name', BaseID);

  ParentCSharpNamespace.Add_Using(CSharpUsing);
end;

procedure PCSharpElementBuilder.Set_SourceFile(Value: string);
begin
  FSourceFile := Value;
end;

procedure PCSharpElementBuilder.Set_ProGMR(Value: TPgmr);
begin
  FProGMR := Value;
end;

function PCSharpElementBuilder.SearchNodeValue(StrSearch: string; BaseNode:Integer): string;
begin
  Result := FProGMR.GetValue(FProGMR.Find('.'+StrSearch, BaseNode));
end;

function PCSharpElementBuilder.GetChildNodesValue(BaseID: Integer): TStringList;
var
  ChildID: Integer;
  NodeValueList: TStringList;
  I: Integer;
begin
  NodeValueList := TStringList.Create;

  for I := 0 to FProGMR.GetNumChildren(BaseID) - 1 do
  begin
    ChildID := FProGMR.GetChild(BaseID,I);
    NodeValueList.Add(FProGMR.GetValue(ChildID));
  end;

  Result := NodeValueList;
end;

//  PCSharpElementBuilder
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//  PCSharpUMLBuilder

constructor PCSharpUMLBuilder.Create;
begin
  inherited Create;
  FUMLFactory := nil;
  TranslateItems := TList.Create;
end;

destructor PCSharpUMLBuilder.Destroy;
begin
  if FUMLFactory <> nil then
    FUMLFactory := nil;
  TranslateItems.Free;
	inherited;
end;

procedure PCSharpUMLBuilder.Log(Msg: string);
begin
  if Assigned(FOnLog) then
    FOnLog(Self, Msg);
end;

procedure PCSharpUMLBuilder.Set_StarUMLApp(Value: IStarUMLApplication);
begin
  FStarUMLApp := Value;
  FUMLFactory := FStarUMLApp.UMLFactory;
end;

procedure PCSharpUMLBuilder.CreateUMLModel(RootNamespace: PCSharpNamespace; RootUMLPackage: IUMLPackage);
begin
  FRootUMLPackage := RootUMLPackage;
  CreateNamespace(RootNamespace, RootUMLPackage);
end;

procedure PCSharpUMLBuilder.AttachNamespace(CSharpNamespace: PCSharpNamespace; UMLPackage: IUMLPackage);
begin
  AnalysisUMLPackage(CSharpNamespace,UMLPackage);
  AnalysisClassType(CSharpNamespace, UMLPackage);
end;

procedure PCSharpUMLBuilder.CreateNamespace(CSharpNamespace: PCSharpNamespace; UMLPackage: IUMLPackage);
var
  I: Integer;
begin
  if FIsCancel then exit;

  if (CSharpNamespace.Name <> '.') and (CSharpNamespace.SuperNamespace <> nil) then
    UMLPackage.Name := CSharpNamespace.Name;

  if FDocChk then
    UMLPackage.Documentation := CSharpNamespace.Documentation;

  AnalysisUMLPackage(CSharpNamespace, UMLPackage);
  AnalysisClassType(CSharpNamespace, UMLPackage);
end;

function PCSharpUMLBuilder.AccessVisibility(AUMLModelElement: IUMLModelElement): boolean;
begin
  if FIsCancel then exit;

  if AUMLModelElement <> nil then
    if (AUMLModelElement.Visibility = vkPublic) or
       (AUMLModelElement.Visibility = vkProtected) or
       (AUMLModelElement.GetTaggedValueAsBoolean(CSHARP_PROFILE_NAME, TAGSET_CSHARP_CLASS_MEMBER, TAG_CSHARP_INTERNAL) = True)
    then
      Result := True
    else
      Result := False
  else
    Result := False;
end;

function PCSharpUMLBuilder.TrimBasePackageName(ATrimValue: string): string;
begin
  Result := Copy(ATrimValue, Pos(string(FRootUMLPackage.Pathname), ATrimValue), Length(ATrimValue) - Length(FRootUMLPackage.Pathname));
end;

function PCSharpUMLBuilder.FindCSharpClassType(SearchValue : string; BaseUMLPackage : IUMLClassifier): IUMLClassifier;
var
  XModel: IUMLModelElement;
  XUMLClassifier: IUMLClassifier;
  XName, YName: string;
  I,J: Integer;
begin
  if BaseUMLPackage = nil then
  begin
    Result := nil;exit;
  end;


  XModel := nil;
  if Length(SearchValue) = 0 then
  begin
    Result := nil;exit;
  end;

  XName := SearchValue;
  // baseUMLPackasge에서 찾는다.
  while Pos('.', XName) > 0 do
    begin
      J := Pos('.', XName);
      XName[J] := ':';
      Insert(':', XName, J);
    end;

  if XName = BaseUMLPackage.Name then
    XModel := BaseUMLPackage
  else
    XModel := BaseUMLPackage.FindByRelativePathname(XName) as IUMLModelElement;

  if (XModel <> nil) then
  begin
    if XModel.IsKindOf(ELEM_CLASS) or XModel.IsKindOf(ELEM_INTERFACE) or XModel.IsKindOf(ELEM_ENUMERATION) then
    begin
      Result := XModel as IUMLClassifier;exit;
    end
    else
      XModel := nil;

  end;

  // using에서 찾는다.
  for I := 0 to BaseUMLPackage.GetClientDependencyCount -1 do
  begin
    XUMLClassifier := BaseUMLPackage.GetClientDependencyAt(I).Supplier as IUMLClassifier;

    if XUMLClassifier.IsKindOf(ELEM_PACKAGE) then
    begin
      XModel := XUMLClassifier.FindByRelativePathname(XName) as IUMLClassifier;
    end
    else if XUMLClassifier.IsKindOf(ELEM_CLASS) then
    begin
      if TrimBasePackageName(XUMLClassifier.Pathname) = XName then XModel := XUMLClassifier;
    end
    else if XUMLClassifier.IsKindOf(ELEM_INTERFACE) then
    begin
      if TrimBasePackageName(XUMLClassifier.Pathname) = XName then XModel := XUMLClassifier;
    end;

    if AccessVisibility(XModel) and (XModel.IsKindOf(ELEM_CLASSIFIER))then
    begin
      Result := XModel as IUMLClassifier;exit;
    end
    else
      XModel := nil;
  end;


  // 상위 Namespace있는 데서 찾는다.
  // 최상위인지 검사한다.최상위면 검사 않함
  if FRootUMLPackage <> BaseUMLPackage then
    XModel := FindCSharpClassType(SearchValue ,BaseUMLPackage.Namespace as IUMLClassifier);

  Result := XModel as IUMLClassifier;
end;

procedure PCSharpUMLBuilder.AnalysisExtendInheritance(AChildCSharpClassType: PCSharpClassType; AChildUMLClassifier: IUMLClassifier; AParentUMLPackage: IUMLClassifier);
var
  XParentUMLClassifier: IUMLClassifier;
begin
  if FIsCancel then exit;

  if Length(AChildCSharpClassType.Extend) > 0 then
  begin
    XParentUMLClassifier := FindCSharpClassType(AChildCSharpClassType.Extend, AParentUMLPackage) as IUMLClassifier;
    OnUMLElementCreate(PClassName.Create(AChildCSharpClassType.Extend) , 1, FTranslateItemsCount,False);
    if FIsCancel then exit;
    if XParentUMLClassifier = nil then
    begin
    // none
    end
    else if (AChildUMLClassifier.IsKindOf(ELEM_INTERFACE) and XParentUMLClassifier.IsKindOf(ELEM_INTERFACE)) or
            (AChildUMLClassifier.IsKindOf(ELEM_CLASS) and XParentUMLClassifier.IsKindOf(ELEM_CLASS)) then
      FUMLFactory.CreateGeneralization(AParentUMLPackage, XParentUMLClassifier, AChildUMLClassifier)
    else
      FUMLFactory.CreateRealization(AParentUMLPackage, AChildUMLClassifier, XParentUMLClassifier);
  end;
end;

procedure PCSharpUMLBuilder.AnalysisImplementsInheritance(AChildCSharpClassType: PCSharpClassType; AChildUMLClassifier: IUMLClassifier; AParentUMLPackage: IUMLClassifier);
var
  XParentUMLClassifier: IUMLClassifier;
  I: Integer;
begin
  if FIsCancel then exit;

  for I := 0 to AChildCSharpClassType.ImplementCount -1 do
  begin
    XParentUMLClassifier := FindCSharpClassType(AChildCSharpClassType.Implements[I], AParentUMLPackage) as IUMLClassifier;
    OnUMLElementCreate(PClassName.Create(AChildCSharpClassType.Implements[I]), 1, FTranslateItemsCount, False);
    if FIsCancel then exit;
    if XParentUMLClassifier = nil then
    begin
      Continue; 
    end
    else if (AChildUMLClassifier.IsKindOf(ELEM_INTERFACE) and XParentUMLClassifier.IsKindOf(ELEM_INTERFACE)) or
            (AChildUMLClassifier.IsKindOf(ELEM_CLASS) and XParentUMLClassifier.IsKindOf(ELEM_CLASS))
     then
      FUMLFactory.CreateGeneralization(AParentUMLPackage, XParentUMLClassifier, AChildUMLClassifier)
    else
      FUMLFactory.CreateRealization(AParentUMLPackage, AChildUMLClassifier, XParentUMLClassifier);
  end;
end;

procedure PCSharpUMLBuilder.RelateOwnedElementType(ACSharpClassType: PCSharpClassType; AUMLClassifier: IUMLClassifier);
var
  XChildUMLClassifier: IUMLClassifier;
  I,J,K: Integer;  
begin
  if FIsCancel then exit;

// Owned OwnedElement가 class 인 경우
  for I := 0 to ACSharpClassType.InnerClassCount -1 do
  begin
    XChildUMLClassifier := AUMLClassifier.FindByName(ACSharpClassType.InnerClasses[I].Name) as IUMLClassifier;
    Assert(XChildUMLClassifier <> nil);
    AnalysisExtendInheritance(ACSharpClassType.InnerClasses[I], XChildUMLClassifier, AUMLClassifier as IUMLClassifier);
    AnalysisImplementsInheritance(ACSharpClassType.InnerClasses[I], XChildUMLClassifier, AUMLClassifier as IUMLClassifier);
  end;
end;

procedure PCSharpUMLBuilder.RelateAttributeType(ATranslateItem : PTranslateItem);
var
  XUMLAttribute: IUMLAttribute;
  XCSharpField: PCSharpField;
begin

  XUMLAttribute := ATranslateItem.UMLElement as IUMLAttribute;
  XCSharpField := ATranslateItem.CSharpElement as PCSharpField;

  if XCSharpField.TypeDimension > 0 then
  begin
    XCSharpField.Type_ := Copy(XCSharpField.Type_, 0, Pos('[', XCSharpField.Type_) - 1);
  end;

  Assert(XUMLAttribute <> nil);

  XUMLAttribute.Type_ := FindCSharpClassType(XCSharpField.Type_, XUMLAttribute.Owner) as IUMLClassifier;
  if XUMLAttribute.Type_ = nil then
  begin
    XUMLAttribute.TypeExpression := XCSharpField.Type_;
  end;

  if XCSharpField.TypeDimension  <> 0 then begin
    XUMLAttribute.Multiplicity := '*';
    SetIntegerTaggedValue(XUMLAttribute,CSHARP_PROFILE_NAME, TAGSET_CSHARP_DIMENSION, TAG_CSHARP_DIMENSION, XCSharpField.TypeDimension);
  end;

  if FFieldInitValChk = False then
    XUMLAttribute.InitialValue := XCSharpField.InitializerExpression;
end;

procedure PCSharpUMLBuilder.RelateOpertaionReturnType(ATranslateItem: PTranslateItem);
var
  XUMLOperation: IUMLOperation;
  XUMLParameter: IUMLParameter;
  XCSharpClassTypeMember: PCSharpClassTypeMember;
begin
  if FIsCancel then exit;

  XUMLOperation := ATranslateItem.UMLElement as IUMLOperation;
  XCSharpClassTypeMember := ATranslateItem.CSharpElement as PCSharpClassTypeMember;

  if (XUMLOperation.GetTaggedValueAsBoolean(CSHARP_PROFILE_NAME, TAGSET_CSHARP_OPERATION, TAG_CSHARP_IMPLICIT))
    or XUMLOperation.GetTaggedValueAsBoolean(CSHARP_PROFILE_NAME, TAGSET_CSHARP_OPERATION, TAG_CSHARP_EXPLICIT)
    or (XUMLOperation.StereotypeName = STEREOTYPE_UMLSTD_DESTROY) then exit;

  if XCSharpClassTypeMember is PCSharpConstructor then
    exit;

  if XCSharpClassTypeMember.ReturnTypeDimension > 0 then
  begin
    XCSharpClassTypeMember.ReturnType := Copy(XCSharpClassTypeMember.ReturnType, 0, Pos('[', XCSharpClassTypeMember.ReturnType) - 1);
  end;

  XUMLParameter := StarUMLApp.UMLFactory.CreateParameter(XUMLOperation);
  XUMLParameter.Type_ := FindCSharpClassType(XCSharpClassTypeMember.ReturnType, XUMLOperation.Owner) as IUMLClassifier;
  XUMLParameter.Name := 'return';
  XUMLParameter.DirectionKind := pdkReturn;

  if XUMLParameter.Type_  = nil then
    XUMLParameter.TypeExpression := XCSharpClassTypeMember.ReturnType;

  if XCSharpClassTypeMember.ReturnTypeDimension <> 0 then
    SetIntegerTaggedValue(XUMLParameter, CSHARP_PROFILE_NAME, TAGSET_CSHARP_DIMENSION, TAG_CSHARP_DIMENSION, XCSharpClassTypeMember.ReturnTypeDimension);
end;

procedure PCSharpUMLBuilder.RelateParameterType(ATranslateItem: PTranslateItem);
var
  XUMLParameter: IUMLParameter;
  XCSharpParameter: PCSharpParameter;
begin
  if FIsCancel then exit;

  XUMLParameter := ATranslateItem.UMLElement as IUMLParameter;
  XCSharpParameter := ATranslateItem.CSharpElement as PCSharpParameter;

  if XCSharpParameter.TypeDimension > 0 then
  begin
    XCSharpParameter.Type_ := Copy(XCSharpParameter.Type_, 0, Pos('[', XCSharpParameter.Type_) - 1);
  end;

  Assert(XUMLParameter <> nil);

  XUMLParameter.Type_ := FindCSharpClassType(XCSharpParameter.Type_ , (XUMLParameter.BehavioralFeature as IUMLOperation).Owner as IUMLClassifier) as IUMLClassifier;
  if XUMLParameter.Type_ = nil then
    XUMLParameter.TypeExpression := XCSharpParameter.Type_;

  if XCSharpParameter.TypeDimension <> 0 then
    SetIntegerTaggedValue(XUMLParameter, CSHARP_PROFILE_NAME, TAGSET_CSHARP_DIMENSION, TAG_CSHARP_DIMENSION, XCSharpParameter.TypeDimension );

  if XCSharpParameter.CSharpParmeterModifier = pmkParams then
    SetBooleanTaggedValue(XUMLParameter, CSHARP_PROFILE_NAME, TAGSET_CSHARP_PARAMETER, TAG_CSHARP_PARAMS, True );
end;

procedure PCSharpUMLBuilder.RelateAssociation(ATranslateItem: PTranslateItem);
var
  ParentUMLClassifier: IUMLClassifier;
  OwnAssocEnd: IUMLAssociationEnd;
  OtherAssocEnd: IUMLAssociationEnd;
  XUMLClassifier: IUMLClassifier;
  XUMLAssociation: IUMLAssociation;
  XUMLAttribute: IUMLAttribute;
  XCSharpField: PCSharpField;
begin

  ParentUMLClassifier := ATranslateItem.UMLElement as IUMLClassifier;
  XCSharpField := ATranslateItem.CSharpElement as PCSharpField;

  XCSharpField.Name := XCSharpField.Name;
  if XCSharpField.TypeDimension > 0 then
  begin
    XCSharpField.Type_ := Copy(XCSharpField.Type_, 0, Pos('[',XCSharpField.Type_) - 1);
  end;

  XUMLClassifier := FindCSharpClassType(XCSharpField.Type_, ParentUMLClassifier)  as IUMLClassifier;

// Type이 없으면 Attribute로 생성
  if XUMLClassifier = nil then
  begin
    XUMLAttribute := FUMLFactory.CreateAttribute(ParentUMLClassifier);
    XUMLAttribute.Name := XCSharpField.Name;
    if FDocChk then
    XUMLAttribute.Documentation := XCSharpField.Documentation;

    SetUMLAccessibility(XCSharpField, XUMLAttribute);
    SetBooleanTaggedValue(XUMLAttribute, CSHARP_PROFILE_NAME, TAGSET_CSHARP_FIELD, TAG_CSHARP_VOLATILE, XCSharpField.IsVolatile);
    if XCSharpField.IsReadOnly then
      XUMLAttribute.Changeability := ckFrozen;
    if XCSharpField.IsStatic then
      XUMLAttribute.OwnerScope := skClassifier;

    SetBooleanTaggedValue(XUMLAttribute, CSHARP_PROFILE_NAME, TAGSET_CSHARP_FIELD, TAG_CSHARP_CONST, XCSharpField.IsConstant);
    SetBooleanTaggedValue(XUMLAttribute, CSHARP_PROFILE_NAME, TAGSET_CSHARP_EXTEND, TAG_CSHARP_UNSAFE, Not(XCSharpField.IsSafe));

    ATranslateItem.CSharpElement := XCSharpField;
    ATranslateItem.UMLElement := XUMLAttribute;
    ATranslateItem.FTranslateItemKind := tkFieldType;
    RelateAttributeType(ATranslateItem);
  end
  else
  begin
    XUMLAssociation := FUMLFactory.CreateAssociation(ParentUMLClassifier, ParentUMLClassifier, XUMLClassifier);
    if FDocChk then
      XUMLAssociation.Documentation := XCSharpField.Documentation;

    OwnAssocEnd := XUMLAssociation.GetConnectionAt(0);
    OtherAssocEnd := XUMLAssociation.GetConnectionAt(1);
    OwnAssocEnd.IsNavigable := False;
    if XCSharpField.Name = '' then
      OtherAssocEnd.Name := XUMLClassifier.Name
    else
      OtherAssocEnd.Name := XCSharpField.Name;
    SetUMLAccessibility(XCSharpField, OtherAssocEnd);

    if XCSharpField.TypeDimension <> 0 then
    begin
      OtherAssocEnd.Multiplicity := '*';
      SetIntegerTaggedValue(OtherAssocEnd, CSHARP_PROFILE_NAME, TAGSET_CSHARP_DIMENSION, TAG_CSHARP_DIMENSION, XCSharpField.TypeDimension);
    end;
    SetBooleanTaggedValue(OtherAssocEnd, CSHARP_PROFILE_NAME, TAGSET_CSHARP_FIELD, TAG_CSHARP_VOLATILE, XCSharpField.IsVolatile);
    if XCSharpField.IsReadOnly then
      OtherAssocEnd.Changeability := ckFrozen;

    SetBooleanTaggedValue(OtherAssocEnd, CSHARP_PROFILE_NAME, TAGSET_CSHARP_EXTEND, TAG_CSHARP_STATIC, XCSharpField.IsStatic);
    SetBooleanTaggedValue(OtherAssocEnd, CSHARP_PROFILE_NAME, TAGSET_CSHARP_FIELD, TAG_CSHARP_CONST, XCSharpField.IsConstant);
    SetBooleanTaggedValue(OtherAssocEnd, CSHARP_PROFILE_NAME, TAGSET_CSHARP_EXTEND, TAG_CSHARP_UNSAFE, Not(XCSharpField.IsSafe));
  end;
end;

procedure PCSharpUMLBuilder.AnalysisInheritance(ParentCSharpNamespace: PCSharpNamespace; ParentUMLPackage: IUMLPackage);
var
  ChildUMLPackage: IUMLPackage;
  XChildCSharpClassType: PCSharpClassType;
  XChildUMLClassifier: IUMLClassifier;
  I: Integer;
begin
  if FIsCancel then exit;

  for I := 0 to ParentCSharpNamespace.ClassType_Count -1 do
  begin
    XChildCSharpClassType := ParentCSharpNamespace.ClassType_s[i];
    XChildUMLClassifier := ParentUMLPackage.FindByName(XChildCSharpClassType.Name) as IUMLClassifier;
    Assert(XChildUMLClassifier <> nil);
    if XChildUMLClassifier <> nil then begin
      AnalysisExtendInheritance(XChildCSharpClassType,XChildUMLClassifier, ParentUMLPackage);
      AnalysisImplementsInheritance(XChildCSharpClassType,XChildUMLClassifier, ParentUMLPackage);
      RelateOwnedElementType(XChildCSharpClassType, XChildUMLClassifier);
    end;
  end; //For I

// 하위 탑색
  for I := 0 to ParentCSharpNamespace.SubNamespaceCount -1 do
  begin
    // subNamespace
    ChildUMLPackage := ParentUMLPackage.FindByName(ParentCSharpNamespace.SubNamespaces[I].Name) as IUMLPackage;
    Assert(ChildUMLPackage <> nil);
    AnalysisInheritance(ParentCSharpNamespace.SubNamespaces[I], ChildUMLPackage);
  end;
end;

procedure PCSharpUMLBuilder.AnalysisUsing(ParentCSharpNamespace: PCSharpNamespace; ParentUMLPackage: IUMLPackage);
var
  ChildCSharpUsing: PCSharpUsing;
  XUMLDependency: IUMLDependency;
  ChildUMLPackage: IUMLPackage;
  SameDependencyExist : Boolean;
  I, J: Integer;
  XModel: IModel;
  XName: string;
begin
  if FIsCancel then exit;

  for I := 0 to ParentCSharpNamespace.UsingCount -1 do
  begin
    ChildCSharpUsing := ParentCSharpNamespace.Usings[I];
    XName := ChildCSharpUsing.NamespacePath;

    while Pos('.', XName) > 0 do
    begin
      J := Pos('.', XName);
      XName[J] := ':';
      Insert(':',XName,J);
    end;

    XModel := FRootUMLPackage.FindByRelativePathname(XName);
    if XModel <> nil then
    begin
      SameDependencyExist := false;
      for J := 0 to (XModel as IUMLModelElement).GetSupplierDependencyCount - 1 do
      begin
        XUMLDependency := (XModel as IUMLModelElement).GetSupplierDependencyAt(i);
        if (XUMLDependency <> nil) and (XUMLDependency.Client = ParentUMLPackage) and (XUMLDependency.StereotypeName = STEREOTYPE_UMLSTD_IMPORT) then
          SameDependencyExist := true;
      end;

      if not SameDependencyExist then
      begin
        XUMLDependency := FUMLFactory.CreateDependency(ParentUMLPackage, ParentUMLPackage, XModel as IUMLModelElement);
        XUMLDependency.SetStereotype2(PROFILE_STANDARD, STEREOTYPE_UMLSTD_IMPORT);
      end;
      if FDocChk then
        XUMLDependency.Documentation := ChildCSharpUsing.Documentation;
    end;
  end;

  for I := 0 to ParentCSharpNamespace.SubNamespaceCount -1 do
  begin
    ChildUMLPackage := ParentUMLPackage.FindByName(ParentCSharpNamespace.SubNamespaces[I].Name) as IUMLPackage;
    Assert(ChildUMLPackage <> nil);
    AnalysisUsing(ParentCSharpNamespace.SubNamespaces[I], ChildUMLPackage);
  end;

end;

procedure PCSharpUMLBuilder.SetUMLAccessibility(CSharpMember: PCSharpMember; UMLModelElement: IUMLModelElement);
begin
  if CSharpMember.Accessibility = akPublic then
    UMLModelElement.Visibility := vkPublic
  else if CSharpMember.Accessibility = akProtected then
    UMLModelElement.Visibility := vkProtected
  else if CSharpMember.Accessibility = akInternal then
    SetBooleanTaggedValue(UMLModelElement, CSHARP_PROFILE_NAME, TAGSET_CSHARP_CLASS_MEMBER, TAG_CSHARP_INTERNAL, True)
  else if CSharpMember.Accessibility = akPrivate then
    UMLModelElement.Visibility := vkPrivate
  else if CSharpMember.Accessibility = akProtectedInternal then
  begin
    UMLModelElement.Visibility := vkProtected;
    SetBooleanTaggedValue(UMLModelElement, CSHARP_PROFILE_NAME, TAGSET_CSHARP_CLASS_MEMBER, TAG_CSHARP_INTERNAL, True);
  end;
end;

procedure PCSharpUMLBuilder.CreateClassType(CSharpClassType: PCSharpClassType; UMLClassifier: IUMLClassifier);

var
  I: Integer;
begin
  if FIsCancel then exit;

  SetUMLAccessibility(CSharpClassType, UMLClassifier);
  {mkStruct, mkEnumeration, mkClass, mkInterface, mkDelegate}

  if CSharpClassType.CSharpMemberKind = mkStruct then
    MakeCSharpStruct(CSharpClassType, UMLClassifier)
  else if CSharpClassType.CSharpMemberKind = mkEnumeration then
    MakeCSharpEnum(CSharpClassType, UMLClassifier)
  else if CSharpClassType.CSharpMemberKind = mkClass then
    MakeCSharpClass(CSharpClassType, UMLClassifier)
  else if CSharpClassType.CSharpMemberKind = mkInterface then
    MakeCSharpInterface(CSharpClassType, UMLClassifier)
  else if CSharpClassType.CSharpMemberKind = mkDelegate then
    MakeCSharpDelegate(CSharpClassType, UMLClassifier);

  // inner class
  AnalysisClassType(CSharpClassType, UMLClassifier);
  // Method, Property
  AnalysisClassTypeMember(CSharpClassType, UMLClassifier);

end;

procedure PCSharpUMLBuilder.MakeCSharpStruct(CSharpClassType: PCSharpClassType; UMLClassifier: IUMLClassifier);
begin
  UMLClassifier.SetStereotype2(CSHARP_PROFILE_NAME, STEREOTYPE_CSHARP_STRUCT);
  SetClassTypeProperty(CSharpClassType, UMLClassifier);
end;

procedure PCSharpUMLBuilder.MakeCSharpEnum(CSharpClassType: PCSharpClassType; UMLClassifier: IUMLClassifier);
begin
  SetClassTypeProperty(CSharpClassType, UMLClassifier);
  SetStringTaggedValue(UMLClassifier, CSHARP_PROFILE_NAME, TAGSET_CSHARP_ENUM, TAG_CSHARP_ENUM_BASETYPE, CSharpClassType.Extend);
end;

procedure PCSharpUMLBuilder.MakeCSharpClass(CSharpClassType: PCSharpClassType; UMLClassifier : IUMLClassifier);
begin
  SetClassTypeProperty(CSharpClassType, UMLClassifier);
end;

procedure PCSharpUMLBuilder.MakeCSharpInterface(CSharpClassType: PCSharpClassType; UMLClassifier : IUMLClassifier);
begin
  SetClassTypeProperty(CSharpClassType, UMLClassifier);
end;

procedure PCSharpUMLBuilder.MakeCSharpDelegate(CSharpClassType: PCSharpClassType; UMLClassifier: IUMLClassifier);
begin
  UMLClassifier.SetStereotype2(CSHARP_PROFILE_NAME, STEREOTYPE_CSHARP_DELEGATE);
  SetClassTypeProperty(CSharpClassType, UMLClassifier);
end;

procedure PCSharpUMLBuilder.SetClassTypeProperty(CSharpClassType: PCSharpClassType; UMLClassifier: IUMLClassifier);
begin
  UMLClassifier.IsAbstract := CSharpClassType.IsAbstract;
  UMLClassifier.IsLeaf := CSharpClassType.IsSealed;
  SetBooleanTaggedValue(UMLClassifier, CSHARP_PROFILE_NAME, TAGSET_CSHARP_EXTEND, TAG_CSHARP_UNSAFE, Not (CSharpClassType.IsSafe));
  SetBooleanTaggedValue(UMLClassifier, CSHARP_PROFILE_NAME, TAGSET_CSHARP_EXTEND, TAG_CSHARP_NEW, CSharpClassType.IsNew); // class 만 적용
  if FDocChk then
    UMLClassifier.Documentation := CSharpClassType.Documentation;
end;

procedure PCSharpUMLBuilder.AnalysisClassTypeMember(ParentCSharpClassType: PCSharpClassType; ParentUMLClassifier: IUMLClassifier);
type PAccessibilitys = set of PAccessibilityKind;
var
  XAccessibilitys: PAccessibilitys;
  ChildCSharpClassTypeMemeber: PCSharpClassTypeMember;
  ChildCSharpField: PCSharpField;
  ChildUMLOperation: IUMLOperation;
  ChildUMLAttribute: IUMLAttribute;
  ChildUMLEnumerationLiteral: IUMLEnumerationLiteral;
  I : Integer;  
begin
  if FIsCancel then exit;

  XAccessibilitys := [];
  if FPublicChk then
    XAccessibilitys := XAccessibilitys + [akPublic];
  if FInternalChk then
    XAccessibilitys := XAccessibilitys + [akInternal];
  if FPrivateChk then
    XAccessibilitys := XAccessibilitys + [akPrivate];
  if FProtectedChk then
    XAccessibilitys := XAccessibilitys + [akProtected];

  if FProtectedChk and FInternalChk then
    XAccessibilitys := XAccessibilitys + [akInternal] + [akProtected];

// ClassType Memeber
  for I := 0 to ParentCSharpClassType.ClassTypeMemberCount -1 do
  begin
    if ParentCSharpClassType.ClassTypeMembers[I].Accessibility in XAccessibilitys then
    begin
      ChildUMLOperation := FUMLFactory.CreateOperation(ParentUMLClassifier);
      ChildCSharpClassTypeMemeber := ParentCSharpClassType.ClassTypeMembers[I];
      CreateUMLOperation(ChildCSharpClassTypeMemeber,ChildUMLOperation);
      FOnUMLElementCreate(ChildCSharpClassTypeMemeber, 1, FCSharpElementCount);
      if FIsCancel then exit;
    end;
  end;

// ClassType Field
  for I := 0 to ParentCSharpClassType.FieldCount -1 do
  begin
    if ParentCSharpClassType.Fields[I].Accessibility in XAccessibilitys then
    begin
      if ParentCSharpClassType.CSharpMemberKind = mkEnumeration then
      begin
        ChildUMLEnumerationLiteral := FUMLFactory.CreateEnumerationLiteral(ParentUMLClassifier as IUMLEnumeration);
        ChildUMLEnumerationLiteral.Name := ParentCSharpClassType.Fields[I].Name;
        SetStringTaggedValue(ChildUMLEnumerationLiteral, CSHARP_PROFILE_NAME, TAGSET_CSHARP_ENUM_LITERAL, TAG_CSHARP_ENUM_LITERAL_VALUE, ParentCSharpClassType.Fields[I].InitializerExpression);
      end
      else
        if FRefFieldTypeChk then
          RegisterTranslateItem(tkFieldAsAssoc, ParentCSharpClassType.Fields[I], ParentUMLClassifier)
        else
        begin
          ChildUMLAttribute := FUMLFactory.CreateAttribute(ParentUMLClassifier);
          ChildCSharpField := ParentCSharpClassType.Fields[I];
          ChildCSharpField.Name := ChildCSharpField.Name;
          CreateUMLField(ChildCSharpField, ChildUMLAttribute);
          FOnUMLElementCreate(ChildCSharpField, 1, FCSharpElementCount);
          if FIsCancel then exit;
        end;
    end;
  end;
end;

procedure PCSharpUMLBuilder.CreateUMLOperation(CSharpClassTypeMember: PCSharpClassTypeMember; UMLOperation: IUMLOperation);
begin
  RegisterTranslateItem(tkReturnType, CSharpClassTypeMember, UMLOperation);

  UMLOperation.Name := CSharpClassTypeMember.Name;
  SetUMLAccessibility(CSharpClassTypeMember, UMLOperation);
  if UMLOperation.Owner.IsKindOf(ELEM_INTERFACE) then
    UMLOperation.Visibility := vkPublic;
  if FDocChk then
    UMLOperation.Documentation := CSharpClassTypeMember.Documentation;

  SetOperationProperty(CSharpClassTypeMember, UMLOperation);
  AnalysisParameter(CSharpClassTypeMember, UMLOperation);
end;

procedure PCSharpUMLBuilder.SetOperationProperty(CSharpClassTypeMember: PCSharpClassTypeMember; UMLOperation: IUMLOperation);
begin
  SetBooleanTaggedValue(UMLOperation, CSHARP_PROFILE_NAME, TAGSET_CSHARP_OPERATION, TAG_CSHARP_OVERRIDE, CSharpClassTypeMember.IsOverride);
  SetBooleanTaggedValue(UMLOperation, CSHARP_PROFILE_NAME, TAGSET_CSHARP_OPERATION, TAG_CSHARP_VIRTUAL, CSharpClassTypeMember.IsVirtual);
  UMLOperation.IsAbstract := CSharpClassTypeMember.IsAbstract;
  if CSharpClassTypeMember.IsStatic then
    UMLOperation.OwnerScope := skClassifier;

  SetBooleanTaggedValue(UMLOperation, CSHARP_PROFILE_NAME, TAGSET_CSHARP_EXTEND, TAG_CSHARP_UNSAFE, Not(CSharpClassTypeMember.IsSafe));
  UMLOperation.IsLeaf := CSharpClassTypeMember.IsSealed;
  SetBooleanTaggedValue(UMLOperation, CSHARP_PROFILE_NAME, TAGSET_CSHARP_OPERATION, TAG_CSHARP_EXTERN, CSharpClassTypeMember.IsExtern);

  if CSharpClassTypeMember.CSharpClassTypeMemberKind in [cmkProperty, cmkIndexer, cmkEvent, cmkOperator, cmkConstructor] then
    SetOperationEtcProperty(CSharpClassTypeMember, UMLOperation);

  if CSharpClassTypeMember.CSharpClassTypeMemberKind = cmkConstructor then
    UMLOperation.SetStereotype2(PROFILE_STANDARD, STEREOTYPE_UMLSTD_CREATE)
  else if CSharpClassTypeMember.CSharpClassTypeMemberKind = cmkDestructor then
    UMLOperation.SetStereotype2(PROFILE_STANDARD, STEREOTYPE_UMLSTD_DESTROY);
end;

procedure PCSharpUMLBuilder.SetTranslateItemsCount(Count: Integer);
begin
  FTranslateItemsCount := Count;
end;

procedure PCSharpUMLBuilder.SetOperationEtcProperty(CSharpClassTypeMember: PCSharpClassTypeMember; UMLOperation: IUMLOperation);
var
  XCSharpOperator: PCSharpOperator;
  XCSharpEvent: PCSharpEvent;
  XCSharpProperty: PCSharpProperty;
  XCSharpConstructor: PCSharpConstructor;
  XString: string;
  I: Integer;
begin
/// 특성별로
  if CSharpClassTypeMember.CSharpClassTypeMemberKind in [cmkProperty, cmkIndexer] then
  begin
    if CSharpClassTypeMember.CSharpClassTypeMemberKind = cmkProperty then
      UMLOperation.SetStereotype2(CSHARP_PROFILE_NAME,STEREOTYPE_CSHARP_PROPERTY)
    else if CSharpClassTypeMember.CSharpClassTypeMemberKind = cmkIndexer then
      UMLOperation.SetStereotype2(CSHARP_PROFILE_NAME, STEREOTYPE_CSHARP_PROPERTY);

    XCSharpProperty := CSharpClassTypeMember as PCSharpProperty;

    case XCSharpProperty.CSharpPropertyAccessorKind of
      pakSet : SetBooleanTaggedValue(UMLOperation, CSHARP_PROFILE_NAME, TAGSET_CSHARP_OPERATION, TAG_CSHARP_SET, True);
      pakGet : SetBooleanTaggedValue(UMLOperation, CSHARP_PROFILE_NAME, TAGSET_CSHARP_OPERATION, TAG_CSHARP_GET, True);
      pakSetGet :
      begin
        SetBooleanTaggedValue(UMLOperation, CSHARP_PROFILE_NAME, TAGSET_CSHARP_OPERATION, TAG_CSHARP_SET, True);
        SetBooleanTaggedValue(UMLOperation, CSHARP_PROFILE_NAME, TAGSET_CSHARP_OPERATION, TAG_CSHARP_GET, True);
      end;
      pakNone :;
    end;
  end
  else  if CSharpClassTypeMember.CSharpClassTypeMemberKind = cmkOperator then
  begin
    UMLOperation.SetStereotype2(CSHARP_PROFILE_NAME, STEREOTYPE_CSHARP_OPERATOR);

    XCSharpOperator := CSharpClassTypeMember as PCSharpOperator;
    case XCSharpOperator.CSharpConversionOperatiorKind of
      cokImplicit : SetBooleanTaggedValue(UMLOperation, CSHARP_PROFILE_NAME, TAGSET_CSHARP_OPERATION, TAG_CSHARP_EXPLICIT, True);
      cokExplicit : SetBooleanTaggedValue(UMLOperation, CSHARP_PROFILE_NAME, TAGSET_CSHARP_OPERATION, TAG_CSHARP_IMPLICIT, True);
      cokNone :;
    end;
  end
  else  if CSharpClassTypeMember.CSharpClassTypeMemberKind = cmkEvent then
  begin
    UMLOperation.SetStereotype2(CSHARP_PROFILE_NAME, STEREOTYPE_CSHARP_EVENT);
    XCSharpEvent := CSharpClassTypeMember as PCSharpEvent;
    case XCSharpEvent.CSharpEventAccessorKind of
      eakAdd : SetBooleanTaggedValue(UMLOperation, CSHARP_PROFILE_NAME, TAGSET_CSHARP_OPERATION, TAG_CSHARP_ADD, True);
      eakRemove : SetBooleanTaggedValue(UMLOperation, CSHARP_PROFILE_NAME, TAGSET_CSHARP_OPERATION, TAG_CSHARP_REMOVE, True);
      eakAddRemove :
      begin
        SetBooleanTaggedValue(UMLOperation, CSHARP_PROFILE_NAME, TAGSET_CSHARP_OPERATION, TAG_CSHARP_ADD, True);
        SetBooleanTaggedValue(UMLOperation, CSHARP_PROFILE_NAME, TAGSET_CSHARP_OPERATION, TAG_CSHARP_REMOVE, True);
      end;
      eakNone:;
    end;
  end
  else if CSharpClassTypeMember.CSharpClassTypeMemberKind = cmkConstructor then
  begin
    XCSharpConstructor := CSharpClassTypeMember as PCSharpConstructor;
    case XCSharpConstructor.CSharpConstructorInitializerKind of
      cikBase : XString := 'Base';
      cikThis : XString := 'This';
      cikNone : XString := '';
    end;

    for I := 0 to XCSharpConstructor.CSharpConstructorInitializerArgumentsCount -1 do
      XString := XString + XCSharpConstructor.CSharpConstructorInitializerArgumentses[I];
    if Length(XString) > 0 then
      SetStringTaggedValue(UMLOperation, CSHARP_PROFILE_NAME, TAGSET_CSHARP_OPERATION, TAG_CSHARP_CONSTRUCTOR_INITVALUE, XString);

  end;
end;

procedure PCSharpUMLBuilder.AnalysisParameter(ParentCSharpClassTypeMember: PCSharpClassTypeMember; ParentUMLOperation: IUMLOperation);
var
  ChildCSharpParameter: PCSharpParameter;
  ChildUMLParameter: IUMLParameter;
  I: Integer;  
begin
  if FIsCancel then exit;

  for I := 0 to  ParentCSharpClassTypeMember.ParameterCount -1 do
  begin
    ChildUMLParameter := FUMLFactory.CreateParameter(ParentUMLOperation);
    ChildCSharpParameter := ParentCSharpClassTypeMember.Parameters[I];
    ChildCSharpParameter.Name := ChildCSharpParameter.Name;
    CreateUMLParameter(ChildCSharpParameter, ChildUMLParameter);
    FOnUMLElementCreate(ChildCSharpParameter, 1, FCSharpElementCount);
    if FIsCancel then exit;
  end;
end;

procedure PCSharpUMLBuilder.CreateUMLParameter(CSharpParameter: PCSharpParameter; UMLParameter: IUMLParameter);
begin
  RegisterTranslateItem(tkParameterType,CSharpParameter,UMLParameter);
  UMLParameter.Name := CSharpParameter.Name;

  UMLParameter.DirectionKind := pdkIn;

  case CSharpParameter.CSharpParmeterModifier of
    pmkRef : UMLParameter.DirectionKind := pdkInout;
    pmkOut : UMLParameter.DirectionKind := pdkOut;
  end;
end;


procedure PCSharpUMLBuilder.CreateUMLField(CSharpField: PCSharpField; UMLAttribute: IUMLAttribute);
begin
  RegisterTranslateItem(tkFieldType,CSharpField,UMLAttribute);

  UMLAttribute.Name := CSharpField.Name;
  SetUMLAccessibility(CSharpField, UMLAttribute);

  SetBooleanTaggedValue(UMLAttribute, CSHARP_PROFILE_NAME, TAGSET_CSHARP_FIELD, TAG_CSHARP_VOLATILE, CSharpField.IsVolatile);
  if CSharpField.IsReadOnly then
    UMLAttribute.Changeability := ckFrozen;
  if CSharpField.IsStatic then
    UMLAttribute.OwnerScope := skClassifier;

  SetBooleanTaggedValue(UMLAttribute, CSHARP_PROFILE_NAME, TAGSET_CSHARP_FIELD, TAG_CSHARP_CONST, CSharpField.IsConstant);
  SetBooleanTaggedValue(UMLAttribute, CSHARP_PROFILE_NAME, TAGSET_CSHARP_EXTEND, TAG_CSHARP_UNSAFE, Not(CSharpField.IsSafe));
end;

procedure PCSharpUMLBuilder.AttachClassType(CSharpClassType: PCSharpClassType; UMLClassifier: IUMLClassifier);
begin
  CreateClassType(CSharpClassType, UMLClassifier);
end;

procedure PCSharpUMLBuilder.AnalysisClassType(ParentCSharpElement: PCSharpElement; ParentUMLPackage: IUMLClassifier);
type PAccessibilitys = set of PAccessibilityKind;
var
  XAccessibilitys: PAccessibilitys;
  ChildUMLClassifier: IUMLClassifier;
  ChildCSharpClassType: PCSharpClassType;
  ParentCSharpClassType: PCSharpClassType;
  ParentCSharpNamespace: PCSharpNamespace;
  I: Integer;
begin
  if FIsCancel then exit;

  XAccessibilitys := [];
  if FPublicChk then
    XAccessibilitys := XAccessibilitys + [akPublic];
  if FInternalChk then
    XAccessibilitys := XAccessibilitys + [akInternal];
  if FPrivateChk then
    XAccessibilitys := XAccessibilitys + [akPrivate];
  if FProtectedChk then
    XAccessibilitys := XAccessibilitys + [akProtected];

  if FProtectedChk and FInternalChk then
    XAccessibilitys := XAccessibilitys + [akInternal] + [akProtected];

  if ParentCSharpElement is PCSharpClassType then
  begin
    ParentCSharpClassType := ParentCSharpElement as PCSharpClassType;
    for I := 0 to ParentCSharpClassType.InnerClassCount -1 do
    begin
      ChildCSharpClassType := ParentCSharpClassType.InnerClasses[I];
      if ChildCSharpClassType.Accessibility in XAccessibilitys then
      begin
        ChildCSharpClassType.Name := GetSafeName(ChildCSharpClassType.Name, ParentUMLPackage as IModel);
        if ChildCSharpClassType.CSharpMemberKind = mkEnumeration then
          ChildUMLClassifier := FUMLFactory.CreateEnumeration(ParentUMLPackage)
        else if ChildCSharpClassType.CSharpMemberKind = mkInterface then
          ChildUMLClassifier := FUMLFactory.CreateInterface(ParentUMLPackage)
        else
          ChildUMLClassifier := FUMLFactory.CreateClass(ParentUMLPackage);
        ChildUMLClassifier.Name := ChildCSharpClassType.Name;
        CreateClassType(ChildCSharpClassType, ChildUMLClassifier);
        FOnUMLElementCreate(ChildCSharpClassType, 1, FCSharpElementCount);
        if FIsCancel then exit;
      end;
    end
  end
  else if ParentCSharpElement is PCSharpNamespace then
  begin
    ParentCSharpNamespace := ParentCSharpElement as PCSharpNamespace;

    for I := 0 to ParentCSharpNamespace.ClassType_Count -1 do
    begin
      ChildCSharpClassType := ParentCSharpNamespace.ClassType_s[I];
      ChildCSharpClassType.Name := GetSafeName(ChildCSharpClassType.Name, ParentUMLPackage as IModel);
      if ChildCSharpClassType.CSharpMemberKind = mkEnumeration then
        ChildUMLClassifier := FUMLFactory.CreateEnumeration(ParentUMLPackage)
       else if ChildCSharpClassType.CSharpMemberKind = mkInterface then
        ChildUMLClassifier := FUMLFactory.CreateInterface(ParentUMLPackage)
      else
        ChildUMLClassifier := FUMLFactory.CreateClass(ParentUMLPackage);
      ChildUMLClassifier.Name := ChildCSharpClassType.Name;
      CreateClassType(ChildCSharpClassType, ChildUMLClassifier);
      FOnUMLElementCreate(ChildCSharpClassType, 1, FCSharpElementCount);
      if FIsCancel then exit;
    end;// for
  end; //else
end;

function PCSharpUMLBuilder.GetSafeName(ChildName: string; ParentUMLModel: IModel):string;
var
  XName: string;
  I: Integer;
begin
  I := 0;
  XName := ChildName;

  if (Length(XName) > 0 ) and (Length(Trim(XName)) = 0) then
  begin
    Result := XName;
    Exit ;
  end;

  while (ParentUMLModel.FindByName(XName) <> nil) do
  begin
    I := I + 1;
    XName := ChildName + '_' + IntToStr(I);
  end;

  if XName <> ChildName then
    Log(Format(MSG_ELEMENT_NAME_CHANGED, [ChildName, XName]));
  Result := XName;
end;

procedure PCSharpUMLBuilder.SetStereotype(AExtModel: IExtensibleModel; Profile: string; StereotypeName: string);
begin

  try
    AExtModel.SetStereotype2(Profile,StereotypeName);
  except
    if (StarUMLApp.ExtensionManager.FindIncludedProfile(Profile) <> nil) then begin
      if  (StarUMLApp.ExtensionManager.FindStereotype(Profile, StereotypeName, ELEM_CLASS) <> nil) or
          (StarUMLApp.ExtensionManager.FindStereotype(Profile, StereotypeName, ELEM_COMPONENT) <> nil) or
          (StarUMLApp.ExtensionManager.FindStereotype(Profile, StereotypeName, ELEM_OPERATION) <> nil)
      then
        Log(Format(ERR_CANNOT_WRITE_STEREOTYPE, [Profile, StereotypeName]))
      else
        Log(Format(ERR_STEREOTYPE_NOT_DEFINED, [Profile, StereotypeName]));
    end
    else
      Log(ERR_PROFILE_NOT_DEFINED);
  end;
end;

procedure PCSharpUMLBuilder.SetStringTaggedValue(AExtModel: IExtensibleModel; Profile: string; TagDefSet: string; TagName: string; AValue: string);
begin
  try
    AExtModel.SetTaggedValueAsString(Profile, TagDefSet, TagName, AValue);
  except
    if (StarUMLApp.ExtensionManager.FindIncludedProfile(Profile) <> nil) then begin
      if StarUMLApp.ExtensionManager.FindTagDefinition(Profile, TagDefSet, TagName) = nil then
        Log(Format(ERR_TAG_DEFINITION_NOT_DEFINED, [Profile, TagName]))
      else
        Log(Format(ERR_CANNOT_WRITE_TAG_VALUE, [Profile, TagName]));
    end;
  end;
end;

procedure PCSharpUMLBuilder.SetBooleanTaggedValue(AExtModel: IExtensibleModel; Profile: string; TagDefSet: string; TagName: string; AValue: Boolean);
begin
  try
    AExtModel.SetTaggedValueAsBoolean(Profile, TagDefSet, TagName, AValue);
  except
    if (StarUMLApp.ExtensionManager.FindIncludedProfile(Profile) <> nil) then begin
      if StarUMLApp.ExtensionManager.FindTagDefinition(Profile, TagDefSet, TagName) = nil then
        Log(Format(ERR_TAG_DEFINITION_NOT_DEFINED, [Profile, TagName]))
      else
        Log(Format(ERR_CANNOT_WRITE_TAG_VALUE, [Profile, TagName]));
    end;
  end;
end;

procedure PCSharpUMLBuilder.SetIntegerTaggedValue(AExtModel: IExtensibleModel; Profile: string; TagDefSet: string; TagName: string; AValue: Integer);
begin
  try
    AExtModel.SetTaggedValueAsInteger(Profile, TagDefSet, TagName, AValue);
  except
    if (StarUMLApp.ExtensionManager.FindIncludedProfile(Profile) <> nil) then begin
      if StarUMLApp.ExtensionManager.FindTagDefinition(Profile, TagDefSet, TagName) = nil then
        Log(Format(ERR_TAG_DEFINITION_NOT_DEFINED, [Profile, TagName]))
      else
        Log(Format(ERR_CANNOT_WRITE_TAG_VALUE, [Profile, TagName]));
    end;
  end;
end;

procedure PCSharpUMLBuilder.AnalysisUMLPackage(ParentCSharpNamespace: PCSharpNamespace; ParentUMLPackage: IUMLPackage);
var
  ChildUMLPackage: IUMLPackage;
  I: Integer;  
begin
  if FIsCancel then exit;

  for I := 0 to ParentCSharpNamespace.SubNamespaceCount - 1 do
  begin
// 이름 체크
    if FIsCancel then exit;
    if ParentUMLPackage.FindByName(ParentCSharpNamespace.SubNamespaces[I].Name) <> nil then
      AttachNamespace(ParentCSharpNamespace.SubNamespaces[I], ParentUMLPackage.FindByName(ParentCSharpNamespace.SubNamespaces[I].Name) as IUMLPackage)
    else
    begin
      ChildUMLPackage := FUMLFactory.CreatePackage(ParentUMLPackage);
      CreateNamespace(ParentCSharpNamespace.SubNamespaces[I], ChildUMLPackage);
      FOnUMLElementCreate(ParentCSharpNamespace.SubNamespaces[I],1,FCSharpElementCount);
    end;
  end
end;

procedure PCSharpUMLBuilder.RelateUMLModel(ANamespace: PCSharpNamespace; AUMLPackage: IUMLPackage);
var
  I: Integer;
  XTranslateItem : PTranslateItem;
begin
  if IsCancel then exit;
  FTranslateItemsCount := FTranslateItemsCount + TranslateItems.Count;
  AnalysisUsing(ANamespace, AUMLPackage);
  AnalysisInheritance(ANamespace, AUMLPackage);

  for I := 0 to TranslateItems.Count -1 do
  begin
    if FIsCancel then exit;
    XTranslateItem := TranslateItems.Items[I];
    OnUMLElementCreate(PClassName.Create(XTranslateItem.FCSharpElement.Name), 1, FTranslateItemsCount, False);
    case XTranslateItem.TranslateItemKind of
    tkFieldType:
      RelateAttributeType(XTranslateItem);
    tkReturnType:
      RelateOpertaionReturnType(XTranslateItem);
    tkParameterType:
      RelateParameterType(XTranslateItem);
    tkFieldAsAssoc:
      RelateAssociation(XTranslateItem);
    end;
  end;
end;
//  PCSharpUMLBuilder
/////////////////////////////////////////////////////////////////////////////
end.
