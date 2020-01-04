unit uDtmNegociacoes;

interface

uses
  SysUtils, Classes, DB, DBTables, Provider, DBClient, IniFiles, DateUtils;

type
  TdtmNegociacoes = class(TDataModule)
    dbNegociacoes: TDatabase;
    qryProdutores: TQuery;
    qryProdutoresID: TIntegerField;
    qryProdutoresNOME: TStringField;
    qryProdutoresCNPJ_CPF: TStringField;
    qryDistribuidores: TQuery;
    qryDistribuidoresID: TIntegerField;
    qryDistribuidoresNOME: TStringField;
    qryDistribuidoresCNPJ_CPF: TStringField;
    qryProdutos: TQuery;
    qryProdutosID: TIntegerField;
    qryProdutosNOME: TStringField;
    qryProdutosPRECO_VENDA: TFloatField;
    qryNegociacoes: TQuery;
    qryNegociacoesID: TIntegerField;
    qryNegociacoesID_PRODUTOR: TIntegerField;
    qryNegociacoesID_DISTRIBUIDOR: TIntegerField;
    qryNegociacoesVLR_TOTAL: TFloatField;
    qryNegociacoesSTATUS: TStringField;
    qryStatusNegociacao: TQuery;
    qryGravarDataAlteracao: TQuery;
    qryTotalizarNegociacao: TQuery;
    qryInserirItensNegociacao: TQuery;
    qryLimiteCredito: TQuery;
    qryInserirItensNegociacaoTOTAL_NEGOCIACOES: TFloatField;
    qryTotalizarNegociacoes: TQuery;
    qryTotalizarNegociacoesTOTAL_NEGOCIACOES: TFloatField;
    qryConsultarNegociacoes: TQuery;
    qryConsultarNegociacoesID: TIntegerField;
    qryConsultarNegociacoesPRODUTOR: TStringField;
    qryConsultarNegociacoesDISTRIBUIDOR: TStringField;
    qryConsultarNegociacoesDT_CADASTRO: TDateTimeField;
    qryConsultarNegociacoesDT_APROVACAO: TDateTimeField;
    qryConsultarNegociacoesDT_CONCLUSAO: TDateTimeField;
    qryConsultarNegociacoesDT_CANCELAMENTO: TDateTimeField;
    qryConsultarNegociacoesVLR_TOTAL: TFloatField;
    qryConsultarNegociacoesSTATUS: TStringField;
    qryLimiteCreditoLIMITE_CREDITO: TFloatField;
    qryLimites_Credito: TQuery;
    qryLimites_CreditoID: TIntegerField;
    qryLimites_CreditoID_PRODUTOR: TIntegerField;
    qryLimites_CreditoID_DISTRIBUIDOR: TIntegerField;
    qryLimites_CreditoLIMITE_CREDITO: TFloatField;
    qryItens: TQuery;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    StringField1: TStringField;
    dtsProvItens: TDataSetProvider;
    cdtsItens: TClientDataSet;
    cdtsItensID_NEGOCIACAO: TIntegerField;
    cdtsItensID_PRODUTO: TIntegerField;
    cdtsItensQUANTIDADE: TFloatField;
    cdtsItensVLR_UNITARIO: TFloatField;
    cdtsItensNOME_PRODUTO: TStringField;
    cdtsItensTOTAL: TCurrencyField;
    cdtsItensTOTALITENS: TAggregateField;
    qryInserirLimiteCredito: TQuery;
    qryLimites_CreditoNOME_DISTRIBUIDOR: TStringField;
    qryNegociacoesDT_CADASTRO: TDateTimeField;
    
    procedure cdtsItensCalcFields(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure dbNegociacoesBeforeConnect(Sender: TObject);
    procedure qryNegociacoesBeforePost(DataSet: TDataSet);



  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmNegociacoes: TdtmNegociacoes;

implementation
uses uFrmCadProdutor, uFrmCadNegociacao;

{$R *.dfm}


procedure TdtmNegociacoes.cdtsItensCalcFields(DataSet: TDataSet);
begin
     cdtsItensTOTAL.AsCurrency := cdtsItensQUANTIDADE.value * cdtsItensVLR_UNITARIO.value;
end;

procedure TdtmNegociacoes.DataModuleCreate(Sender: TObject);
begin
  dbNegociacoes.Connected := false;
  dbNegociacoes.Connected := true;
end;

procedure TdtmNegociacoes.dbNegociacoesBeforeConnect(Sender: TObject);
var
server, caminho : string;
arquivoIni : TIniFile;
tamanho:integer;
begin
  caminho := SysUtils.GetCurrentDiR;
  tamanho := length(caminho);
  caminho := copy(caminho, 1, tamanho - 3);
  caminho := caminho + 'src\';
  arquivoIni := TIniFile.Create(caminho + 'negociacoes.ini');
  server := arquivoIni.ReadString('Server', 'DataBase', 'Erro ao ler arquivo .ini');
  dbNegociacoes.Params.Values['SERVER NAME'] := server;

end;


procedure TdtmNegociacoes.qryNegociacoesBeforePost(DataSet: TDataSet);
var
   dtAtual : TDateTime;
begin
   dtAtual := date;

   if qryNegociacoesSTATUS.AsString = '' then
      qryNegociacoesSTATUS.AsString := 'PENDENTE';

   if qryNegociacoes.FieldByName('DT_CADASTRO').AsDateTime = 0 then
      qryNegociacoes.FieldByName('DT_CADASTRO').AsDateTime := dtAtual;

   qryNegociacoesVLR_TOTAL.AsFloat := frmCadNegociacao.txtTotalNegociacao.Field.Value;
end;

end.
