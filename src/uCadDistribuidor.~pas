unit uCadDistribuidor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uDtmNegociacoes, uFrmModelo, DB, ImgList, ActnList, StdCtrls,
  Mask, DBCtrls, Grids, DBGrids, ComCtrls, ExtCtrls, Buttons, ToolWin;

type
  TfrmCadDistribuidor = class(TfrmCadModelo)
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
  frmCadDistribuidor: TfrmCadDistribuidor;

implementation

{$R *.dfm}

procedure TfrmCadDistribuidor.actNovoExecute(Sender: TObject);
begin
  inherited;
  edtNome.SetFocus;
end;

procedure TfrmCadDistribuidor.FormShow(Sender: TObject);
begin
  inherited;
  dtmNegociacoes.QryDistribuidores.Active := false;
  dtmNegociacoes.QryDistribuidores.Active := true;
  pgcPadrao.ActivePage := TabSheet1;
end;

end.
