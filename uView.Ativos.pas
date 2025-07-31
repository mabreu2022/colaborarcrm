unit uView.Ativos;

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
  Data.DB,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.ComCtrls,
  Vcl.ExtCtrls,
  Vcl.DBCtrls,
  Unit1,
  D2Bridge.Forms, uView.ControleDeUsuarios;

type
  TFrmAtivos = class(TForm1)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel2: TPanel;
    DBGrid_NumerosDeserie: TDBGrid;
    lblPessuisarNumeroDeSerie: TLabel;
    edtPesquisarNumeroDeSerie: TEdit;
    btnPesquisarNumeroDeserie: TButton;
    edtAtivo: TEdit;
    edtNumeroDeSerie: TEdit;
    lblAtivo: TLabel;
    lblNumeroDeSerie: TLabel;
    dblcbStatusAtual: TDBLookupComboBox;
    dblLocadoNoCliente: TDBLookupComboBox;
    lblStatusatual: TLabel;
    lblLocadoNoCliente: TLabel;
    Panel1: TPanel;
    btnNovoAtivo: TButton;
    btnEditarAtivo: TButton;
    btnSalvarAtivo: TButton;
    btnExcluirAtivo: TButton;
    btnCancelarAtivo: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    procedure ExportD2Bridge; override;
    procedure InitControlsD2Bridge(const PrismControl: TPrismControl); override;
    procedure RenderD2Bridge(const PrismControl: TPrismControl; var HTMLControl: string); override;
  end;

function FrmAtivos:TFrmAtivos;

implementation

Uses
  ContratosWebApp, uDM;

{$R *.dfm}

function FrmAtivos:TFrmAtivos;
begin
  result:= TFrmAtivos(TFrmAtivos.GetInstance);
end;

procedure TFrmAtivos.ExportD2Bridge;
begin
  inherited;

  Title:= 'My D2Bridge Form';

  //TemplateClassForm:= TD2BridgeFormTemplate;
  D2Bridge.FrameworkExportType.TemplateMasterHTMLFile:= '';
  D2Bridge.FrameworkExportType.TemplatePageHTMLFile := '';

  with D2Bridge.Items.add do
  begin
    with Row.Items.Add do
      with Tabs('TabControl01') do
      begin
        with AddTab('Cadastro').Items.Add do
        begin
          with Row.Items.Add do
          begin
            FormGroup(lblAtivo.Caption).AddVCLObj(edtAtivo);
            FormGroup(lblNumeroDeSerie.Caption).AddVCLObj(edtNumeroDeSerie);
            FormGroup(lblStatusatual.Caption).AddVCLObj(dblcbStatusAtual);
            FormGroup(lblLocadoNoCliente.Caption).AddVCLObj(dblLocadoNoCliente);
          end;
//          with Row.Items.Add do
//          begin
//            VCLObj(Label5, CSSClass.Space.margim_top5);
//          end;

          with Row.Items.Add do
          begin
            FormGroup('').AddVCLObj(btnNovoAtivo, CSSClass.Button.Add);
            FormGroup('').AddVCLObj(btnSalvarAtivo, CSSClass.Button.save);
            FormGroup('').AddVCLObj(btnEditarAtivo, CSSClass.Button.Edit);
            FormGroup('').AddVCLObj(btnExcluirAtivo, CSSClass.Button.delete);
            FormGroup('').AddVCLObj(btnCancelarAtivo, CSSClass.Button.Cancel);
          end;

        end;

        with AddTab('Listagem').Items.Add do
        begin
          with Row.Items.Add do
          begin
            FormGroup(lblPessuisarNumeroDeSerie.Caption).AddVCLObj(edtPesquisarNumeroDeSerie);
            FormGroup('').AddVCLObj(btnPesquisarNumeroDeserie, CSSClass.Button.search);
          end;
          with Row.Items.Add do
          begin
            VCLObj(DBGrid_NumerosDeserie);
          end;

        end;

      end;

  end;

end;

procedure TFrmAtivos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM.qryAtivos.active := False;
end;

procedure TFrmAtivos.FormShow(Sender: TObject);
begin
  DM.qryAtivos.active := True;

  //Botões Ativos
  FrmControleDeUsuarios.AtivarPermissaoPorComponente(DM.perfilID, 'Ativos', 'Novo', btnNovoAtivo);
  FrmControleDeUsuarios.AtivarPermissaoPorComponente(DM.perfilID, 'Ativos', 'Editar', btnEditarAtivo);
  FrmControleDeUsuarios.AtivarPermissaoPorComponente(DM.perfilID, 'Ativos', 'Excluir', btnExcluirAtivo);
  FrmControleDeUsuarios.AtivarPermissaoPorComponente(DM.perfilID, 'Ativos', 'Salvar', btnSalvarAtivo);
  FrmControleDeUsuarios.AtivarPermissaoPorComponente(DM.perfilID, 'Ativos', 'Cancelar', btnCancelarAtivo);
end;

procedure TFrmAtivos.InitControlsD2Bridge(const PrismControl: TPrismControl);
begin
 inherited;

  if PrismControl.IsDBGrid then
  begin
   PrismControl.AsDBGrid.RecordsPerPage := 10;
   PrismControl.AsDBGrid.MaxRecords     := 2000;
  end;

end;

procedure TFrmAtivos.RenderD2Bridge(const PrismControl: TPrismControl; var HTMLControl: string);
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