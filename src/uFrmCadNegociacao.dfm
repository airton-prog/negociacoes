inherited frmCadNegociacao: TfrmCadNegociacao
  Left = 322
  Top = 116
  VertScrollBar.Range = 0
  Align = alClient
  BorderStyle = bsNone
  Caption = 'Negociacoes'
  ClientHeight = 656
  ClientWidth = 1016
  OldCreateOrder = True
  Position = poDesktopCenter
  Visible = True
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited tbPadrao: TToolBar
    Width = 1016
  end
  inherited panPadrao: TPanel
    Width = 1016
    Caption = 'Cadastro de Negocia'#231#227'o'
  end
  inherited pgcPadrao: TPageControl
    Width = 1016
    Height = 541
    Align = alClient
    inherited TabSheet1: TTabSheet
      inherited dbGridPadrao: TDBGrid
        Width = 1008
        Height = 513
        DataSource = dtsPadrao
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        Columns = <
          item
            Expanded = False
            FieldName = 'ID'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ID_PRODUTOR'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ID_DISTRIBUIDOR'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VLR_TOTAL'
            Title.Caption = 'Valor da Negociacao'
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'STATUS'
            Width = 80
            Visible = True
          end>
      end
    end
    inherited TabSheet2: TTabSheet
      object Label1: TLabel
        Left = 24
        Top = 8
        Width = 11
        Height = 13
        Caption = 'ID'
      end
      object Label2: TLabel
        Left = 152
        Top = 8
        Width = 107
        Height = 13
        Caption = 'Selecione um Produtor'
      end
      object Label3: TLabel
        Left = 402
        Top = 8
        Width = 119
        Height = 13
        Caption = 'Selecione um Distribuidor'
      end
      object Label4: TLabel
        Left = 16
        Top = 56
        Width = 200
        Height = 24
        Caption = 'Total da Negocia'#231#227'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object txtTotalNegociacao: TDBText
        Left = 220
        Top = 57
        Width = 180
        Height = 24
        AutoSize = True
        DataField = 'TOTALITENS'
        DataSource = dtsItens
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 670
        Top = 56
        Width = 165
        Height = 24
        Caption = 'Limite de Cr'#233'dito:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object txtLimiteCredito: TDBText
        Left = 838
        Top = 56
        Width = 144
        Height = 24
        AutoSize = True
        DataField = 'LIMITE_CREDITO'
        DataSource = dtsLimiteCredito
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 670
        Top = 107
        Width = 66
        Height = 24
        Caption = 'Saldo: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label10: TLabel
        Left = 670
        Top = 80
        Width = 235
        Height = 24
        Caption = 'Negocia'#231#245'es Aprovadas:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object txtNegociacoesAprovadas: TDBText
        Left = 906
        Top = 81
        Width = 244
        Height = 24
        AutoSize = True
        DataField = 'TOTAL_NEGOCIACOES'
        DataSource = dtsTotalizarNegociacoes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object txtStatus: TDBText
        Left = 735
        Top = 23
        Width = 169
        Height = 17
        DataField = 'STATUS'
        DataSource = dtsPadrao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label11: TLabel
        Left = 670
        Top = 24
        Width = 59
        Height = 20
        Caption = 'Status:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbLkProdutor: TDBLookupComboBox
        Left = 152
        Top = 24
        Width = 217
        Height = 21
        DataField = 'ID_PRODUTOR'
        DataSource = dtsPadrao
        KeyField = 'ID'
        ListField = 'NOME'
        ListSource = dtsProdutores
        TabOrder = 0
      end
      object edtID: TDBEdit
        Left = 16
        Top = 24
        Width = 89
        Height = 21
        DataField = 'ID'
        DataSource = dtsPadrao
        Enabled = False
        TabOrder = 1
      end
      object dbLkDistribuidor: TDBLookupComboBox
        Left = 400
        Top = 24
        Width = 233
        Height = 21
        DataField = 'ID_DISTRIBUIDOR'
        DataSource = dtsPadrao
        KeyField = 'ID'
        ListField = 'NOME'
        ListSource = dtsDistribuidores
        TabOrder = 2
      end
      object Panel2: TPanel
        Left = 0
        Top = 175
        Width = 1008
        Height = 338
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 3
        object ScrollBox1: TScrollBox
          Left = 0
          Top = 0
          Width = 1008
          Height = 338
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          TabOrder = 0
          object dbgItens: TDBGrid
            Left = 0
            Top = 0
            Width = 1008
            Height = 338
            Align = alClient
            DataSource = dtsItens
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'ID_NEGOCIACAO'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'ID_PRODUTO'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'NOME_PRODUTO'
                Width = 300
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'QUANTIDADE'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VLR_UNITARIO'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TOTAL'
                Visible = True
              end>
          end
        end
      end
      object txtSaldo: TStaticText
        Left = 734
        Top = 107
        Width = 18
        Height = 33
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -24
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
      end
      object Panel3: TPanel
        Left = 0
        Top = 109
        Width = 1008
        Height = 66
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 5
        object Label5: TLabel
          Left = 11
          Top = 16
          Width = 104
          Height = 13
          Caption = 'Selecione um Produto'
        end
        object Label6: TLabel
          Left = 161
          Top = 16
          Width = 55
          Height = 13
          Caption = 'Quantidade'
        end
        object Label7: TLabel
          Left = 297
          Top = 16
          Width = 63
          Height = 13
          Caption = 'Valor Unit'#225'rio'
        end
        object btnAdicionarItem: TSpeedButton
          Left = 431
          Top = 27
          Width = 87
          Height = 26
          Caption = 'Adicionar'
          OnClick = btnAdicionarItemClick
        end
        object btnExcluirItem: TSpeedButton
          Left = 624
          Top = 27
          Width = 87
          Height = 26
          Caption = 'Excluir'
          OnClick = btnExcluirItemClick
        end
        object dbLkProduto: TDBLookupComboBox
          Left = 8
          Top = 32
          Width = 145
          Height = 21
          KeyField = 'ID'
          ListField = 'NOME'
          ListSource = dtsProdutos
          TabOrder = 0
          OnCloseUp = dbLkProdutoCloseUp
        end
        object edtQuantidade: TEdit
          Left = 160
          Top = 32
          Width = 121
          Height = 21
          TabOrder = 1
        end
        object edtVlrUnitario: TEdit
          Left = 296
          Top = 32
          Width = 121
          Height = 21
          TabOrder = 2
        end
        object btnSalvarItem: TButton
          Left = 528
          Top = 27
          Width = 87
          Height = 26
          Caption = 'Salvar Altera'#231#227'o'
          TabOrder = 3
          OnClick = btnSalvarItemClick
        end
      end
    end
  end
  inherited Panel1: TPanel
    Width = 1016
  end
  inherited ActionList1: TActionList
    Left = 672
  end
  inherited dtsPadrao: TDataSource
    DataSet = dtmNegociacoes.qryNegociacoes
    OnDataChange = dtsPadraoDataChange
    Left = 576
  end
  object dtsProdutores: TDataSource
    DataSet = dtmNegociacoes.qryProdutores
    Left = 460
    Top = 115
  end
  object dtsDistribuidores: TDataSource
    DataSet = dtmNegociacoes.qryDistribuidores
    Left = 548
    Top = 115
  end
  object dtsProdutos: TDataSource
    DataSet = dtmNegociacoes.qryProdutos
    Left = 332
    Top = 116
  end
  object dtsLimiteCredito: TDataSource
    DataSet = dtmNegociacoes.qryLimiteCredito
    Left = 800
    Top = 75
  end
  object dtsItens: TDataSource
    DataSet = dtmNegociacoes.cdtsItens
    Left = 944
    Top = 72
  end
  object dtsTotalizarNegociacoes: TDataSource
    DataSet = dtmNegociacoes.qryTotalizarNegociacoes
    Left = 864
    Top = 75
  end
end
