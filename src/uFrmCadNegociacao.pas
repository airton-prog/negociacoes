unit uFrmCadNegociacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uDtmNegociacoes, uFrmModelo, DB, ImgList, ActnList, Grids,
  DBGrids, ComCtrls, ExtCtrls, Buttons, ToolWin, StdCtrls, Mask, DBCtrls;

type
  TfrmCadNegociacao = class(TfrmCadModelo)
    dbLkProdutor: TDBLookupComboBox;
    edtID: TDBEdit;
    dbLkDistribuidor: TDBLookupComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dtsProdutores: TDataSource;
    dtsDistribuidores: TDataSource;
    Panel2: TPanel;
    ScrollBox1: TScrollBox;
    Label4: TLabel;
    txtTotalNegociacao: TDBText;
    dtsProdutos: TDataSource;
    Label8: TLabel;
    txtLimiteCredito: TDBText;
    dtsLimiteCredito: TDataSource;
    Label9: TLabel;
    txtSaldo: TStaticText;
    Label10: TLabel;
    dtsItens: TDataSource;
    dbgItens: TDBGrid;
    txtNegociacoesAprovadas: TDBText;
    dtsTotalizarNegociacoes: TDataSource;
    Panel3: TPanel;
    Label5: TLabel;
    dbLkProduto: TDBLookupComboBox;
    Label6: TLabel;
    edtQuantidade: TEdit;
    Label7: TLabel;
    edtVlrUnitario: TEdit;
    btnAdicionarItem: TSpeedButton;
    btnSalvarItem: TButton;
    btnExcluirItem: TSpeedButton;
    txtStatus: TDBText;
    Label11: TLabel;
    procedure btnAdicionarItemClick(Sender: TObject);
    procedure dbLkProdutoCloseUp(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSalvarItemClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure dtsPadraoDataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);
    procedure btnExcluirItemClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function verificarCredito(limiteCredito, totalNegociacao, totalNegociacoes  : double) : boolean;
  end;

var
  frmCadNegociacao: TfrmCadNegociacao;

implementation


{$R *.dfm}


procedure TfrmCadNegociacao.btnAdicionarItemClick(Sender: TObject);
var
sql : string;
totalNegociacao, saldo : double;

begin

  if txtTotalNegociacao.Caption = '' then
     txtTotalNegociacao.Caption := '0';

  totalNegociacao := strToFloat(txtTotalNegociacao.Caption) + ( strToFloat(edtQuantidade.text) ) * ( strToFloat(edtVlrUnitario.text) );
  saldo := strToFloat(txtSaldo.Caption);

  if (saldo - totalNegociacao < 0) then
  begin
    ShowMessage(' Valor Calculado Desta Negocia��o: ' + floatToStr(totalNegociacao) + #13 +
                ' Saldo Atual: ' + floatToStr(saldo) +  #13 +
                ' Limite ultrapassado!');

    dbLkProduto.KeyValue := 0;
    edtQuantidade.Text   := '';
    edtVlrUnitario.Text  := '';
    abort;
  end;

  actGravar.Execute;

  sql := 'insert into itens_negociacao ( id_negociacao, id_produto, quantidade, vlr_unitario) ';
  sql := sql + 'values ( :id_negociacao, :id_produto, :quantidade, :vlr_unitario)';

  dtmNegociacoes.qryInserirItensNegociacao.close;
  dtmNegociacoes.qryInserirItensNegociacao.SQL.Clear;
  dtmNegociacoes.qryInserirItensNegociacao.SQL.Add(sql);
  dtmNegociacoes.qryInserirItensNegociacao.ParamByName('id_negociacao').AsInteger := strToInt(edtID.text);//dtmNegociacoes.qryNegociacoesID.AsInteger;//
  dtmNegociacoes.qryInserirItensNegociacao.ParamByName('id_produto').AsInteger    := dbLkProduto.KeyValue;
  dtmNegociacoes.qryInserirItensNegociacao.ParamByName('quantidade').AsCurrency   := strToFloat(edtQuantidade.text) ;
  dtmNegociacoes.qryInserirItensNegociacao.ParamByName('vlr_unitario').AsCurrency := strToFloat(edtVlrUnitario.text) ;
  dtmNegociacoes.qryInserirItensNegociacao.ExecSQL;


  dtmNegociacoes.qryItens.Active := false;
  dtmNegociacoes.qryItens.Active := true;

  dtmNegociacoes.cdtsItens.Active := false;
  dtmNegociacoes.cdtsItens.Active := true;

  dbLkProduto.KeyValue := 0;
  edtQuantidade.Text   := '';
  edtVlrUnitario.Text  := '';

  actGravar.Execute;
  actEditar.Execute;
  

end;


procedure TfrmCadNegociacao.dbLkProdutoCloseUp(Sender: TObject);
begin
  inherited;
  edtVlrUnitario.Text := dtmNegociacoes.qryProdutosPRECO_VENDA.AsString;
end;

function TfrmCadNegociacao.verificarCredito(limiteCredito, totalNegociacao, totalNegociacoes  : double) : boolean;
var
  resultado : double;
begin


     resultado := limiteCredito - ( totalNegociacao + totalNegociacoes );
     if resultado <= 0 then
     begin
       ShowMessage(' O Seu Limite de Cr�dito �: ' + floatToStr(limiteCredito) + #13 +
                   ' Negocia��es Aprovadas = ' + floatToStr(totalNegociacoes) + #13 +
                   ' Esta Negocia��o = ' + floatToStr(totalNegociacao) + #13 +
                   ' Saldo = ' + floatToStr(resultado) + #13 +
                   ' Voc� N�o Possui Cr�ditos Suficientes!');
                   abort;

       txtSaldo.Caption := floatToStr(resultado);

       result := false;
     end
     else
     begin
       result := true;
     end;


end;

procedure TfrmCadNegociacao.FormCreate(Sender: TObject);
begin
  inherited;
  dtmNegociacoes.qryNegociacoes.Active     := false;
  dtmNegociacoes.qryNegociacoes.Active     := true;

  dtmNegociacoes.qryProdutores.Active     := false;
  dtmNegociacoes.qryProdutores.Active     := true;

  dtmNegociacoes.qryDistribuidores.Active     := false;
  dtmNegociacoes.qryDistribuidores.Active     := true;
end;

procedure TfrmCadNegociacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
//  self.Free;
end;

procedure TfrmCadNegociacao.btnSalvarItemClick(Sender: TObject);
var
  totalNegociacao, saldo : double;
begin
  inherited;
  if txtTotalNegociacao.Caption = '' then
   txtTotalNegociacao.Caption := '0';

  dtmNegociacoes.cdtsItens.edit;
  dtmNegociacoes.cdtsItens.Post;
  totalNegociacao := strToFloat(txtTotalNegociacao.Caption);
  saldo := strToFloat(txtSaldo.Caption);

  if (saldo - totalNegociacao < 0) then
  begin
    ShowMessage(' Valor Calculado Desta Negocia��o: ' + floatToStr(totalNegociacao) + #13 +
                ' Saldo Atual: ' + floatToStr(saldo) +  #13 +
                ' Limite ultrapassado!');

    dtmNegociacoes.cdtsItens.Cancel;
    dtmNegociacoes.cdtsItens.Active := false;
    dtmNegociacoes.cdtsItens.Active := true;
    abort;
  end;

  dtmNegociacoes.cdtsItens.ApplyUpdates(1);

end;

procedure TfrmCadNegociacao.SpeedButton1Click(Sender: TObject);
var
sql : string;
begin
  inherited;

  sql := 'insert into itens_negociacao ( id_negociacao, id_produto, quantidade, vlr_unitario) ';
  sql := sql + 'values ( :id_negociacao, :id_produto, :quantidade, :vlr_unitario)';

  dtmNegociacoes.qryInserirItensNegociacao.close;
  dtmNegociacoes.qryInserirItensNegociacao.SQL.Clear;
  dtmNegociacoes.qryInserirItensNegociacao.SQL.Add(sql);
  dtmNegociacoes.qryInserirItensNegociacao.ParamByName('id_negociacao').AsInteger := strToInt(edtID.text)   ;
  dtmNegociacoes.qryInserirItensNegociacao.ParamByName('id_produto').AsInteger    := dbLkProduto.KeyValue;
  dtmNegociacoes.qryInserirItensNegociacao.ParamByName('quantidade').AsCurrency   := strToFloat(edtQuantidade.text) ;
  dtmNegociacoes.qryInserirItensNegociacao.ParamByName('vlr_unitario').AsCurrency := strToFloat(edtVlrUnitario.text) ;
  dtmNegociacoes.qryInserirItensNegociacao.ExecSQL;  


end;


procedure TfrmCadNegociacao.dtsPadraoDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  dtmNegociacoes.qryLimiteCredito.ParamByName('ID_PRODUTOR').AsInteger     := dtmNegociacoes.qryNegociacoesID_PRODUTOR.AsInteger;
  dtmNegociacoes.qryLimiteCredito.ParamByName('ID_DISTRIBUIDOR').AsInteger := dtmNegociacoes.qryNegociacoesID_DISTRIBUIDOR.AsInteger;
  dtmNegociacoes.qryLimiteCredito.Active := false;
  dtmNegociacoes.qryLimiteCredito.Active := true;

  dtmNegociacoes.qryTotalizarNegociacoes.ParamByName('ID_PRODUTOR').AsInteger     := dtmNegociacoes.qryNegociacoesID_PRODUTOR.AsInteger;
  dtmNegociacoes.qryTotalizarNegociacoes.ParamByName('ID_DISTRIBUIDOR').AsInteger := dtmNegociacoes.qryNegociacoesID_DISTRIBUIDOR.AsInteger;
  dtmNegociacoes.qryTotalizarNegociacoes.Active  := false;
  dtmNegociacoes.qryTotalizarNegociacoes.Active  := true;

  dtmNegociacoes.cdtsItens.Active := false;
  dtmNegociacoes.cdtsItens.Active := true;

  txtSaldo.Caption := floatToStr(dtmNegociacoes.qryLimiteCreditoLIMITE_CREDITO.Value - dtmNegociacoes.qryTotalizarNegociacoesTOTAL_NEGOCIACOES.Value );



end;

procedure TfrmCadNegociacao.FormShow(Sender: TObject);
begin
  inherited;
  dtmNegociacoes.qryNegociacoes.Active     := false;
  dtmNegociacoes.qryNegociacoes.Active     := true;
  dtmNegociacoes.qryItens.Active := false;
  dtmNegociacoes.qryItens.Active := true;
end;

procedure TfrmCadNegociacao.btnExcluirItemClick(Sender: TObject);
begin
  inherited;
   if MessageDlg('Deseja Realmente Excluir?', mtConfirmation, [mbYes, mbNo], 0) = 6 then
      dtmNegociacoes.cdtsItens.Delete;
      dtmNegociacoes.cdtsItens.ApplyUpdates(1);

     // dtmNegociacoes.cdtsItens.Active := false;
     // dtmNegociacoes.cdtsItens.Active := true;
end;

end.
