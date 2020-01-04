inherited frmCadProduto: TfrmCadProduto
  VertScrollBar.Range = 0
  Align = alClient
  BorderStyle = bsNone
  Caption = 'Produtos'
  OldCreateOrder = True
  Position = poDesktopCenter
  Visible = True
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited panPadrao: TPanel
    Top = 66
    Caption = 'Cadastro de Produto'
  end
  inherited pgcPadrao: TPageControl
    Top = 122
    Align = alClient
    inherited TabSheet1: TTabSheet
      inherited dbGridPadrao: TDBGrid
        DataSource = dtsPadrao
      end
    end
    inherited TabSheet2: TTabSheet
      object Label1: TLabel
        Left = 19
        Top = 16
        Width = 11
        Height = 13
        Caption = 'ID'
      end
      object Label2: TLabel
        Left = 16
        Top = 72
        Width = 83
        Height = 13
        Caption = 'Nome do Produto'
      end
      object Label3: TLabel
        Left = 16
        Top = 128
        Width = 77
        Height = 13
        Caption = 'Pre'#231'o de Venda'
      end
      object edtId: TDBEdit
        Left = 16
        Top = 32
        Width = 121
        Height = 21
        DataField = 'ID'
        DataSource = dtsPadrao
        TabOrder = 0
      end
      object edtNome: TDBEdit
        Left = 16
        Top = 88
        Width = 121
        Height = 21
        DataField = 'NOME'
        DataSource = dtsPadrao
        TabOrder = 1
      end
      object edtCnpjCpf: TDBEdit
        Left = 16
        Top = 144
        Width = 121
        Height = 21
        DataField = 'PRECO_VENDA'
        DataSource = dtsPadrao
        TabOrder = 2
      end
    end
  end
  inherited Panel1: TPanel
    Height = 17
    BevelOuter = bvNone
  end
  inherited dtsPadrao: TDataSource
    DataSet = dtmNegociacoes.qryProdutos
  end
end
