object Form5: TForm5
  Left = 0
  Top = 0
  Caption = 'Form5'
  ClientHeight = 306
  ClientWidth = 1068
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 16
    Top = 5
    Width = 20
    Height = 13
    Caption = 'Port'
  end
  object btnStart: TButton
    Left = 16
    Top = 51
    Width = 75
    Height = 25
    Caption = 'Conectar'
    TabOrder = 0
    OnClick = btnStartClick
  end
  object dbgrd1: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 94
    Width = 1062
    Height = 209
    Align = alBottom
    DataSource = dsPessoa
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object btn1: TButton
    Left = 97
    Top = 51
    Width = 176
    Height = 25
    Caption = 'Abrir/Converter para DATASET'
    TabOrder = 2
    OnClick = btn1Click
  end
  object edtPort: TEdit
    Left = 8
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 3
    Text = '8080'
  end
  object dsPessoa: TDataSource
    DataSet = DtsPessoa
    Left = 576
    Top = 40
  end
  object DtsPessoa: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 464
    Top = 40
    object DtsPessoaid: TIntegerField
      FieldName = 'id'
    end
    object DtsPessoanome: TStringField
      FieldName = 'nome'
      Size = 100
    end
    object DtsPessoacpfcnpj: TStringField
      FieldName = 'cpfcnpj'
      Size = 50
    end
    object DtsPessoaendereco_id: TIntegerField
      FieldName = 'endereco_id'
    end
  end
end
