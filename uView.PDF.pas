unit uView.PDF;

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
  D2Bridge.Forms;

type
  TViewPDF = class(TD2BridgeForm)
    LBL_PDF: TLabel;
    procedure FormActivate(Sender: TObject);
  private
    FURL: string;
  public
    property URL: string read FURL write FURL;
  protected
    procedure ExportD2Bridge; override;
    procedure InitControlsD2Bridge(const PrismControl: TPrismControl); override;
    procedure RenderD2Bridge(const PrismControl: TPrismControl; var HTMLControl: string); override;
  end;

function ViewPDF:TViewPDF;

implementation

Uses
  MaisTopWebApp;

{$R *.dfm}

function ViewPDF:TViewPDF;
begin
  result:= TViewPDF(TViewPDF.GetInstance);
end;

procedure TViewPDF.ExportD2Bridge;
begin
  inherited;
  Title:= 'PDF View';
  D2Bridge.FrameworkExportType.TemplateMasterHTMLFile:= '';
  D2Bridge.FrameworkExportType.TemplatePageHTMLFile := '';
  D2Bridge.Items.add.HTMLElement(LBL_PDF);
end;

procedure TViewPDF.FormActivate(Sender: TObject);
begin
  D2Bridge.UpdateD2BridgeControl(LBL_PDF);
  LBL_PDF.Caption := '<div class="iframe-container">'+
                      '<iframe src="'+ FURL + '#navpanes=0" width="100%" height="600px"></iframe>'+
                   '</div>';

 D2Bridge.UpdateD2BridgeControl(LBL_PDF);
end;

procedure TViewPDF.InitControlsD2Bridge(const PrismControl: TPrismControl);
begin
 inherited;
end;

procedure TViewPDF.RenderD2Bridge(const PrismControl: TPrismControl; var HTMLControl: string);
begin
 inherited;
end;

end.