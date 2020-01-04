unit uFrmConsultarNegociacoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, DBCtrls, UDtmNegociacoes, DB,
  RpCon, RpConDS, RpConBDE, RpDefine, RpRave, RpRender, RpRenderPDF;

type
  TfrmConsultarNegociacoes = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    btnImprimir: TSpeedButton;
    rgStatusNecociacao: TRadioGroup;
    dtsProdutor: TDataSource;
    dbLkProdutor: TDBLookupComboBox;
    dtsDistribuidor: TDataSource;
    dbLkDistribuidor: TDBLookupComboBox;
    RvNegociacoes: TRvProject;
    RvQryNegociacoes: TRvQueryConnection;
    btnLimparFiltros: TSpeedButton;
    RvRenderPDF1: TRvRenderPDF;
    procedure btnImprimirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnLimparFiltrosClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    sqlConsultarNegociacoes  : string;
  public
    { Public declarations }
  end;

var
  frmConsultarNegociacoes: TfrmConsultarNegociacoes;

implementation

{$R *.dfm}

procedure TfrmConsultarNegociacoes.btnImprimirClick(Sender: TObject);
var
  statusNegociacao : string;
begin
  if (dbLkProdutor.Text = '') and (dblkDistribuidor.Text = '') then
  begin
    ShowMessage('Selecione Um Produtor ou Um Distribuidor (ou Ambos)');
    Abort;
  end;


  if (dbLkProdutor.Text <> '') and (dblkDistribuidor.Text = '') then // Foi selecionado somente o produtor
  begin
   dtmNegociacoes.qryConsultarNegociacoes.SQL.Clear;
   dtmNegociacoes.qryConsultarNegociacoes.SQL.Text := sqlConsultarNegociacoes;
   dtmNegociacoes.qryConsultarNegociacoes.SQL.Add('WHERE NEGOCIACOES.ID_PRODUTOR = :ID_PRODUTOR');
   dtmNegociacoes.qryConsultarNegociacoes.ParamByName('ID_PRODUTOR').AsInteger := dbLkProdutor.KeyValue;
  end
  else if (dbLkProdutor.Text = '') and (dblkDistribuidor.Text <> '') then // Foi selecionado somente o distribuidor
  begin
    dtmNegociacoes.qryConsultarNegociacoes.SQL.Clear;
    dtmNegociacoes.qryConsultarNegociacoes.SQL.Text := sqlConsultarNegociacoes; // Recupera o SQL Original
    dtmNegociacoes.qryConsultarNegociacoes.SQL.Add('WHERE NEGOCIACOES.ID_DISTRIBUIDOR = :ID_DISTRIBUIDOR');
    dtmNegociacoes.qryConsultarNegociacoes.ParamByName('ID_DISTRIBUIDOR').AsInteger := dbLkDistribuidor.KeyValue;
  end
  else
  begin
    dtmNegociacoes.qryConsultarNegociacoes.SQL.Clear;
    dtmNegociacoes.qryConsultarNegociacoes.SQL.Text := sqlConsultarNegociacoes; // Recupera o SQL Original
    dtmNegociacoes.qryConsultarNegociacoes.SQL.Add('WHERE NEGOCIACOES.ID_PRODUTOR = :ID_PRODUTOR ');
    dtmNegociacoes.qryConsultarNegociacoes.SQL.Add('AND NEGOCIACOES.ID_DISTRIBUIDOR = :ID_DISTRIBUIDOR');
    dtmNegociacoes.qryConsultarNegociacoes.ParamByName('ID_PRODUTOR').AsString     := dbLkProdutor.KeyValue;
    dtmNegociacoes.qryConsultarNegociacoes.ParamByName('ID_DISTRIBUIDOR').AsString := dbLkDistribuidor.KeyValue;
  end;

  statusNegociacao := rgStatusNecociacao.Items.Strings[rgStatusNecociacao.ItemIndex]; // Retorna a string do radio button selecionado

  if statusNegociacao <> 'TODOS' then
  begin
    dtmNegociacoes.qryConsultarNegociacoes.SQL.Add('AND NEGOCIACOES.STATUS = :STATUS');
    dtmNegociacoes.qryConsultarNegociacoes.ParamByName('STATUS').AsString := statusNegociacao;
  end;

  dtmNegociacoes.qryConsultarNegociacoes.Active := false;
  dtmNegociacoes.qryConsultarNegociacoes.Active := true;

  RvNegociacoes.ExecuteReport('rp' + statusNegociacao); 

end;

procedure TfrmConsultarNegociacoes.FormCreate(Sender: TObject);
begin
  // Retorna o SQl que foi colocado na query em tempo de projeto
  sqlConsultarNegociacoes := dtmNegociacoes.qryConsultarNegociacoes.Text;
end;

procedure TfrmConsultarNegociacoes.btnLimparFiltrosClick(Sender: TObject);
begin
     dbLkProdutor.KeyValue        := 0;
     dbLkDistribuidor.KeyValue    := 0;
     rgStatusNecociacao.ItemIndex := 5;
     dtmNegociacoes.qryConsultarNegociacoes.Active := false;
     dtmNegociacoes.qryConsultarNegociacoes.SQL.Clear;
     dtmNegociacoes.qryConsultarNegociacoes.SQL.Text :=  sqlConsultarNegociacoes;

end;

procedure TfrmConsultarNegociacoes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  self.Free;
end;

end.
