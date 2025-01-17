object frmConsultarNegociacoes: TfrmConsultarNegociacoes
  Left = 540
  Top = 150
  BorderStyle = bsDialog
  Caption = 'Consultar Negocia'#231#245'es'
  ClientHeight = 300
  ClientWidth = 495
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 76
    Width = 109
    Height = 13
    Caption = 'Selecione Um Produtor'
  end
  object Label2: TLabel
    Left = 252
    Top = 78
    Width = 121
    Height = 13
    Caption = 'Selecione Um Distribuidor'
  end
  object btnImprimir: TSpeedButton
    Left = 16
    Top = 247
    Width = 177
    Height = 41
    Caption = 'Imprimir'
    OnClick = btnImprimirClick
  end
  object btnLimparFiltros: TSpeedButton
    Left = 282
    Top = 246
    Width = 177
    Height = 41
    Caption = 'Limpar Filtros'
    OnClick = btnLimparFiltrosClick
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 495
    Height = 49
    Align = alTop
    Caption = 'Consultar Negocia'#231#245'es'
    Color = clGreen
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object rgStatusNecociacao: TRadioGroup
    Left = 12
    Top = 134
    Width = 449
    Height = 81
    Caption = 'Status da Negocia'#231#227'o'
    Columns = 4
    ItemIndex = 4
    Items.Strings = (
      'PENDENTE'
      'APROVADA'
      'CONCLUIR'
      'CANCELADA'
      'TODOS')
    TabOrder = 1
  end
  object dbLkProdutor: TDBLookupComboBox
    Left = 16
    Top = 92
    Width = 210
    Height = 21
    KeyField = 'ID'
    ListField = 'NOME'
    ListSource = dtsProdutor
    TabOrder = 2
  end
  object dbLkDistribuidor: TDBLookupComboBox
    Left = 250
    Top = 94
    Width = 210
    Height = 21
    KeyField = 'ID'
    ListField = 'NOME'
    ListSource = dtsDistribuidor
    TabOrder = 3
  end
  object dtsProdutor: TDataSource
    DataSet = dtmNegociacoes.qryProdutores
    Left = 16
    Top = 48
  end
  object dtsDistribuidor: TDataSource
    DataSet = dtmNegociacoes.qryDistribuidores
    Left = 424
    Top = 64
  end
  object RvNegociacoes: TRvProject
    ProjectFile = 
      'E:\Arquivos\Documentos\siagri\aquivos\Projeto\Relatorio\Negociac' +
      'oes.rav'
    Left = 336
    Top = 160
  end
  object RvQryNegociacoes: TRvQueryConnection
    RuntimeVisibility = rtDeveloper
    Query = dtmNegociacoes.qryConsultarNegociacoes
    Left = 408
    Top = 152
  end
  object RvRenderPDF1: TRvRenderPDF
    DisplayName = 'Adobe Acrobat (PDF)'
    FileExtension = '*.pdf'
    EmbedFonts = False
    ImageQuality = 90
    MetafileDPI = 300
    FontEncoding = feWinAnsiEncoding
    DocInfo.Creator = 'Rave (http://www.nevrona.com/rave)'
    DocInfo.Producer = 'Nevrona Designs'
    Left = 232
    Top = 232
  end
end
