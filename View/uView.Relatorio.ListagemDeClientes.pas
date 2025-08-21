unit uView.Relatorio.ListagemDeClientes;

{ Copyright 2025 / 2026 D2Bridge Framework by Talis Jonatas Gomes }

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  Winapi.ShellAPI,
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
  Vcl.ExtCtrls,
  frxPreview,
  D2Bridge.Forms;

type
  TFrmRelatorioListagemDeClientes = class(TForm1)
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    frxPDFExport1: TfrxPDFExport;
    frxPreview1: TfrxPreview;
    Panel1: TPanel;
    Button1: TButton;
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

  Title:= 'Relatorio Listagem de clientes';

  //TemplateClassForm:= TD2BridgeFormTemplate;
  D2Bridge.FrameworkExportType.TemplateMasterHTMLFile := '';
  D2Bridge.FrameworkExportType.TemplatePageHTMLFile   := '';

end;

procedure TFrmRelatorioListagemDeClientes.FormCreate(Sender: TObject);
var
  PDFPath: string;
  FullPDFPath: string;
begin
  try
    DM.QryCliente.Open;
    frxDBDataSet1.DataSet := DM.qryCliente;
    frxDBDataSet1.UserName := 'Clientes';
    frxReport1.DataSets.Add(frxDBDataSet1);
    frxReport1.Clear;
    frxReport1.LoadFromFile('Relatorios\ListagemDeClientes.fr3');

    if not DirectoryExists('pdf') then
      CreateDir('pdf');

    PDFPath := 'pdf\ListagemdeClientes.pdf';
    FullPDFPath := ExtractFilePath(Application.ExeName) + PDFPath;

    frxPDFExport1.FileName        := FullPDFPath;
    frxPDFExport1.ShowDialog      := False;
    frxPDFExport1.OpenAfterExport := False;
    frxPDFExport1.Background      := True;

    if frxReport1.PrepareReport(True) then
    begin
      frxReport1.Export(frxPDFExport1);

      if FileExists(FullPDFPath) then
        ShellExecute(0, 'open', PChar(FullPDFPath), nil, nil, SW_SHOW);

    end;

  except
    on E: Exception do
      ShowMessage('Erro: ' + E.Message);
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

{ TPrismSession }

end.
