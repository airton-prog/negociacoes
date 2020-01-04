program pAsNegociacoes;

uses
  Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uFrmModelo in 'uFrmModelo.pas' {frmCadModelo},
  uFrmCadProdutor in 'uFrmCadProdutor.pas' {frmCadProdutor},
  uDtmNegociacoes in 'DataModules\uDtmNegociacoes.pas' {dtmNegociacoes: TDataModule},
  uCadDistribuidor in 'uCadDistribuidor.pas' {frmCadDistribuidor},
  uFrmCadProduto in 'uFrmCadProduto.pas' {frmCadProduto},
  uFrmCadNegociacao in 'uFrmCadNegociacao.pas' {frmCadNegociacao},
  uFrmAlterarStatus in 'uFrmAlterarStatus.pas' {frmStatusNegociacoes},
  uFrmConsultarNegociacoes in 'uFrmConsultarNegociacoes.pas' {frmConsultarNegociacoes};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdtmNegociacoes, dtmNegociacoes);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
