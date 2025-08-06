unit uView.Agendamento;

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
  Vcl.ComCtrls,
  Vcl.DBCtrls,
  Vcl.ExtCtrls,
  Unit1,
  D2Bridge.Forms;

type
  TFrmAgendamento = class(TForm1)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Listagem: TTabSheet;
    Panel1: TPanel;
    dblCliente: TDBLookupComboBox;
    dblContato: TDBLookupComboBox;
    dblContrato: TDBLookupComboBox;
    dblAtivo: TDBLookupComboBox;
    dtpDataRetirada: TDateTimePicker;
    dtpDataPrevistaDevolucao: TDateTimePicker;
    memoObservacao: TMemo;
    lblCliente: TLabel;
    lblContato: TLabel;
    lblContrato: TLabel;
    lblAtivo: TLabel;
    lblDataRetirada: TLabel;
    lblDataPrevistaDeDevolucao: TLabel;
    dtpDataDaDevolucao: TDateTimePicker;
    lblDataDevolucao: TLabel;
    dblMotivoStatus: TDBLookupComboBox;
    lblMotivoStatus: TLabel;
    lblObservacoes: TLabel;
    btnNovoAgendamento: TButton;
    btnEditarAgendamento: TButton;
    btnSalvarAgendamento: TButton;
    btnExcluirAgendamento: TButton;
    btnCancelarAgendamento: TButton;
    procedure FormCreate(Sender: TObject);
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

function FrmAgendamento:TFrmAgendamento;

implementation

Uses
  ContratosWebApp, uDM;

{$R *.dfm}

function FrmAgendamento:TFrmAgendamento;
begin
  result:= TFrmAgendamento(TFrmAgendamento.GetInstance);
end;

procedure TFrmAgendamento.ExportD2Bridge;
begin
  inherited;

  Title:= 'Cadastro de Agendamentos';

  //TemplateClassForm:= TD2BridgeFormTemplate;
  D2Bridge.FrameworkExportType.TemplateMasterHTMLFile:= '';
  D2Bridge.FrameworkExportType.TemplatePageHTMLFile := '';

   with D2Bridge.Items.add do
  begin
    with Row.Items.Add do
      with Tabs('TabControl01') do
      begin
        with AddTab('Agendamento').Items.Add do
        begin
          with Row.Items.Add do
          begin
            FormGroup(lblcliente.Caption).AddVCLObj(dblCliente);
            FormGroup(lblContato.Caption).AddVCLObj(dblContato);
            FormGroup(lblContrato.Caption).AddVCLObj(dblContrato);
            FormGroup(lblAtivo.Caption).AddVCLObj(dblAtivo);
          end;

          with Row.Items.Add do
          begin
            FormGroup(lblDataretirada.Caption).AddVCLObj(dtpDataRetirada);
            FormGroup(lblDataPrevistaDeDevolucao.Caption).AddVCLObj(dtpDataPrevistaDevolucao);
            FormGroup(lblDataDevolucao.Caption).AddVCLObj(dtpDataDaDevolucao);
            FormGroup(lblMotivoStatus.Caption).AddVCLObj(dblMotivoStatus);
          end;

          with Row.Items.Add do
          begin
            FormGroup(lblObservacoes.Caption).AddVCLObj(memoObservacao);
          end;

          with Row.Items.Add do
          begin
            FormGroup('').AddVCLObj(btnNovoAgendamento, CSSClass.Button.Add);
            FormGroup('').AddVCLObj(btnSalvarAgendamento, CSSClass.Button.save);
            FormGroup('').AddVCLObj(btnEditarAgendamento, CSSClass.Button.Edit);
            FormGroup('').AddVCLObj(btnExcluirAgendamento, CSSClass.Button.delete);
            FormGroup('').AddVCLObj(btnCancelarAgendamento, CSSClass.Button.Cancel);
          end;

        end;

//        with AddTab('DashBoard').Items.Add do
//        begin
//          with Row.Items.Add do
//          begin
//            FormGroup(lblPessuisarNumeroDeSerie.Caption).AddVCLObj(edtPesquisarNumeroDeSerie);
//            FormGroup('').AddVCLObj(btnPesquisarNumeroDeserie, CSSClass.Button.search);
//          end;
//          with Row.Items.Add do
//          begin
//            VCLObj(grdAtivos);
//          end;
//
//        end;

      end;

  end;

end;

procedure TFrmAgendamento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM.qryCliente.Active   := False;
  DM.qryContatos.Active  := False;
  DM.qryStatus.Active    := False;
  DM.qryAtivos.Active    := False;
  DM.qryContratos.Active := False;
end;

procedure TFrmAgendamento.FormCreate(Sender: TObject);
begin
  DM.qryCliente.Active   := True;
  DM.qryContatos.Active  := True;
  DM.qryStatus.Active    := True;
  DM.qryAtivos.Active    := True;
  DM.qryContratos.Active := True;
end;

procedure TFrmAgendamento.InitControlsD2Bridge(const PrismControl: TPrismControl);
begin
 inherited;

  if PrismControl.IsDBGrid then
  begin
   PrismControl.AsDBGrid.RecordsPerPage:= 10;
   PrismControl.AsDBGrid.MaxRecords:= 2000;
  end;

end;

procedure TFrmAgendamento.RenderD2Bridge(const PrismControl: TPrismControl; var HTMLControl: string);
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