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
  D2Bridge.Forms;

type
  TFrmContratos = class(TForm1)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    btnNovoAtivo: TButton;
    btnEditarAtivo: TButton;
    btnSalvarAtivo: TButton;
    btnExcluirAtivo: TButton;
    btnCancelarAtivo: TButton;
    btnFechar: TButton;
    procedure btnFecharClick(Sender: TObject);
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
  ContratosWebApp;

{$R *.dfm}

function FrmContratos:TFrmContratos;
begin
  result:= TFrmContratos(TFrmContratos.GetInstance);
end;

procedure TFrmContratos.btnFecharClick(Sender: TObject);
begin
  inherited;
  Self.Close;
end;

procedure TFrmContratos.ExportD2Bridge;
begin
  inherited;

  Title:= 'Cadastro de Contratos';

  //TemplateClassForm:= TD2BridgeFormTemplate;
  D2Bridge.FrameworkExportType.TemplateMasterHTMLFile := '';
  D2Bridge.FrameworkExportType.TemplatePageHTMLFile   := '';

  with D2Bridge.Items.add do  //falta exportar tudo
  begin
   FormGroup('').AddVCLObj(btnFechar, CSSClass.Button.Add);
  end;

end;

procedure TFrmContratos.InitControlsD2Bridge(const PrismControl: TPrismControl);
begin
 inherited;

  if PrismControl.IsDBGrid then
  begin
   PrismControl.AsDBGrid.RecordsPerPage:= 10;
   PrismControl.AsDBGrid.MaxRecords:= 2000;
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