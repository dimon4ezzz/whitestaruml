object NewFolderForm: TNewFolderForm
  Left = 373
  Top = 263
  BorderStyle = bsDialog
  Caption = 'New Folder'
  ClientHeight = 77
  ClientWidth = 277
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = 14
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object HeaderLabel: TLabel
    Left = 8
    Top = 16
    Width = 72
    Height = 14
    Caption = '&Folder Name:'
  end
  object FolderNameEdit: TEdit
    Left = 88
    Top = 12
    Width = 177
    Height = 22
    TabOrder = 0
    OnChange = FolderNameEditChange
  end
  object AcceptButton: TButton
    Left = 80
    Top = 46
    Width = 90
    Height = 23
    Caption = '&OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
  object CancelButton: TButton
    Left = 175
    Top = 46
    Width = 90
    Height = 23
    Cancel = True
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 2
  end
end
