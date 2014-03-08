unit InputBox;

{$R InputBox.dcr}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TInputBoxForm = class(TForm)
    CaptionLabel: TLabel;
    OkButton: TButton;
    CancelButton: TButton;
    ValueEdit: TEdit;
  private
    function GetInfoCaption: string;
    procedure SetInfoCaption(Value: string);
    function GetTitle: string;
    procedure SetTitle(Value: string);
    function GetValue: string;
    procedure SetValue(Value: string);
    function GetOKButtonCaption: string;
    procedure SetOKButtonCaption(Value: string);
    function GetCancelButtonCaption: string;
    procedure SetCancelButtonCaption(Value: string);
    procedure RealignForm;
  public
    property InfoCaption: string read GetInfoCaption write SetInfoCaption;
    property Title: string read GetTitle write SetTitle;
    property Value: string read GetValue write SetValue;
    property OKButtonCaption: string read GetOKButtonCaption
                                     write SetOKButtonCaption;
    property CancelButtonCaption: string read GetCancelButtonCaption
                                     write SetCancelButtonCaption;
  end;

  TInputBox = class(TComponent)
  private
    InputBoxForm: TInputBoxForm;
    function GetCaption: string;
    procedure SetCaption(Value: string);
    function GetTitle: string;
    procedure SetTitle(Value: string);
    function GetValue: string;
    procedure SetValue(Value: string);
    function GetOKButtonCaption: string;
    procedure SetOKButtonCaption(Value: string);
    function GetCancelButtonCaption: string;
    procedure SetCancelButtonCaption(Value: string);
  public
    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;
    function Execute: Boolean;
  published
    property Name;
    property Tag;
    property Caption: string read GetCaption write SetCaption;
    property Title: string read GetTitle write SetTitle;
    property Value: string read GetValue write SetValue;
    property OKButtonCaption: string read GetOKButtonCaption
                                     write SetOKButtonCaption;
    property CancelButtonCaption: string read GetCancelButtonCaption
                                     write SetCancelButtonCaption;
  end;

  procedure Register;  

implementation

{$R *.dfm}

procedure Register;
begin
  RegisterComponents('PlasticComponents', [TInputBox]);
end;

function TInputBoxForm.GetInfoCaption: string;
begin
  Result := CaptionLabel.Caption;
end;

procedure TInputBoxForm.SetInfoCaption(Value: string);
begin
  CaptionLabel.Caption := Value;
  RealignForm;
end;

function TInputBoxForm.GetTitle: string;
begin
  Result := Caption;
end;

procedure TInputBoxForm.SetTitle(Value: string);
begin
  Caption := Value;
end;

function TInputBoxForm.GetValue: string;
begin
  Result := ValueEdit.Text;
end;

procedure TInputBoxForm.SetValue(Value: string);
begin
  ValueEdit.Text := Value;
end;

function TInputBoxForm.GetOKButtonCaption: string;
begin
  Result := OkButton.Caption;
end;

procedure TInputBoxForm.SetOKButtonCaption(Value: string);
begin
  OkButton.Caption := Value;
end;

function TInputBoxForm.GetCancelButtonCaption: string;
begin
  Result := CancelButton.Caption;
end;

procedure TInputBoxForm.SetCancelButtonCaption(Value: string);
begin
  CancelButton.Caption := Value;
end;

procedure TInputBoxForm.RealignForm;
begin
  ValueEdit.Top := CaptionLabel.Top + CaptionLabel.Height + 7;
  OkButton.Top := ValueEdit.Top + ValueEdit.Height + 12;
  CancelButton.Top := OkButton.Top;
  ClientHeight := OkButton.Top + OkButton.Height + 8; 
end;

procedure TInputBox.AfterConstruction;
begin
  inherited;
  InputBoxForm := TInputBoxForm.Create(nil);
end;

procedure TInputBox.BeforeDestruction;
begin
  InputBoxForm.Free;
  inherited;
end;

function TInputBox.GetCaption: string;
begin
  Result := InputBoxForm.InfoCaption;
end;

procedure TInputBox.SetCaption(Value: string);
begin
  InputBoxForm.InfoCaption := Value;
end;

function TInputBox.GetTitle: string;
begin
  Result := InputBoxForm.Title;
end;

procedure TInputBox.SetTitle(Value: string);
begin
  InputBoxForm.Title := Value;
end;

function TInputBox.GetValue: string;
begin
  Result := InputBoxForm.Value;
end;

procedure TInputBox.SetValue(Value: string);
begin
  InputBoxForm.Value := Value;
end;

function TInputBox.GetOKButtonCaption: string;
begin
  Result := InputBoxForm.OKButtonCaption;
end;

procedure TInputBox.SetOKButtonCaption(Value: string);
begin
  InputBoxForm.OKButtonCaption := Value;
end;

function TInputBox.GetCancelButtonCaption: string;
begin
  Result := InputBoxForm.CancelButtonCaption;
end;

procedure TInputBox.SetCancelButtonCaption(Value: string);
begin
  InputBoxForm.CancelButtonCaption := Value;
end;

function TInputBox.Execute: Boolean;
begin
  Result := (InputBoxForm.ShowModal = mrOk);
end;

end.
