object BatchSelectionForm: TBatchSelectionForm
  Left = 419
  Top = 273
  BorderStyle = bsDialog
  Caption = 'Select Batch'
  ClientHeight = 218
  ClientWidth = 242
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #44404#47548
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object TitleLabel: TLabel
    Left = 8
    Top = 8
    Width = 225
    Height = 14
    Caption = 'Select the Batch for item to be inserted.'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = 14
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Bevel: TBevel
    Left = 8
    Top = 176
    Width = 225
    Height = 9
    Shape = bsTopLine
  end
  object BatchesListBox: TListBox
    Left = 8
    Top = 32
    Width = 225
    Height = 137
    ImeName = 'Microsoft IME 2003'
    ItemHeight = 12
    TabOrder = 0
    OnClick = BatchesListBoxClick
    OnKeyDown = BatchesListBoxKeyDown
  end
  object AcceptButton: TButton
    Left = 44
    Top = 188
    Width = 90
    Height = 23
    Caption = '&OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
  object CancelButton: TButton
    Left = 140
    Top = 188
    Width = 90
    Height = 23
    Cancel = True
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 2
  end
end
