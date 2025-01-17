inherited frmCadProdutor: TfrmCadProdutor
  Left = 423
  Top = 28
  VertScrollBar.Range = 0
  BorderStyle = bsNone
  Caption = 'Produtores'
  ClientHeight = 757
  ClientWidth = 896
  OldCreateOrder = True
  Position = poDesktopCenter
  Visible = True
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited tbPadrao: TToolBar
    Width = 896
  end
  inherited panPadrao: TPanel
    Width = 896
    Caption = 'Cadastro de Produtor'
  end
  inherited pgcPadrao: TPageControl
    Width = 896
    Height = 642
    Align = alClient
    inherited TabSheet1: TTabSheet
      inherited dbGridPadrao: TDBGrid
        Width = 888
        Height = 614
        DataSource = dtsPadrao
        Columns = <
          item
            Expanded = False
            FieldName = 'ID'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME'
            ReadOnly = True
            Title.Caption = 'Nome do Produtor'
            Width = 350
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CNPJ_CPF'
            Title.Caption = 'CNPJ ou CPF'
            Width = 200
            Visible = True
          end>
      end
    end
    inherited TabSheet2: TTabSheet
      object Label1: TLabel
        Left = 12
        Top = 16
        Width = 11
        Height = 13
        Caption = 'ID'
      end
      object Label2: TLabel
        Left = 10
        Top = 63
        Width = 86
        Height = 13
        Caption = 'Nome do Produtor'
      end
      object Label3: TLabel
        Left = 12
        Top = 105
        Width = 65
        Height = 13
        Caption = 'CNPJ ou CPF'
      end
      object btnAdicionarLimiteCredito: TSpeedButton
        Left = 421
        Top = 176
        Width = 97
        Height = 25
        Caption = 'Adicionar'
        OnClick = btnAdicionarLimiteCreditoClick
      end
      object btnExcluirLimiteCredito: TSpeedButton
        Left = 630
        Top = 176
        Width = 97
        Height = 25
        Caption = 'Excluir'
        OnClick = btnExcluirLimiteCreditoClick
      end
      object btnSalvarLimiteCredito: TSpeedButton
        Left = 527
        Top = 176
        Width = 97
        Height = 25
        Caption = 'Salvar Altera'#231#227'o'
        OnClick = btnSalvarLimiteCreditoClick
      end
      object Label5: TLabel
        Left = 3
        Top = 161
        Width = 111
        Height = 13
        Caption = 'Secione um Distribuidor'
      end
      object Label6: TLabel
        Left = 264
        Top = 160
        Width = 125
        Height = 13
        Caption = 'Informe o Limite de Cr'#233'dito'
      end
      object Panel2: TPanel
        Left = 0
        Top = 208
        Width = 888
        Height = 406
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 0
        object Label4: TLabel
          Left = 0
          Top = 0
          Width = 888
          Height = 16
          Align = alTop
          Caption = 'Limites de Cr'#233'ditos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object ScrollBox1: TScrollBox
          Left = 0
          Top = 16
          Width = 888
          Height = 390
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          TabOrder = 0
          object dbgLimtesCreditos: TDBGrid
            Left = 0
            Top = 0
            Width = 888
            Height = 359
            Align = alClient
            DataSource = dtsLimitesCredito
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'ID'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'ID_PRODUTOR'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'ID_DISTRIBUIDOR'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'NOME_DISTRIBUIDOR'
                Title.Caption = 'Nome do Distribuidor'
                Width = 300
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'LIMITE_CREDITO'
                Title.Caption = 'Limite de Cr'#233'dito'
                Visible = True
              end>
          end
          object nvLimitesCreditos: TDBNavigator
            Left = 0
            Top = 359
            Width = 888
            Height = 31
            DataSource = dtsLimitesCredito
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
            Align = alBottom
            Flat = True
            Ctl3D = False
            Hints.Strings = (
              'Primeiro'
              'Anterior'
              'Pr'#243'ximo'
              #218'ltimo'
              'Novo'
              'Excluir'
              'Editar'
              'Gravar'
              'Cancelar'
              'Atualizar')
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
          end
        end
      end
      object edtId: TDBEdit
        Left = 10
        Top = 32
        Width = 125
        Height = 21
        DataField = 'ID'
        DataSource = dtsPadrao
        ReadOnly = True
        TabOrder = 1
      end
      object edtNome: TDBEdit
        Left = 10
        Top = 77
        Width = 245
        Height = 21
        DataField = 'NOME'
        DataSource = dtsPadrao
        TabOrder = 2
      end
      object edtCnpjCpf: TDBEdit
        Left = 10
        Top = 122
        Width = 245
        Height = 21
        DataField = 'CNPJ_CPF'
        DataSource = dtsPadrao
        TabOrder = 3
      end
      object dbLkDistribuidore: TDBLookupComboBox
        Left = 0
        Top = 179
        Width = 249
        Height = 21
        KeyField = 'ID'
        ListField = 'NOME'
        ListSource = dtsDistribuidores
        TabOrder = 4
      end
      object edtLimiteCredito: TEdit
        Left = 264
        Top = 180
        Width = 127
        Height = 21
        TabOrder = 5
      end
    end
  end
  inherited Panel1: TPanel
    Width = 896
  end
  inherited dtsPadrao: TDataSource
    DataSet = dtmNegociacoes.qryProdutores
    Left = 584
  end
  object dtsLimitesCredito: TDataSource
    DataSet = dtmNegociacoes.qryLimites_Credito
    Left = 768
    Top = 75
  end
  object dtsDistribuidores: TDataSource
    DataSet = dtmNegociacoes.qryDistribuidores
    Left = 224
    Top = 283
  end
end
