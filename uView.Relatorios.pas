unit uView.Relatorios;

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
  Vcl.ExtCtrls,
  Unit1,
  D2Bridge.Forms;

type
  TFrmRelatorios = class(TForm1)
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    btnListagemDeClientes: TButton;
    btnClientesPorCNPJ: TButton;
    btnFechar: TButton;
    procedure btnListagemDeClientesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    procedure ExportD2Bridge; override;
    procedure InitControlsD2Bridge(const PrismControl: TPrismControl); override;
    procedure RenderD2Bridge(const PrismControl: TPrismControl; var HTMLControl: string); override;
  end;

function FrmRelatorios:TFrmRelatorios;

implementation

Uses
  ContratosWebApp, uView.Relatorio.ListagemDeClientes;

{$R *.dfm}

function FrmRelatorios:TFrmRelatorios;
begin
  result:= TFrmRelatorios(TFrmRelatorios.GetInstance);
end;

procedure TFrmRelatorios.btnListagemDeClientesClick(Sender: TObject);
begin
  if FrmRelatorioListagemDeClientes = nil then
    TFrmRelatorioListagemDeClientes.CreateInstance;

   FrmRelatorioListagemDeClientes.ShowModal;
end;

procedure TFrmRelatorios.ExportD2Bridge;
begin
  inherited;

  Title:= 'My D2Bridge Form';

  //TemplateClassForm:= TD2BridgeFormTemplate;
  D2Bridge.FrameworkExportType.TemplateMasterHTMLFile:= '';
  D2Bridge.FrameworkExportType.TemplatePageHTMLFile := '';

  with D2Bridge.Items.add do
  begin
    with Row.Items.add do
      with Tabs do
      begin

        // aba Clientes
        with AddTab(PageControl1.Pages[0].Caption).Items.add do
        begin
          with Row.Items.add do
          begin
            FormGroup('  ').AddVCLObj(btnListagemDeClientes, CSSClass.Button.add);
            //FormGroup('  ').AddVCLObj(btnClientesPorCNPJ, CSSClass.Button.Edit);
          end;

        end;

        // Aba Contratos
//        with AddTab(PageControl1.Pages[1].Caption).Items.add do
//        begin
//          with Row.Items.add do
//          begin
//            FormGroup('  ').AddVCLObj(btnNovoCliente, CSSClass.Button.add);
//            FormGroup('  ').AddVCLObj(btnEditarCliente, CSSClass.Button.Edit);
//          end;
//        end;

//        // Aba Ativos
//        with AddTab(PageControl1.Pages[2].Caption).Items.add do
//        begin
//          with Row.Items.add do
//          begin
//            FormGroup(lblLocalizar2.Caption).AddVCLObj(EdtPesquisar2);
//            FormGroup(lblNomeCliente.Caption).AddVCLObj(CBNomecliente);
//          end;

        end;

      end;

end;

procedure TFrmRelatorios.InitControlsD2Bridge(const PrismControl: TPrismControl);
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

procedure TFrmRelatorios.RenderD2Bridge(const PrismControl: TPrismControl; var HTMLControl: string);
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