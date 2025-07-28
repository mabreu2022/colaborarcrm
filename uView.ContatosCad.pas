unit uView.ContatosCad;

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
  Vcl.ExtCtrls,
  Vcl.DBCtrls,

  D2Bridge.Forms;

type
  TFrmContatosCad = class(TD2BridgeForm)
    edtNome: TEdit;
    edtTelefone: TEdit;
    edtEmail: TEdit;
    edtCargo: TEdit;
    memObservacao: TMemo;
    Panel1: TPanel;
    lblNomeContato: TLabel;
    lblTelefone: TLabel;
    lblEmail: TLabel;
    lblCargo: TLabel;
    lblObservacao: TLabel;
    btnSalvar: TButton;
    btnEditar: TButton;
    btnFechar: TButton;
    cbCliente: TDBLookupComboBox;
    lblCliente: TLabel;
    procedure btnFecharClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public
    ID_CONTATO_RECEBIDO: Integer;
    procedure CarregarDadosContato(IDContato: Integer);

  protected
    procedure ExportD2Bridge; override;
    procedure InitControlsD2Bridge(const PrismControl: TPrismControl); override;
    procedure RenderD2Bridge(const PrismControl: TPrismControl;
      var HTMLControl: string); override;
  end;

function FrmContatosCad: TFrmContatosCad;

implementation

Uses
  ContratosWebApp,
  uDM, uView.ControleDeUsuarios;

{$R *.dfm}

function FrmContatosCad: TFrmContatosCad;
begin
  result := TFrmContatosCad(TFrmContatosCad.GetInstance);
end;

procedure TFrmContatosCad.btnEditarClick(Sender: TObject);
begin
  DM.EditarContato(EdtNome.Text, edtCargo.Text, edtTelefone.Text, edtEmail.Text, memObservacao.Text, cbCliente.KeyValue);
end;

procedure TFrmContatosCad.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmContatosCad.btnSalvarClick(Sender: TObject);
begin
  Dm.InserirContato(EdtNome.Text, edtCargo.Text, edtTelefone.TexT, edtEmail.Text, memObservacao.Text, cbCliente.KeyValue);
end;

procedure TFrmContatosCad.CarregarDadosContato(IDContato: Integer);
begin
  DM.qryContatos.Locate('ID_CONTATO', IDContato, []);
  edtNome.Text       := DM.qryContatos.FieldByName('NOME_CONTATO').AsString;
  edtCargo.Text      := DM.qryContatos.FieldByName('CARGO').AsString;
  edtTelefone.Text   := DM.qryContatos.FieldByName('TELEFONE_CONTATO').AsString;
  edtEmail.Text      := DM.qryContatos.FieldByName('EMAIL_CONTATO').AsString;
  memObservacao.Text := DM.qryContatos.FieldByName('OBSERVACAO').AsString;
  cbCliente.KeyValue := DM.qryContatos.FieldByName('ID_CLIENTE').AsInteger;
end;

procedure TFrmContatosCad.ExportD2Bridge;
begin
  inherited;

  Title := 'Cadastro de contatos';

  D2Bridge.FrameworkExportType.TemplateMasterHTMLFile := '';
  D2Bridge.FrameworkExportType.TemplatePageHTMLFile := '';

  with D2Bridge.Items.add do
  begin
    with Row.Items.add do
    begin
      Col.Items.add.FormGroup(lblCliente.Caption).AddVCLObj(cbCliente);
    end;
    with Row.Items.add do
    begin
      Col.Items.add.FormGroup(lblNomeContato.Caption).AddVCLObj(edtNome);
      Col.Items.add.FormGroup(lblTelefone.Caption).AddVCLObj(edtTelefone);
    end;
    with Row.Items.add do
    begin
      Col.Items.add.FormGroup(lblEmail.Caption).AddVCLObj(edtEmail);
      Col.Items.add.FormGroup(lblCargo.Caption).AddVCLObj(edtCargo);
    end;
    with Row.Items.add do
    begin
      Col.Items.add.FormGroup(lblObservacao.Caption).AddVCLObj(memObservacao);
    end;
    with Row.Items.add do
    begin
      FormGroup('').AddVCLObj(btnSalvar, CSSClass.Button.save);
      FormGroup('').AddVCLObj(btnEditar, CSSClass.Button.edit);
      FormGroup('').AddVCLObj(btnFechar, CSSClass.Button.close);
    end;

  end;

end;

procedure TFrmContatosCad.FormShow(Sender: TObject);
begin
  CarregarDadosContato(ID_CONTATO_RECEBIDO);
  FrmControleDeUsuarios.AtivarPermissaoPorComponente(DM.perfilID, 'Contatos', 'Novo', btnSalvar);
  FrmControleDeUsuarios.AtivarPermissaoPorComponente(DM.perfilID, 'Contatos', 'Editar', btnEditar);
end;

procedure TFrmContatosCad.InitControlsD2Bridge(const PrismControl
  : TPrismControl);
begin
  inherited;

  // Change Init Property of Prism Controls
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

procedure TFrmContatosCad.RenderD2Bridge(const PrismControl: TPrismControl;
  var HTMLControl: string);
begin
  inherited;

  // Intercept HTML
  {
    if PrismControl.VCLComponent = Edit1 then
    begin
    HTMLControl:= '</>';
    end;
  }
end;

end.
