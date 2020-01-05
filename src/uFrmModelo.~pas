unit uFrmModelo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, ToolWin, Buttons, ImgList, ActnList,
  StdCtrls, Mask, DBCtrls, Grids, DBGrids, DB;

type
  TfrmCadModelo = class(TForm)
    tbPadrao: TToolBar;
    panPadrao: TPanel;
    btnNovo: TSpeedButton;
    btnGravar: TSpeedButton;
    btnEditar: TSpeedButton;
    btnUltimo: TSpeedButton;
    btnProximo: TSpeedButton;
    btnAnterior: TSpeedButton;
    btnPrimeiro: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnExcluir: TSpeedButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ActionList1: TActionList;
    ImageList1: TImageList;
    actNovo: TAction;
    actGravar: TAction;
    actEditar: TAction;
    actExcluir: TAction;
    actCancelar: TAction;
    actPrimeiro: TAction;
    actAnterior: TAction;
    actProximo: TAction;
    actUltimo: TAction;
    pgcPadrao: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    dbGridPadrao: TDBGrid;
    dtsPadrao: TDataSource;
    btnListar: TSpeedButton;
    btnFechar: TSpeedButton;
    actListar: TAction;
    actFechar: TAction;
    procedure actNovoExecute(Sender: TObject);
    procedure actGravarExecute(Sender: TObject);
    procedure actEditarExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure actPrimeiroExecute(Sender: TObject);
    procedure actAnteriorExecute(Sender: TObject);
    procedure actProximoExecute(Sender: TObject);
    procedure actUltimoExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actFecharExecute(Sender: TObject);
    procedure actListarExecute(Sender: TObject);
    procedure dbGridPadraoDblClick(Sender: TObject);
  private
    { Private declarations }
    procedure HabilitarControles;
    procedure HabilitarControlesVisuais(Status: Boolean);

  public
    { Public declarations }
  end;

var
  frmCadModelo: TfrmCadModelo;

implementation

{$R *.dfm}

procedure TfrmCadModelo.actNovoExecute(Sender: TObject);
begin
  dtsPadrao.DataSet.Insert;
  pgcPadrao.ActivePage := TabSheet2;
 // edtNome.SetFocus;

  HabilitarControles;
  HabilitarControlesVisuais(true);
end;

procedure TfrmCadModelo.actGravarExecute(Sender: TObject);
begin
  dtsPadrao.DataSet.Edit;
  dtsPadrao.DataSet.Post;
  
  HabilitarControles;
  HabilitarControlesVisuais(false);

end;

procedure TfrmCadModelo.actEditarExecute(Sender: TObject);
begin
  dtsPadrao.DataSet.Edit;
  pgcPadrao.ActivePage := TabSheet2;

  HabilitarControles;
  HabilitarControlesVisuais(true);
end;

procedure TfrmCadModelo.actExcluirExecute(Sender: TObject);
begin
  if MessageDlg('Deseja Excluir o Registro', mtconfirmation, [mbYes, mbNo], 0)
      = mrYes then
  begin
   dtsPadrao.dataset.delete;
  end;

  HabilitarControles;
  HabilitarControlesVisuais(false);
end;

procedure TfrmCadModelo.actCancelarExecute(Sender: TObject);
begin
  dtsPadrao.DataSet.Cancel;
  dtsPadrao.dataset.filtered := false;

  HabilitarControles;
  HabilitarControlesVisuais(false);
end;

procedure TfrmCadModelo.actPrimeiroExecute(Sender: TObject);
begin
  dtsPadrao.DataSet.First;
end;

procedure TfrmCadModelo.actAnteriorExecute(Sender: TObject);
begin
  dtsPadrao.DataSet.Prior;
end;

procedure TfrmCadModelo.actProximoExecute(Sender: TObject);
begin
  dtsPadrao.DataSet.Next;
end;

procedure TfrmCadModelo.actUltimoExecute(Sender: TObject);
begin
  dtsPadrao.DataSet.Last;
end;

procedure TfrmCadModelo.FormShow(Sender: TObject);
var
  page : integer;
begin
  // Esconder as tabs do PageControl
  for page := 0 to pgcPadrao.PageCount - 1 do
  begin
    pgcPadrao.Pages[page].TabVisible := false;
  end;

  pgcPadrao.ActivePage := TabSheet1;

  HabilitarControles;
  HabilitarControlesVisuais(true);

end;


procedure TfrmCadModelo.actFecharExecute(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmCadModelo.actListarExecute(Sender: TObject);
begin
  pgcPadrao.ActivePage := TabSheet1;
  dtsPadrao.DataSet.Active := false;
  dtsPadrao.DataSet.Active := true;

end;

procedure TfrmCadModelo.dbGridPadraoDblClick(Sender: TObject);
begin
  actEditar.Execute;

 // dtsPadrao.DataSet.Edit;
 // pgcPadrao.ActivePage := TabSheet2;
end;

procedure TfrmCadModelo.HabilitarControles;
begin
  btnNovo.Enabled     := not(dtsPadrao.DataSet.State in [dsInsert, dsEdit]);
  btnGravar.Enabled   := (dtsPadrao.DataSet.State in [dsInsert, dsEdit]);
  btnEditar.Enabled   := (dtsPadrao.DataSet.State in [dsBrowse]);
  btnExcluir.Enabled  := (dtsPadrao.DataSet.State in [dsBrowse, dsEdit]);
  btnCancelar.Enabled := (dtsPadrao.DataSet.State in [dsInsert, dsEdit]);
//  btnPesquisar.Enabled := not (dtsPadrao.DataSet.State in [dsInsert, dsEdit]);
end;

procedure TfrmCadModelo.HabilitarControlesVisuais(Status: Boolean);
var
  I: Integer;
begin
   for I := 0 to ComponentCount - 1 do
   begin
      if Components[I] is TDBEdit then
         TDBEdit(Components[I]).Enabled := Status
      else if Components[I] is TEdit then
         TEdit(Components[I]).Enabled := Status
      else if Components[I] is TDBLookupComboBox then
         TDBLookupComboBox(Components[I]).Enabled := Status 
      else if Components[I] is TDBComboBox then
         TDBComboBox(Components[I]).Enabled := Status
      else if Components[I] is TDBMemo then
         TDBMemo(Components[I]).Enabled := Status;
   end;
end;

end.
