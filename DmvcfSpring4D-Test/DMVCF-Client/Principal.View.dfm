object Form5: TForm5
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Form5'
  ClientHeight = 452
  ClientWidth = 469
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
  object lbl2: TLabel
    Left = 8
    Top = 256
    Width = 20
    Height = 13
    Caption = 'LOG'
  end
  object dbgrd1: TDBGrid
    Left = 8
    Top = 82
    Width = 449
    Height = 159
    Align = alCustom
    DataSource = dsPessoa
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object btn1: TButton
    Left = 8
    Top = 51
    Width = 265
    Height = 25
    Caption = 'Conect and Open/Convert for DATASET'
    TabOrder = 1
    OnClick = btn1Click
  end
  object edtPort: TEdit
    Left = 8
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 2
    Text = '8080'
  end
  object mmo1: TMemo
    Left = 8
    Top = 275
    Width = 449
    Height = 167
    TabOrder = 3
  end
  object btn2: TButton
    Left = 288
    Top = 51
    Width = 169
    Height = 25
    Caption = 'Print FAST Report'
    TabOrder = 4
    OnClick = btn2Click
  end
  object dsPessoa: TDataSource
    DataSet = DtsPessoa
    Left = 232
    Top = 8
  end
  object DtsPessoa: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 176
    Top = 8
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
  object frxReport1: TfrxReport
    Version = '5.3.14'
    DataSet = frxDBDataset1
    DataSetName = 'frxDadosPessoa'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42857.946331446800000000
    ReportOptions.LastChange = 42857.960462673610000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 296
    Top = 8
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDadosPessoa'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 41.574830000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        RowCount = 0
        object frxDadosPessoaid: TfrxMemoView
          Left = 7.559060000000000000
          Top = 4.559059999999999000
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          DataField = 'id'
          DataSet = frxDBDataset1
          DataSetName = 'frxDadosPessoa'
          Memo.UTF8W = (
            '[frxDadosPessoa."id"]')
        end
        object frxDadosPessoacpfcnpj: TfrxMemoView
          Left = 544.252320000000100000
          Top = 5.677180000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          DataField = 'cpfcnpj'
          DataSet = frxDBDataset1
          DataSetName = 'frxDadosPessoa'
          Memo.UTF8W = (
            '[frxDadosPessoa."cpfcnpj"]')
        end
        object frxDadosPessoanome: TfrxMemoView
          Left = 138.063080000000000000
          Top = 5.118120000000001000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          DataField = 'nome'
          DataSet = frxDBDataset1
          DataSetName = 'frxDadosPessoa'
          Memo.UTF8W = (
            '[frxDadosPessoa."nome"]')
        end
      end
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDadosPessoa'
    CloseDataSource = False
    FieldAliases.Strings = (
      'id=id'
      'nome=nome'
      'cpfcnpj=cpfcnpj'
      'endereco_id=endereco_id')
    DataSource = dsPessoa
    BCDToCurrency = False
    Left = 360
    Top = 8
  end
end
