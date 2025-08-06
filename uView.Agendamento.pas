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
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    DBLookupComboBox3: TDBLookupComboBox;
    DBLookupComboBox4: TDBLookupComboBox;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    memoObservacao: TMemo;
    lblCliente: TLabel;
    lblContato: TLabel;
    Label3: TLabel;
    lblAtivo: TLabel;
    lblDataRetirada: TLabel;
    Label2: TLabel;
    DateTimePicker3: TDateTimePicker;
    lblDataDevolucao: TLabel;
    DBLookupComboBox5: TDBLookupComboBox;
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

  Title:= 'My D2Bridge Form';

  //TemplateClassForm:= TD2BridgeFormTemplate;
  D2Bridge.FrameworkExportType.TemplateMasterHTMLFile:= '';
  D2Bridge.FrameworkExportType.TemplatePageHTMLFile := '';

  with D2Bridge.Items.add do
  begin
   {Yours Controls}
  end;

end;

procedure TFrmAgendamento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM.qryCliente.Active  := False;
  DM.qryContatos.Active := False;
  DM.qryStatus.Active   := False;
//  DM.qryContratos.Active := False;
end;

procedure TFrmAgendamento.FormCreate(Sender: TObject);
begin
  DM.qryCliente.Active  := True;
  DM.qryContatos.Active := True;
  DM.qryStatus.Active   := True;
//  DM.qryContratos.Active := True;
end;

procedure TFrmAgendamento.InitControlsD2Bridge(const PrismControl: TPrismControl);
begin
 inherited;

 //Change Init Property of Prism Controls
 {
  if PrismControl.VCLComponent = Edit1 then
   PrismControl.AsEdit.DataType:= TPrismFieldType.PrismFieldTypeInteger;

  if PrismControl.IsDBGrid then
  begin
   PrismControl.AsDBGrid.RecordsPerPage:= 10;
   PrismControl.AsDBGrid.MaxRecords:= 2000;
  end;
 }
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