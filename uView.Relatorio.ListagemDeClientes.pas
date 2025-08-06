unit uView.Relatorio.ListagemDeClientes;

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
  frxClass,
  frxExportBaseDialog,
  frxExportPDF,
  frxDBSet,
  frCoreClasses,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  Unit1,
  D2Bridge.Forms;

type
  TFrmRelatorioListagemDeClientes = class(TForm1)
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    frxPDFExport1: TfrxPDFExport;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    procedure ExportD2Bridge; override;
    procedure InitControlsD2Bridge(const PrismControl: TPrismControl); override;
    procedure RenderD2Bridge(const PrismControl: TPrismControl; var HTMLControl: string); override;
  end;

function FrmRelatorioListagemDeClientes:TFrmRelatorioListagemDeClientes;

implementation

Uses
  ContratosWebApp, uDM;

{$R *.dfm}

function FrmRelatorioListagemDeClientes:TFrmRelatorioListagemDeClientes;
begin
  result:= TFrmRelatorioListagemDeClientes(TFrmRelatorioListagemDeClientes.GetInstance);
end;

procedure TFrmRelatorioListagemDeClientes.ExportD2Bridge;
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

procedure TFrmRelatorioListagemDeClientes.FormCreate(Sender: TObject);
begin
  DM.QryCliente.Open;

  frxDBDataSet1.DataSet := DM.qryCliente;
  frxDBDataSet1.UserName := 'Clientes';
  frxReport1.DataSets.Add(frxDBDataSet1);

  frxReport1.Clear;
  frxReport1.LoadFromFile('Relatorios\ListagemDeClientes.fr3');

  frxPDFExport1.FileName := 'pdf\ListagemdeClientes.pdf';
  frxPDFExport1.ShowDialog := False;
  frxPDFExport1.OpenAfterExport := False;
  frxPDFExport1.Background := True;

  // ESSENCIAL: prepara o relatório antes de exportar
  if frxReport1.PrepareReport(True) then
  begin
    frxReport1.Export(frxPDFExport1);
    D2Bridge.PrismSession.SendFile('pdf\ListagemdeClientes.pdf', True);
  end;

end;

procedure TFrmRelatorioListagemDeClientes.InitControlsD2Bridge(const PrismControl: TPrismControl);
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

procedure TFrmRelatorioListagemDeClientes.RenderD2Bridge(const PrismControl: TPrismControl; var HTMLControl: string);
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