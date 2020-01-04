unit uPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TfrmPrincipal = class(TForm)
    panPadrao: TPanel;
    panPrincipal: TPanel;
    panEsquerdo: TPanel;
    Label1: TLabel;
    btnProdutores: TSpeedButton;
    btnDistribuidores: TSpeedButton;
    btnProdutos: TSpeedButton;
    btnNegociacoes: TSpeedButton;
    btnAlterarStatus: TSpeedButton;
    Label2: TLabel;
    btnConsultarNegociacoes: TSpeedButton;
    procedure btnProdutoresClick(Sender: TObject);
    procedure btnDistribuidoresClick(Sender: TObject);
    procedure btnProdutosClick(Sender: TObject);
    procedure btnNegociacoesClick(Sender: TObject);
    procedure btnAlterarStatusClick(Sender: TObject);
    procedure btnConsultarNegociacoesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses uFrmModelo, uFrmCadProdutor, uCadDistribuidor, uFrmCadProduto,
     uFrmAlterarStatus, uFrmCadNegociacao, uFrmConsultarNegociacoes;

{$R *.dfm}



procedure TfrmPrincipal.btnProdutoresClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCadProdutor, frmCadProdutor);
  frmCadProdutor.Show;
  frmCadProdutor.Parent := panPrincipal;
end;

procedure TfrmPrincipal.btnDistribuidoresClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCadDistribuidor, frmCadDistribuidor);
  frmCadDistribuidor.show;
  frmCadDistribuidor.Parent := panPrincipal;
end;

procedure TfrmPrincipal.btnProdutosClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCadProduto, frmCadProduto);
  frmCadProduto.show;
  frmCadProduto.Parent := panPrincipal;
end;

procedure TfrmPrincipal.btnNegociacoesClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCadNegociacao, frmCadNegociacao);
  frmCadNegociacao.Show;
  frmCadNegociacao.Parent := panPrincipal;
end;

procedure TfrmPrincipal.btnAlterarStatusClick(Sender: TObject);
begin
  Application.CreateForm(TfrmStatusNegociacoes, frmStatusNegociacoes);
  frmStatusNegociacoes.Show;
  frmStatusNegociacoes.Parent := panPrincipal;
end;

procedure TfrmPrincipal.btnConsultarNegociacoesClick(Sender: TObject);
begin
  Application.CreateForm(TfrmConsultarNegociacoes, frmConsultarNegociacoes);
  frmConsultarNegociacoes.Show;
  frmConsultarNegociacoes.Parent := panPrincipal; 
end;

end.
