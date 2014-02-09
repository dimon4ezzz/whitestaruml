program WhiteStarUML;

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




{$R 'WhiteStarUMLManifest.res' 'WhiteStarUMLManifest.rc'}

uses
  SysUtils,
  Forms,
  BasicClasses in 'BasicClasses.pas',
  Core in 'Core.pas',
  GraphicClasses in 'GraphicClasses.pas',
  ViewCore in 'ViewCore.pas',
  UMLViews in 'UMLViews.pas',
  ProjectMgr in 'ProjectMgr.pas',
  StarUMLApp in 'StarUMLApp.pas',
  Main in 'Main.pas',
  Handlers in 'Handlers.pas',
  ColEdtFrm in 'ColEdtFrm.pas' {CollectionEditorForm},
  UMLVerify in 'UMLVerify.pas',
  AboutFrm in 'AboutFrm.pas' {AboutForm},
  ElemSelFrm in 'ElemSelFrm.pas' {ElementSelectorForm},
  ClipboardMgr in 'ClipboardMgr.pas',
  UMLFacto in 'UMLFacto.pas',
  UMLAux in 'UMLAux.pas',
  DiagramEditors in 'DiagramEditors.pas',
  SelectionMgr in 'SelectionMgr.pas',
  CmdExec in 'CmdExec.pas',
  LogMgr in 'LogMgr.pas',
  UMLModels in 'UMLModels.pas',
  UMLProps in 'UMLProps.pas',
  StereoSelFrm in 'StereoSelFrm.pas' {StereotypeSelectorForm},
  ConstEdtFrm in 'ConstEdtFrm.pas' {ConstraintEditorForm},
  AttachItemEdtFrm in 'AttachItemEdtFrm.pas' {AttachmentItemEditForm},
  ConstItemEdtFrm in 'ConstItemEdtFrm.pas' {ConstraintItemEditForm},
  ProfileMgrFrm in 'ProfileMgrFrm.pas' {ProfileManagerForm},
  ElemLstFrm in 'ElemLstFrm.pas' {ElementListForm},
  ImportFrameworkFrm in 'ImportFrameworkFrm.pas' {ImportFrameworkForm},
  OptionDeps in 'OptionDeps.pas',
  ExprParsers in 'ExprParsers.pas',
  CoreAuto in 'CoreAuto.pas',
  UMLModelsAuto in 'UMLModelsAuto.pas',
  ViewCoreAuto in 'ViewCoreAuto.pas',
  UMLViewsAuto in 'UMLViewsAuto.pas',
  StarUMLAppAuto in 'StarUMLAppAuto.pas',
  FrwMgr in 'FrwMgr.pas',
  ApprMgr in 'ApprMgr.pas',
  FindFrm in 'FindFrm.pas' {FindForm},
  AddInMgrFrm in 'AddInMgrFrm.pas' {AddInMgrForm},
  ModelVerifierFrm in 'ModelVerifierFrm.pas' {ModelVerifierForm},
  AddInMgr in 'AddInMgr.pas',
  ModelExpFilterFrm in 'ModelExpFilterFrm.pas' {ModelExplorerFilterForm},
  NewProjFrm in 'NewProjFrm.pas' {NewProjFrm},
  PrintFrm in 'PrintFrm.pas' {PrintForm},
  PrintPreviewFrm in 'PrintPreviewFrm.pas' {PrintPreviewForm},
  PageSetupFrm in 'PageSetupFrm.pas' {PageSetupForm},
  SplashFrm in 'SplashFrm.pas' {SplashForm},
  LayoutDgm in 'LayoutDgm.pas',
  DocuEdt in 'DocuEdt.pas' {DocumentationEditor: TFrame},
  AttachEdt in 'AttachEdt.pas' {AttachmentEditor: TFrame},
  PropEdt in 'PropEdt.pas' {PropertyEditor: TFrame},
  OutputFrame in 'OutputFrame.pas' {OutputPanel: TFrame},
  MessageFrame in 'MessageFrame.pas' {MessagePanel: TFrame},
  ExtCore in 'ExtCore.pas',
  ExtCoreAuto in 'ExtCoreAuto.pas',
  UMLAuxAuto in 'UMLAuxAuto.pas',
  QuickDialogFrm in 'QuickDialogFrm.pas' {QuickDialogForm},
  DiagramMapFrm in 'DiagramMapFrm.pas' {DiagramMapForm},
  EventPub in 'EventPub.pas',
  HtmlHlp in 'HtmlHlp.pas',
  TagColEdtFrm in 'TagColEdtFrm.pas' {TaggedValueCollectionEditorForm},
  ComServ,
  Dialogs,
  NLS_StarUML in 'NLS_StarUML.pas',
  NLS in 'NLS.pas',
  DiagramExplorerFrame in 'DiagramExplorerFrame.pas' {DiagramExplorerPanel: TFrame},
  ModelExplorerFrame in 'ModelExplorerFrame.pas' {ModelExplorerPanel: TFrame},
  ShortenSyntaxMgr in 'ShortenSyntaxMgr.pas',
  InteractionMgr in 'InteractionMgr.pas',
  NXMgr in 'NXMgr.pas',
  ContributorMgr in 'ContributorMgr.pas',
  WorkingAreaFrm in 'WorkingAreaFrm.pas' {WorkingAreaFrame: TFrame},
  InspectorFrm in 'InspectorFrm.pas' {InspectorFrame: TFrame},
  JvclExtensions in 'JvclExtensions.pas',
  TagEdtFrm in 'TagEdtFrm.pas' {TaggedValueEditorForm},
  TagEdtFrmWithJvclInspector in 'TagEdtFrmWithJvclInspector.pas' {TaggedValueEditorFormWithJvclInspector},
  PropEdtWithJvclInspector in 'PropEdtWithJvclInspector.pas' {PropertyEditorWithJvclInspector: TFrame},
  NavBarFrame in 'NavBarFrame.pas' {PaletteNavBarFrame: TFrame},
  NavBarFrameVclImpl in 'NavBarFrameVclImpl.pas' {PaletteNavBarFrameVclImpl: TFrame},
  MenuManager in 'MenuManager.pas',
  MenuManagerTdxImpl in 'MenuManagerTdxImpl.pas',
  QuickDialogFrmTdxBase in 'QuickDialogFrmTdxBase.pas' {QuickDialogFormTdxBase},
  MainFrm in 'MainFrm.pas' {MainForm},
  WhiteStarUML_TLB in 'WhiteStarUML_TLB.pas',
  PGMR101Lib_TLB in 'PGMR101Lib_TLB.pas',
  ParserCore_TLB in 'ParserCore_TLB.pas';

{$R *.RES}
  {$R *.TLB}

const
  PERSONAL_EDITION = 'Personal';
  TRIAL_EDITION = '';
  COMMERCIAL_EDITION = '';

var
  MainInstance: PMain;

begin
  Application.Initialize;

{$IFDEF RELEASE}
  // Show Splash Form.
  if (ComServer.StartMode = smStandalone) then
  begin
    SplashForm := TSplashForm.Create(Application);
    SplashForm.Show;
    SplashForm.Repaint;
  end;
{$ENDIF RELEASE}

  Application.Title := TXT_PROGRAM_NAME;
  Application.HelpFile := '..\..\Docs\chm\WhiteStarUML.chm';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TAboutForm, AboutForm);
  Application.CreateForm(TStereotypeSelectorForm, StereotypeSelectorForm);
  Application.CreateForm(TConstraintEditorForm, ConstraintEditorForm);
  Application.CreateForm(TTaggedValueCollectionEditorForm, TaggedValueCollectionEditorForm);
  Application.CreateForm(TElementSelectorForm, ElementSelectorForm);
  Application.CreateForm(TCollectionEditorForm, CollectionEditorForm);
  Application.CreateForm(TAttachmentItemEditForm, AttachmentItemEditForm);
  Application.CreateForm(TConstraintItemEditForm, ConstraintItemEditForm);
  Application.CreateForm(TProfileManagerForm, ProfileManagerForm);
  Application.CreateForm(TElementListForm, ElementListForm);
  Application.CreateForm(TNewProjectForm, NewProjectForm);
  Application.CreateForm(TImportFrameworkForm, ImportFrameworkForm);
  Application.CreateForm(TFindForm, FindForm);
  Application.CreateForm(TAddInMgrForm, AddInMgrForm);
  Application.CreateForm(TModelVerifierForm, ModelVerifierForm);
  Application.CreateForm(TModelExplorerFilterForm, ModelExplorerFilterForm);
  Application.CreateForm(TPageSetupForm, PageSetupForm);
  Application.CreateForm(TDiagramMapForm, DiagramMapForm);
  Application.CreateForm(TPrintPreviewForm, PrintPreviewForm);
  Application.CreateForm(TPrintForm, PrintForm);
  // User defined code goes here
  Application.CreateForm(TTaggedValueEditorFormWithJvclInspector, TaggedValueEditorForm);
  if (ComServer.StartMode <> smStandalone) then
  begin
    MainForm.Visible := False;
    Application.ShowMainForm := False;
  end;

  MainInstance := PMain.Create;
  MainInstance.Initialize_BeforeMainFormShow;

  Application.Run;

  MainInstance.Finalize_AfterMainFormClose;
  MainInstance.Free;
end.
