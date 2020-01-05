unit uFrmCadProdutor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmModelo, ImgList, ActnList, StdCtrls, Mask, DBCtrls,
  ExtCtrls, ComCtrls, Buttons, ToolWin, Grids, DBGrids, uDtmNegociacoes, DB;

type
  TfrmCadProdutor = class(TfrmCadModelo)
    Panel2: TPanel;
    ScrollBox1: TScrollBox;
    Label4: TLabel;
    dbgLimtesCreditos: TDBGrid;
    dtsLimitesCredito: TDataSource;
    nvLimitesCreditos: TDBNavigator;
    edtId: TDBEdit;
    edtNome: TDBEdit;
    edtCnpjCpf: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dbLkDistribuidore: TDBLookupComboBox;
    btnAdicionarLimiteCredito: TSpeedButton;
    btnExcluirLimiteCredito: TSpeedButton;
    btnSalvarLimiteCredito: TSpeedButton;
    edtLimiteCredito: TEdit;
    dtsDistribuidores: TDataSource;
    Label5: TLabel;
    Label6: TLabel;
    procedure actNovoExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAdicionarLimiteCreditoClick(Sender: TObject);
    procedure btnSalvarLimiteCreditoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actEditarExecute(Sender: TObject);
    procedure btnExcluirLimiteCreditoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadProdutor: TfrmCadProdutor;

implementation

{$R *.dfm}

procedure TfrmCadProdutor.actNovoExecute(Sender: TObject);
begin
  inherited;
  edtNome.SetFocus;
end;

procedure TfrmCadProdutor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
//  self.Free;
end;

procedure TfrmCadProdutor.btnAdicionarLimiteCreditoClick(Sender: TObject);
var
 sql : string;
begin
  inherited;
  if edtID.Text = '' then
  begin
     actGravar.Execute;
  end;

  sql := 'INSERT INTO LIMITES_CREDITOS(ID_PRODUTOR, ID_DISTRIBUIDOR, LIMITE_CREDITO)';
  sql :=  sql + ' VALUES( :ID_PRODUTOR, :ID_DISTRIBUIDOR, :LIMITE_CREDITO)';
  dtmNegociacoes.qryInserirLimiteCredito.Close;
  dtmNegociacoes.qryInserirLimiteCredito.SQL.clear;
  dtmNegociacoes.qryInserirLimiteCredito.SQL.Add(sql);
  dtmNegociacoes.qryInserirLimiteCredito.ParamByName('ID_PRODUTOR').AsInteger     := strToInt(edtID.Text);
  dtmNegociacoes.qryInserirLimiteCredito.ParamByName('ID_DISTRIBUIDOR').AsInteger := dbLkDistribuidore.KeyValue;
  dtmNegociacoes.qryInserirLimiteCredito.ParamByName('LIMITE_CREDITO').AsFloat    := strToFloat(edtLimiteCredito.text);
  dtmNegociacoes.qryInserirLimiteCredito.ExecSQL;

  dtmNegociacoes.qryLimites_Credito.Active := false;
  dtmNegociacoes.qryLimites_Credito.Active := true;

  edtLimiteCredito.Text := '';
  dbLkDistribuidore.KeyValue := 0;


  actEditar.Execute;

  
end;

procedure TfrmCadProdutor.btnSalvarLimiteCreditoClick(Sender: TObject);
begin
  inherited;
  dtmNegociacoes.qryLimites_Credito.edit;
  dtmNegociacoes.qryLimites_Credito.Post;  
end;

procedure TfrmCadProdutor.FormShow(Sender: TObject);
begin
  inherited;
  dtmNegociacoes.qryProdutores.active := false;
  dtmNegociacoes.qryProdutores.active := true;
  dtmNegociacoes.qryLimites_Credito.Active := false;
  dtmNegociacoes.qryLimites_Credito.Active := true;
end;

procedure TfrmCadProdutor.actEditarExecute(Sender: TObject);
begin
  inherited;
  dtmNegociacoes.qryLimites_Credito.Active := false;
  dtmNegociacoes.qryLimites_Credito.Active := true;
end;

procedure TfrmCadProdutor.btnExcluirLimiteCreditoClick(Sender: TObject);
begin
  inherited;
  if MessageDlg('Deseja Realmente Excluir?', mtConfirmation, [mbYes, mbNo], 0) = 6 then
     dtmNegociacoes.qryLimites_Credito.Delete;
end;

end.
