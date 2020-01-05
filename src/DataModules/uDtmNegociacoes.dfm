object dtmNegociacoes: TdtmNegociacoes
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 777
  Top = 139
  Height = 486
  Width = 672
  object dbNegociacoes: TDatabase
    DatabaseName = 'NEGOCIACOES.FDB'
    DriverName = 'INTRBASE'
    LoginPrompt = False
    Params.Strings = (
      'SERVER NAME='
      'USER NAME=SYSDBA'
      'OPEN MODE=READ/WRITE'
      'SCHEMA CACHE SIZE=8'
      'LANGDRIVER='
      'SQLQRYMODE='
      'SQLPASSTHRU MODE=SHARED AUTOCOMMIT'
      'SCHEMA CACHE TIME=-1'
      'MAX ROWS=-1'
      'BATCH COUNT=200'
      'ENABLE SCHEMA CACHE=FALSE'
      'SCHEMA CACHE DIR='
      'ENABLE BCD=FALSE'
      'BLOBS TO CACHE=64'
      'BLOB SIZE=32'
      'WAIT ON LOCKS=FALSE'
      'COMMIT RETAIN=FALSE'
      'ROLE NAME='
      'PASSWORD=masterkey')
    SessionName = 'Default'
    BeforeConnect = dbNegociacoesBeforeConnect
    Left = 48
    Top = 24
  end
  object qryProdutores: TQuery
    AutoRefresh = True
    DatabaseName = 'NEGOCIACOES.FDB'
    RequestLive = True
    SQL.Strings = (
      'SELECT '
      'PRODUTORES.ID,'
      'PRODUTORES.NOME,'
      'PRODUTORES.CNPJ_CPF'
      'FROM PRODUTORES'
      'ORDER BY PRODUTORES.ID')
    Left = 160
    Top = 24
    object qryProdutoresID: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID'
      Origin = '"AVALIACAO.FDB".PRODUTORES.ID'
      ReadOnly = True
      Required = True
    end
    object qryProdutoresNOME: TStringField
      FieldName = 'NOME'
      Origin = '"AVALIACAO.FDB".PRODUTORES.NOME'
      Size = 100
    end
    object qryProdutoresCNPJ_CPF: TStringField
      FieldName = 'CNPJ_CPF'
      Origin = '"AVALIACAO.FDB".PRODUTORES.CNPJ_CPF'
      Size = 100
    end
  end
  object qryDistribuidores: TQuery
    AutoRefresh = True
    DatabaseName = 'NEGOCIACOES.FDB'
    RequestLive = True
    SQL.Strings = (
      'SELECT'
      'ID,       '
      'NOME,     '
      'CNPJ_CPF '
      'FROM DISTRIBUIDORES')
    Left = 304
    Top = 16
    object qryDistribuidoresID: TIntegerField
      FieldName = 'ID'
      Origin = '"AVALIACAO.FDB".DISTRIBUIDORES.ID'
    end
    object qryDistribuidoresNOME: TStringField
      FieldName = 'NOME'
      Origin = '"AVALIACAO.FDB".DISTRIBUIDORES.NOME'
      Size = 100
    end
    object qryDistribuidoresCNPJ_CPF: TStringField
      FieldName = 'CNPJ_CPF'
      Origin = '"AVALIACAO.FDB".DISTRIBUIDORES.CNPJ_CPF'
      Size = 14
    end
  end
  object qryProdutos: TQuery
    DatabaseName = 'NEGOCIACOES.FDB'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM PRODUTOS')
    Left = 424
    Top = 16
    object qryProdutosID: TIntegerField
      FieldName = 'ID'
      Origin = '"AVALIACAO.FDB".PRODUTOS.ID'
    end
    object qryProdutosNOME: TStringField
      FieldName = 'NOME'
      Origin = '"AVALIACAO.FDB".PRODUTOS.NOME'
      Size = 100
    end
    object qryProdutosPRECO_VENDA: TFloatField
      FieldName = 'PRECO_VENDA'
      Origin = '"AVALIACAO.FDB".PRODUTOS.PRECO_VENDA'
    end
  end
  object qryNegociacoes: TQuery
    BeforePost = qryNegociacoesBeforePost
    AutoRefresh = True
    DatabaseName = 'NEGOCIACOES.FDB'
    RequestLive = True
    SQL.Strings = (
      'SELECT'
      'ID,'
      'ID_PRODUTOR,'
      'ID_DISTRIBUIDOR,'
      'VLR_TOTAL,'
      'STATUS,'
      'DT_CADASTRO,'
      'DT_APROVACAO,'
      'DT_CONCLUSAO,'
      'DT_CANCELAMENTO          '
      'FROM NEGOCIACOES'
      '')
    Left = 112
    Top = 80
    object qryNegociacoesID: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID'
      Origin = '"NEGOCIACOES.FDB".NEGOCIACOES.ID'
      ReadOnly = True
      Required = True
    end
    object qryNegociacoesID_PRODUTOR: TIntegerField
      FieldName = 'ID_PRODUTOR'
      Origin = '"NEGOCIACOES.FDB".NEGOCIACOES.ID_PRODUTOR'
    end
    object qryNegociacoesID_DISTRIBUIDOR: TIntegerField
      FieldName = 'ID_DISTRIBUIDOR'
      Origin = '"NEGOCIACOES.FDB".NEGOCIACOES.ID_DISTRIBUIDOR'
    end
    object qryNegociacoesVLR_TOTAL: TFloatField
      FieldName = 'VLR_TOTAL'
      Origin = '"NEGOCIACOES.FDB".NEGOCIACOES.VLR_TOTAL'
      currency = True
    end
    object qryNegociacoesSTATUS: TStringField
      DisplayWidth = 9
      FieldName = 'STATUS'
      Origin = '"NEGOCIACOES.FDB".NEGOCIACOES.STATUS'
      Size = 9
    end
    object qryNegociacoesDT_CADASTRO: TDateTimeField
      FieldName = 'DT_CADASTRO'
    end
  end
  object qryStatusNegociacao: TQuery
    DatabaseName = 'NEGOCIACOES.FDB'
    Left = 424
    Top = 80
  end
  object qryGravarDataAlteracao: TQuery
    DatabaseName = 'NEGOCIACOES.FDB'
    Left = 576
    Top = 80
  end
  object qryTotalizarNegociacao: TQuery
    DatabaseName = 'NEGOCIACOES.FDB'
    Left = 112
    Top = 144
  end
  object qryInserirItensNegociacao: TQuery
    DatabaseName = 'NEGOCIACOES.FDB'
    SQL.Strings = (
      '')
    Left = 576
    Top = 152
    object qryInserirItensNegociacaoTOTAL_NEGOCIACOES: TFloatField
      FieldName = 'TOTAL_NEGOCIACOES'
    end
  end
  object qryLimiteCredito: TQuery
    DatabaseName = 'NEGOCIACOES.FDB'
    RequestLive = True
    SQL.Strings = (
      'SELECT'
      'LIMITE_CREDITO'
      'FROM LIMITES_CREDITOS'
      'WHERE ID_PRODUTOR = :ID_PRODUTOR AND'
      'ID_DISTRIBUIDOR = :ID_DISTRIBUIDOR;')
    Left = 304
    Top = 88
    ParamData = <
      item
        DataType = ftString
        Name = 'ID_PRODUTOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ID_DISTRIBUIDOR'
        ParamType = ptUnknown
      end>
    object qryLimiteCreditoLIMITE_CREDITO: TFloatField
      FieldName = 'LIMITE_CREDITO'
      Origin = '"AVALIACAO.FDB".LIMITES_CREDITOS.LIMITE_CREDITO'
      currency = True
    end
  end
  object qryTotalizarNegociacoes: TQuery
    DatabaseName = 'NEGOCIACOES.FDB'
    SQL.Strings = (
      'SELECT'
      'SUM(NEGOCIACOES.vlr_total) as TOTAL_NEGOCIACOES'
      'from'
      'NEGOCIACOES'
      'WHERE NEGOCIACOES.status = '#39'APROVADA'#39' AND'
      'NEGOCIACOES.id_produtor  = :ID_PRODUTOR AND'
      'NEGOCIACOES.id_distribuidor = :ID_DISTRIBUIDOR')
    Left = 424
    Top = 152
    ParamData = <
      item
        DataType = ftString
        Name = 'ID_PRODUTOR'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'ID_DISTRIBUIDOR'
        ParamType = ptUnknown
        Value = '0'
      end>
    object qryTotalizarNegociacoesTOTAL_NEGOCIACOES: TFloatField
      FieldName = 'TOTAL_NEGOCIACOES'
    end
  end
  object qryConsultarNegociacoes: TQuery
    DatabaseName = 'NEGOCIACOES.FDB'
    SQL.Strings = (
      'SELECT'
      'NEGOCIACOES.ID,'
      'PRODUTORES.NOME AS PRODUTOR,'
      'DISTRIBUIDORES.NOME AS DISTRIBUIDOR,'
      'NEGOCIACOES.DT_CADASTRO,'
      'NEGOCIACOES.DT_APROVACAO,'
      'NEGOCIACOES.DT_CONCLUSAO,'
      'NEGOCIACOES.DT_CANCELAMENTO,'
      'NEGOCIACOES.VLR_TOTAL,'
      'NEGOCIACOES.STATUS'
      'FROM'
      'NEGOCIACOES'
      
        'INNER JOIN PRODUTORES ON (NEGOCIACOES.ID_PRODUTOR = PRODUTORES.I' +
        'D)'
      
        'INNER JOIN DISTRIBUIDORES ON (NEGOCIACOES.ID_DISTRIBUIDOR = DIST' +
        'RIBUIDORES.ID)'
      '')
    Left = 112
    Top = 213
    object qryConsultarNegociacoesID: TIntegerField
      FieldName = 'ID'
    end
    object qryConsultarNegociacoesPRODUTOR: TStringField
      FieldName = 'PRODUTOR'
      Size = 100
    end
    object qryConsultarNegociacoesDISTRIBUIDOR: TStringField
      FieldName = 'DISTRIBUIDOR'
      Size = 100
    end
    object qryConsultarNegociacoesDT_CADASTRO: TDateTimeField
      FieldName = 'DT_CADASTRO'
    end
    object qryConsultarNegociacoesDT_APROVACAO: TDateTimeField
      FieldName = 'DT_APROVACAO'
    end
    object qryConsultarNegociacoesDT_CONCLUSAO: TDateTimeField
      FieldName = 'DT_CONCLUSAO'
    end
    object qryConsultarNegociacoesDT_CANCELAMENTO: TDateTimeField
      FieldName = 'DT_CANCELAMENTO'
    end
    object qryConsultarNegociacoesVLR_TOTAL: TFloatField
      FieldName = 'VLR_TOTAL'
      currency = True
    end
    object qryConsultarNegociacoesSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 9
    end
  end
  object qryLimites_Credito: TQuery
    AutoRefresh = True
    DatabaseName = 'NEGOCIACOES.FDB'
    DataSource = frmCadProdutor.dtsPadrao
    RequestLive = True
    SQL.Strings = (
      'SELECT '
      'ID,               '
      'ID_PRODUTOR,      '
      'ID_DISTRIBUIDOR,  '
      'LIMITE_CREDITO '
      'FROM LIMITES_CREDITOS'
      'WHERE LIMITES_CREDITOS.ID_PRODUTOR = :ID; ')
    Left = 536
    Top = 24
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptUnknown
        Size = 4
      end>
    object qryLimites_CreditoID: TIntegerField
      FieldName = 'ID'
      Origin = '"AVALIACAO.FDB".LIMITES_CREDITOS.ID'
    end
    object qryLimites_CreditoID_PRODUTOR: TIntegerField
      FieldName = 'ID_PRODUTOR'
      Origin = '"AVALIACAO.FDB".LIMITES_CREDITOS.ID_PRODUTOR'
    end
    object qryLimites_CreditoID_DISTRIBUIDOR: TIntegerField
      FieldName = 'ID_DISTRIBUIDOR'
      Origin = '"AVALIACAO.FDB".LIMITES_CREDITOS.ID_DISTRIBUIDOR'
    end
    object qryLimites_CreditoLIMITE_CREDITO: TFloatField
      FieldName = 'LIMITE_CREDITO'
      Origin = '"AVALIACAO.FDB".LIMITES_CREDITOS.LIMITE_CREDITO'
    end
    object qryLimites_CreditoNOME_DISTRIBUIDOR: TStringField
      FieldKind = fkLookup
      FieldName = 'NOME_DISTRIBUIDOR'
      LookupDataSet = qryDistribuidores
      LookupKeyFields = 'ID'
      LookupResultField = 'NOME'
      KeyFields = 'ID_DISTRIBUIDOR'
      Lookup = True
    end
  end
  object qryItens: TQuery
    AutoRefresh = True
    DatabaseName = 'NEGOCIACOES.FDB'
    DataSource = frmCadNegociacao.dtsPadrao
    RequestLive = True
    SQL.Strings = (
      'SELECT'
      'ID_NEGOCIACAO,  '
      'ID_PRODUTO,    '
      'QUANTIDADE,     '
      'VLR_UNITARIO '
      'FROM ITENS_NEGOCIACAO'
      'WHERE ITENS_NEGOCIACAO.ID_NEGOCIACAO = :ID;')
    Left = 496
    Top = 352
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID_NEGOCIACAO'
        ParamType = ptUnknown
        Value = 1
      end>
    object IntegerField1: TIntegerField
      FieldName = 'ID_NEGOCIACAO'
      Origin = '"AVALIACAO.FDB".ITENS_NEGOCIACAO.ID_NEGOCIACAO'
    end
    object IntegerField2: TIntegerField
      FieldName = 'ID_PRODUTO'
      Origin = '"AVALIACAO.FDB".ITENS_NEGOCIACAO.ID_PRODUTO'
    end
    object FloatField1: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'QUANTIDADE'
      Origin = '"AVALIACAO.FDB".ITENS_NEGOCIACAO.QUANTIDADE'
    end
    object FloatField2: TFloatField
      DisplayLabel = 'Vlr Unit'#225'rio'
      FieldName = 'VLR_UNITARIO'
      Origin = '"AVALIACAO.FDB".ITENS_NEGOCIACAO.VLR_UNITARIO'
      currency = True
    end
    object StringField1: TStringField
      DisplayLabel = 'Produto'
      FieldKind = fkLookup
      FieldName = 'NOME_PRODUTO'
      LookupDataSet = qryProdutos
      LookupKeyFields = 'ID'
      LookupResultField = 'NOME'
      KeyFields = 'ID_PRODUTO'
      Size = 100
      Lookup = True
    end
  end
  object dtsProvItens: TDataSetProvider
    DataSet = qryItens
    Left = 424
    Top = 352
  end
  object cdtsItens: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    IndexFieldNames = 'ID_NEGOCIACAO'
    MasterFields = 'ID'
    MasterSource = frmCadNegociacao.dtsPadrao
    PacketRecords = 0
    Params = <>
    ProviderName = 'dtsProvItens'
    OnCalcFields = cdtsItensCalcFields
    Left = 344
    Top = 352
    object cdtsItensID_NEGOCIACAO: TIntegerField
      FieldName = 'ID_NEGOCIACAO'
      Origin = '"AVALIACAO.FDB".ITENS_NEGOCIACAO.ID_NEGOCIACAO'
    end
    object cdtsItensID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Origin = '"AVALIACAO.FDB".ITENS_NEGOCIACAO.ID_PRODUTO'
    end
    object cdtsItensQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
      Origin = '"AVALIACAO.FDB".ITENS_NEGOCIACAO.QUANTIDADE'
    end
    object cdtsItensVLR_UNITARIO: TFloatField
      FieldName = 'VLR_UNITARIO'
      Origin = '"AVALIACAO.FDB".ITENS_NEGOCIACAO.VLR_UNITARIO'
    end
    object cdtsItensNOME_PRODUTO: TStringField
      FieldName = 'NOME_PRODUTO'
      ReadOnly = True
      Size = 100
    end
    object cdtsItensTOTAL: TCurrencyField
      FieldKind = fkInternalCalc
      FieldName = 'TOTAL'
    end
    object cdtsItensTOTALITENS: TAggregateField
      FieldName = 'TOTALITENS'
      Active = True
      Expression = 'SUM(TOTAL)'
    end
  end
  object qryInserirLimiteCredito: TQuery
    DatabaseName = 'NEGOCIACOES.FDB'
    SQL.Strings = (
      '')
    Left = 112
    Top = 288
  end
end
