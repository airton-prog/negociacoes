inherited frmCadDistribuidor: TfrmCadDistribuidor
  Top = 142
  VertScrollBar.Range = 0
  BorderStyle = bsNone
  Caption = 'Distribuidores'
  ClientHeight = 513
  OldCreateOrder = True
  Position = poDesktopCenter
  Visible = True
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited panPadrao: TPanel
    Height = 454
    Align = alClient
    Caption = 'Cadastro de Distribuidores'
  end
  inherited pgcPadrao: TPageControl
    Top = 59
    Height = 454
    Align = alClient
    inherited TabSheet1: TTabSheet
      inherited dbGridPadrao: TDBGrid
        Height = 426
        DataSource = dtsPadrao
      end
    end
    inherited TabSheet2: TTabSheet
      object Label1: TLabel
        Left = 9
        Top = 16
        Width = 11
        Height = 13
        Caption = 'ID'
      end
      object Label2: TLabel
        Left = 8
        Top = 64
        Width = 98
        Height = 13
        Caption = 'Nome do Distribuidor'
      end
      object Label3: TLabel
        Left = 8
        Top = 116
        Width = 65
        Height = 13
        Caption = 'CNPJ ou CPF'
      end
      object edtId: TDBEdit
        Left = 8
        Top = 32
        Width = 97
        Height = 21
        DataField = 'ID'
        DataSource = dtsPadrao
        TabOrder = 0
      end
      object edtNome: TDBEdit
        Left = 8
        Top = 80
        Width = 233
        Height = 21
        DataField = 'NOME'
        DataSource = dtsPadrao
        TabOrder = 1
      end
      object edtCnpjCpf: TDBEdit
        Left = 8
        Top = 132
        Width = 233
        Height = 21
        DataField = 'CNPJ_CPF'
        DataSource = dtsPadrao
        TabOrder = 2
      end
    end
  end
  inherited dtsPadrao: TDataSource
    DataSet = dtmNegociacoes.qryDistribuidores
    Left = 576
  end
end
