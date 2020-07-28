object Form2: TForm2
  Left = 284
  Height = 169
  Top = 500
  Width = 383
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Neue Gruppe'
  ClientHeight = 169
  ClientWidth = 383
  Color = clCream
  OnShow = FormShow
  LCLVersion = '7.2'
  object EdtID: TcyEdit
    Left = 120
    Height = 22
    Top = 16
    Width = 88
    NumbersOnly = True
    ReadOnly = True
    TabOrder = 0
    CharRules = <>
  end
  object cyLabel1: TcyLabel
    Left = 24
    Height = 17
    Top = 21
    Width = 89
    AutoSize = False
    Caption = 'Gruppen-ID:'
    Transparent = False
    Bevels = <>
    Degrade.FromColor = clCream
    Degrade.SpeedPercent = 100
    Degrade.ToColor = clCream
  end
  object cyLabel2: TcyLabel
    Left = 24
    Height = 17
    Top = 56
    Width = 89
    AutoSize = False
    Caption = 'Bezeichnung: '
    Transparent = False
    Bevels = <>
    Degrade.FromColor = clCream
    Degrade.SpeedPercent = 100
    Degrade.ToColor = clCream
  end
  object EdtName: TcyEdit
    Left = 120
    Height = 22
    Top = 51
    Width = 224
    TabOrder = 1
    CharRules = <>
  end
  object BtnOK: TButton
    Left = 24
    Height = 25
    Top = 112
    Width = 75
    Caption = 'OK'
    Default = True
    ModalResult = 1
    OnClick = BtnOKClick
    TabOrder = 2
  end
  object BtnAbbruch: TButton
    Left = 112
    Height = 25
    Top = 112
    Width = 88
    Caption = 'Abbrechen'
    ModalResult = 2
    OnClick = BtnAbbruchClick
    TabOrder = 3
  end
end
