unit uFrmAlterarStatus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls, uDtmNegociacoes, ComCtrls, DateUtils;

type
  TfrmStatusNegociacoes = class(TForm)
    edtIDNegociacao: TEdit;
    Label1: TLabel;
    Panel1: TPanel;
    rgStatusNecociacao: TRadioGroup;
    btnGravarAlteracao: TSpeedButton;
    btnConsultarStatus: TSpeedButton;
    dtpNovoStatus: TDateTimePicker;
    Label2: TLabel;
    procedure btnConsultarStatusClick(Sender: TObject);
    procedure btnGravarAlteracaoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtIDNegociacaoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    function GetStatusNegociacao(idNegociacao : integer) : string;
    procedure GravarStatusNegociacao(idNegociacao : integer; statusNegociacao : string);
    procedure GravarDataAlteracao(idNegociacao : integer; statusNegociacao: string; dataAlteracao : TDateTime);
  end;

var
  frmStatusNegociacoes: TfrmStatusNegociacoes;

implementation

{$R *.dfm}

function TfrmStatusNegociacoes.GetStatusNegociacao(idNegociacao: integer): string;
begin
  dtmNegociacoes.qryStatusNegociacao.Close;
  dtmNegociacoes.qryStatusNegociacao.SQL.Clear;
  dtmNegociacoes.qryStatusNegociacao.SQL.Add('SELECT NEGOCIACOES.STATUS FROM NEGOCIACOES ');
  dtmNegociacoes.qryStatusNegociacao.SQL.Add('WHERE NEGOCIACOES.ID = :ID ');
 // dtmNegociacoes.qryStatusNegociacao.SQL.Add('AND NEGOCIACOES.STATUS = :STATUS ');
  dtmNegociacoes.qryStatusNegociacao.ParamByName('ID').AsInteger    := idNegociacao;
 // dtmNegociacoes.qryStatusNegociacao.ParamByName('STATUS').AsString := 'PENDENTE';
  dtmNegociacoes.qryStatusNegociacao.Open;

  result := dtmNegociacoes.qryStatusNegociacao.FieldByName('STATUS').AsString;

end;

procedure TfrmStatusNegociacoes.btnConsultarStatusClick(Sender: TObject);
var
idNegociacao : integer;
statusNegociacao : string;
begin
 if edtIDNegociacao.text <> '' then
 begin
 idNegociacao     :=  strToInt(edtIDNegociacao.text);
 statusNegociacao := GetStatusNegociacao(idNegociacao);
 end
 else
 begin
   ShowMessage('Por Favor Digite um Código!');
 end;

 rgStatusNecociacao.ItemIndex := rgStatusNecociacao.Items.IndexOf(statusNegociacao);


end;

procedure TfrmStatusNegociacoes.GravarStatusNegociacao(idNegociacao : integer; statusNegociacao : string);
begin
  dtmNegociacoes.qryStatusNegociacao.Close;
  dtmNegociacoes.qryStatusNegociacao.SQL.Clear;
  dtmNegociacoes.qryStatusNegociacao.SQL.Add('UPDATE NEGOCIACOES SET NEGOCIACOES.STATUS = :STATUS ');
  dtmNegociacoes.qryStatusNegociacao.SQL.Add('WHERE NEGOCIACOES.ID = :ID ');
  dtmNegociacoes.qryStatusNegociacao.ParamByName('ID').AsInteger     := idNegociacao;
  dtmNegociacoes.qryStatusNegociacao.ParamByName('STATUS').AsString  := statusNegociacao;
  dtmNegociacoes.qryStatusNegociacao.ExecSQL;
end;

procedure TfrmStatusNegociacoes.btnGravarAlteracaoClick(Sender: TObject);
var
idNegociacao     : integer;
statusNegociacao : string;
begin
  idNegociacao     := strToInt(edtIDNegociacao.text);
  statusNegociacao := rgStatusNecociacao.Items.Strings[rgStatusNecociacao.ItemIndex]; // Retorna a string do radio button selecionado

  GravarStatusNegociacao(idNegociacao, statusNegociacao);
  GravarDataAlteracao(idNegociacao, statusNegociacao, dtpNovoStatus.DateTime);
end;

procedure TfrmStatusNegociacoes.FormShow(Sender: TObject);
begin
  dtpNovoStatus.DateTime := Date;
end;

procedure TfrmStatusNegociacoes.GravarDataAlteracao(idNegociacao: integer; statusNegociacao: string; dataAlteracao: TDateTime);
begin
  dtmNegociacoes.qryGravarDataAlteracao.Close;
  dtmNegociacoes.qryGravarDataAlteracao.SQL.Clear;

  if statusNegociacao = 'APROVADA' Then
  begin
    dtmNegociacoes.qryGravarDataAlteracao.SQL.Add('UPDATE NEGOCIACOES SET NEGOCIACOES.DT_APROVACAO = :dataAlteracao ');
  end;

  if statusNegociacao = 'CONCLUIR' Then
  begin
    dtmNegociacoes.qryGravarDataAlteracao.SQL.Add('UPDATE NEGOCIACOES SET NEGOCIACOES.DT_CONCLUSAO = :dataAlteracao ');
  end;

  if statusNegociacao = 'CANCELADA' Then
  begin
    dtmNegociacoes.qryGravarDataAlteracao.SQL.Add('UPDATE NEGOCIACOES SET NEGOCIACOES.DT_CANCELAMENTO = :dataAlteracao ');
  end;

  dtmNegociacoes.qryGravarDataAlteracao.SQL.Add('WHERE NEGOCIACOES.ID = :ID');
  dtmNegociacoes.qryGravarDataAlteracao.ParamByName('ID').AsInteger := idNegociacao;
  dtmNegociacoes.qryGravarDataAlteracao.ParamByName('dataAlteracao').AsDateTime := dataAlteracao;
  dtmNegociacoes.qryGravarDataAlteracao.ExecSQL; 

end;

procedure TfrmStatusNegociacoes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  self.free;
end;

procedure TfrmStatusNegociacoes.edtIDNegociacaoKeyPress(Sender: TObject;
  var Key: Char);
begin
 If not( key in['0'..'9',#08] ) then key:=#0;
end;

end.
