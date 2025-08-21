unit uView.Contratos;

{ Copyright 2025 / 2026 D2Bridge Framework by Talis Jonatas Gomes }

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Unit1,
  Data.DB,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.ExtCtrls,
  Vcl.ComCtrls,
  D2Bridge.Forms, Vcl.DBCtrls;

type
  TFrmContratos = class(TForm1)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    Panel2: TPanel;
    dbgContratosPesquisa: TDBGrid;
    btnNovoAtivo: TButton;
    btnEditarAtivo: TButton;
    btnSalvarAtivo: TButton;
    btnExcluirAtivo: TButton;
    btnCancelarAtivo: TButton;
    btnFechar: TButton;
    dblIDCliente: TDBLookupComboBox;
    dtpDataInicio: TDateTimePicker;
    dtpDataFim: TDateTimePicker;
    edtValorMensal: TEdit;
    mObservacoes: TMemo;
    dblIDStatus: TDBLookupComboBox;
    edtDescricao: TEdit;
    lblIDCliente: TLabel;
    lblDataInicio: TLabel;
    lblDataFim: TLabel;
    lblValorMensal: TLabel;
    lblObservacoes: TLabel;
    lblIDStatus: TLabel;
    lblDescricao: TLabel;
    lblPesquisar: TLabel;
    edtNumeroContrato: TEdit;
    btnPesquisar: TButton;
    procedure btnFecharClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnNovoAtivoClick(Sender: TObject);
    procedure btnEditarAtivoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    procedure ExportD2Bridge; override;
    procedure InitControlsD2Bridge(const PrismControl: TPrismControl); override;
    procedure RenderD2Bridge(const PrismControl: TPrismControl; var HTMLControl: string); override;
  end;

function FrmContratos:TFrmContratos;

implementation

Uses
  ContratosWebApp, uDM;

{$R *.dfm}

function FrmContratos:TFrmContratos;
begin
  result:= TFrmContratos(TFrmContratos.GetInstance);
end;

procedure TFrmContratos.btnEditarAtivoClick(Sender: TObject);
begin
  inherited;
  DM.qryContratos.Edit;
end;

procedure TFrmContratos.btnFecharClick(Sender: TObject);
begin
  inherited;
  Self.Close;
end;

procedure TFrmContratos.btnNovoAtivoClick(Sender: TObject);
begin
  inherited;
  DM.qryContratos.Append;
end;

procedure TFrmContratos.btnPesquisarClick(Sender: TObject);
begin
  inherited;
//
end;

procedure TFrmContratos.ExportD2Bridge;
begin
  inherited;

  Title:= 'Cadastro de Contratos';

  //TemplateClassForm:= TD2BridgeFormTemplate;
  D2Bridge.FrameworkExportType.TemplateMasterHTMLFile := '';
  D2Bridge.FrameworkExportType.TemplatePageHTMLFile   := '';

  with D2Bridge.Items.add do
  begin
    with Row.Items.Add do
      with Tabs('TabControl01') do
      begin
        with AddTab('Cadastro').Items.Add do
        begin
          with Row.Items.Add do
          begin
            FormGroup(lblIDCliente.Caption).AddVCLObj(dblIDCliente);
            FormGroup(lblDataInicio.Caption).AddVCLObj(dtpDataInicio);
            FormGroup(lblDataFim.Caption).AddVCLObj(dtpDataFim);
            FormGroup(lblValorMensal.Caption).AddVCLObj(edtValorMensal);
            FormGroup(lblObservacoes.Caption).AddVCLObj(mObservacoes);
            FormGroup(lblIDStatus.Caption).AddVCLObj(dblIDStatus);
            FormGroup(lblDescricao.Caption).AddVCLObj(edtDescricao);
          end;

          with Row.Items.Add do
          begin
            FormGroup('').AddVCLObj(btnNovoAtivo, CSSClass.Button.Add);
            FormGroup('').AddVCLObj(btnSalvarAtivo, CSSClass.Button.save);
            FormGroup('').AddVCLObj(btnEditarAtivo, CSSClass.Button.Edit);
            FormGroup('').AddVCLObj(btnExcluirAtivo, CSSClass.Button.delete);
            FormGroup('').AddVCLObj(btnCancelarAtivo, CSSClass.Button.Cancel);
            FormGroup('').AddVCLObj(btnFechar, CSSClass.Button.Add);
          end;

        end;

        with AddTab('Listagem').Items.Add do
        begin
          with Row.Items.Add do
          begin
            FormGroup(lblPesquisar.Caption).AddVCLObj(edtNumeroContrato);
            FormGroup('').AddVCLObj(btnPesquisar, CSSClass.Button.search);
          end;
          with Row.Items.Add do
          begin
            VCLObj(dbgContratosPesquisa);
          end;

        end;

      end;

  end;

end;

procedure TFrmContratos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  DM.qryCliente.Active   := False;
  DM.qryContratos.Active := False;
  DM.qryStatus.Active    := False;
end;

procedure TFrmContratos.FormShow(Sender: TObject);
begin
  inherited;
  DM.qryCliente.Active   := True;
  DM.qryContratos.Active := True;
  DM.qryStatus.Active    := True;
end;

procedure TFrmContratos.InitControlsD2Bridge(const PrismControl: TPrismControl);
begin
 inherited;

  if PrismControl.IsDBGrid then
  begin
   PrismControl.AsDBGrid.RecordsPerPage := 10;
   PrismControl.AsDBGrid.MaxRecords     := 2000;
  end;

end;

procedure TFrmContratos.RenderD2Bridge(const PrismControl: TPrismControl; var HTMLControl: string);
begin
 inherited;

 //Intercept HTML
 {
  if PrismControl.VCLComponent = Edit1 then
  begin
   HTMLControl:= '</>';
  end;
 }
end;

end.