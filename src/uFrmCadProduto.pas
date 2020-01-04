unit uFrmCadProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uDtmNegociacoes, uFrmModelo, DB, ImgList, ActnList, Grids,
  DBGrids, ComCtrls, ExtCtrls, Buttons, ToolWin, StdCtrls, Mask, DBCtrls;

type
  TfrmCadProduto = class(TfrmCadModelo)
    edtId: TDBEdit;
    edtNome: TDBEdit;
    edtCnpjCpf: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure actNovoExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadProduto: TfrmCadProduto;

implementation

{$R *.dfm}

procedure TfrmCadProduto.actNovoExecute(Sender: TObject);
begin
  inherited;
  edtNome.SetFocus;
end;

procedure TfrmCadProduto.FormShow(Sender: TObject);
begin
  inherited;
  dtmNegociacoes.qryProdutos.Active := false;
  dtmNegociacoes.qryProdutos.Active := true;
end;

end.
