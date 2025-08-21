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
  Data.DB,
  Vcl.Grids,
  Vcl.DBGrids,
  D2Bridge.Forms;

type
  TFrmAgendamento = class(TForm1)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Listagem: TTabSheet;
    Panel1: TPanel;
    btnNovoAgendamento: TButton;
    btnEditarAgendamento: TButton;
    btnSalvarAgendamento: TButton;
    btnExcluirAgendamento: TButton;
    btnCancelarAgendamento: TButton;
    Panel2: TPanel;
    lblCliente: TLabel;
    lblContato: TLabel;
    lblContrato: TLabel;
    lblAtivo: TLabel;
    dblCliente: TDBLookupComboBox;
    dblContato: TDBLookupComboBox;
    dblContrato: TDBLookupComboBox;
    dblAtivo: TDBLookupComboBox;
    lblDataRetirada: TLabel;
    dtpDataRetirada: TDateTimePicker;
    lblObservacoes: TLabel;
    lblDataPrevistaDeDevolucao: TLabel;
    dtpDataPrevistaDevolucao: TDateTimePicker;
    lblDataDevolucao: TLabel;
    dtpDataDaDevolucao: TDateTimePicker;
    lblMotivoStatus: TLabel;
    dblMotivoStatus: TDBLookupComboBox;
    memoObservacao: TMemo;
    Panel3: TPanel;
    dbgListaEquipamentosLocados: TDBGrid;
    Panel4: TPanel;
    lblListaDeEquipamentos: TLabel;
    dbgLocados: TDBGrid;
    Panel5: TPanel;
    lblPessuisarNumeroDeSerie: TLabel;
    edtPesquisarNumeroDeSerie: TEdit;
    btnPesquisarNumeroDeSerie: TButton;
    btnFechar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblClienteCloseUp(Sender: TObject);
    procedure dblContratoCloseUp(Sender: TObject);
    procedure btnNovoAgendamentoClick(Sender: TObject);
    procedure btnEditarAgendamentoClick(Sender: TObject);
    procedure btnSalvarAgendamentoClick(Sender: TObject);
    procedure btnCancelarAgendamentoClick(Sender: TObject);
    procedure btnExcluirAgendamentoClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnPesquisarNumeroDeSerieClick(Sender: TObject);
  private
    btnnovoApertado: Boolean;
    procedure HabilitarCampos(AHabilitar: Boolean);
    procedure LimparCampos;
    function ValidarCampos: Boolean;
    procedure PesquisarAgendamento;
  public

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

procedure TFrmAgendamento.dblClienteCloseUp(Sender: TObject);
begin
  inherited;
  DM.PreenchecblContatos(dblCliente.KeyValue);
  DM.PreencheContratos(dblCliente.keyvalue);
end;

procedure TFrmAgendamento.dblContratoCloseUp(Sender: TObject);
begin
  inherited;
  DM.ListarEquipamentosPorContrato(dblContrato.KeyValue, btnnovoApertado);
end;

procedure TFrmAgendamento.btnNovoAgendamentoClick(Sender: TObject);
begin
  inherited;
  btnnovoApertado := True;

  DM.qryAgenda.Append;

  LimparCampos;
  HabilitarCampos(True);


  btnNovoAgendamento.Enabled     := False;
  btnEditarAgendamento.Enabled   := False;
  btnSalvarAgendamento.Enabled   := True;
  btnCancelarAgendamento.Enabled := True;
  btnExcluirAgendamento.Enabled  := False;

end;

procedure TFrmAgendamento.btnPesquisarNumeroDeSerieClick(Sender: TObject);
begin
  inherited;
  PesquisarAgendamento;
end;

procedure TFrmAgendamento.PesquisarAgendamento;
begin
  DM.BuscarAtivosLocados(edtPesquisarNumeroDeSerie.Text);
end;

procedure TFrmAgendamento.btnEditarAgendamentoClick(Sender: TObject);
begin
  inherited;
  if DM.qryAgenda.IsEmpty then
  begin
    ShowMessage('Selecione um agendamento para editar!');
    Exit;
  end;

  DM.qryAgenda.Edit;
  HabilitarCampos(True);

  btnNovoAgendamento.Enabled     := False;
  btnEditarAgendamento.Enabled   := False;
  btnSalvarAgendamento.Enabled   := True;
  btnCancelarAgendamento.Enabled := True;
  btnExcluirAgendamento.Enabled  := False;

  dblCliente.SetFocus;
end;

procedure TFrmAgendamento.btnSalvarAgendamentoClick(Sender: TObject);
begin
  inherited;
  if not ValidarCampos then
    Exit;
  
  try
    DM.qryAgenda.FieldByName('ID_CLIENTE').AsVariant               := dblCliente.KeyValue;
    DM.qryAgenda.FieldByName('ID_CONTATO').AsVariant               := dblContato.KeyValue;
    DM.qryAgenda.FieldByName('ID_CONTRATO').AsVariant              := dblContrato.KeyValue;
    DM.qryAgenda.FieldByName('ID_ATIVO').AsVariant                 := dblAtivo.KeyValue;
    DM.qryAgenda.FieldByName('DATA_RETIRADA').AsDateTime           := dtpDataRetirada.DateTime;
    DM.qryAgenda.FieldByName('DATA_DEVOLUCAO_PREVISTA').AsDateTime := dtpDataPrevistaDevolucao.DateTime;
    DM.qryAgenda.FieldByName('DATA_DEVOLUCAO').AsDateTime          := dtpDataDaDevolucao.DateTime;
    DM.qryAgenda.FieldByName('OBSERVACAO').AsString                := memoObservacao.Text;
    DM.qryAgenda.FieldByName('ID_STATUS').AsVariant                := dblMotivoStatus.KeyValue;

    DM.qryAgenda.Post;
    ShowMessage('Agendamento salvo com sucesso!');

  except
    on E: Exception do
    begin
      ShowMessage('Erro ao salvar o agendamento: ' + E.Message);
      DM.qryAgenda.Cancel;
    end;
  end;
end;

procedure TFrmAgendamento.btnFecharClick(Sender: TObject);
begin
  inherited;
  Self.Close;
end;

procedure TFrmAgendamento.btnCancelarAgendamentoClick(Sender: TObject);
begin
  inherited;
  DM.qryAgenda.Cancel;

  HabilitarCampos(True);

  btnNovoAgendamento.Enabled     := True;
  btnEditarAgendamento.Enabled   := True;
  btnSalvarAgendamento.Enabled   := False;
  btnCancelarAgendamento.Enabled := False;
  btnExcluirAgendamento.Enabled  := True;
  
  ShowMessage('Operação cancelada!');
end;

procedure TFrmAgendamento.btnExcluirAgendamentoClick(Sender: TObject);
begin
  inherited;
  if DM.qryAgenda.IsEmpty then
  begin
    ShowMessage('Selecione um agendamento para excluir!');
    Exit;
  end;
  
  if MessageDlg('Deseja realmente excluir este agendamento?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    try
      DM.qryAgenda.Delete;
      ShowMessage('Agendamento excluído com sucesso!');
    except
      on E: Exception do
        ShowMessage('Erro ao excluir o agendamento: ' + E.Message);
    end;
  end;
end;

procedure TFrmAgendamento.ExportD2Bridge;
begin
  inherited;

  Title:= 'Cadastro de Agendamentos';

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
            VCLObj(lblListaDeEquipamentos);
            VCLObj(dbgListaEquipamentosLocados);
          end;

          with Row.Items.Add do
          begin
            FormGroup('').AddVCLObj(btnNovoAgendamento, CSSClass.Button.Add);
            FormGroup('').AddVCLObj(btnSalvarAgendamento, CSSClass.Button.save);
            FormGroup('').AddVCLObj(btnEditarAgendamento, CSSClass.Button.Edit);
            FormGroup('').AddVCLObj(btnExcluirAgendamento, CSSClass.Button.delete);
            FormGroup('').AddVCLObj(btnCancelarAgendamento, CSSClass.Button.Cancel);
            FormGroup('').AddVCLObj(btnFechar, CSSClass.Button.Add);
          end;

        end;

        with AddTab('Locados').Items.Add do
        begin
          with Row.Items.Add do
          begin
            FormGroup(lblPessuisarNumeroDeSerie.Caption).AddVCLObj(edtPesquisarNumeroDeSerie);
            FormGroup('').AddVCLObj(btnPesquisarNumeroDeserie, CSSClass.Button.search);
          end;
          with Row.Items.Add do
          begin
            VCLObj(dbgLocados);
          end;

        end;

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
  DM.qryEquipamentosLocados.Active := False;
  DM.qryAgenda.Active    := False;
end;

procedure TFrmAgendamento.HabilitarCampos(AHabilitar: Boolean);
begin

  dblCliente.Enabled               := AHabilitar;
  dblContato.Enabled               := AHabilitar;
  dblContrato.Enabled              := AHabilitar;
  dblAtivo.Enabled                 := AHabilitar;
  dtpDataRetirada.Enabled          := AHabilitar;
  dtpDataPrevistaDevolucao.Enabled := AHabilitar;
  dtpDataDaDevolucao.Enabled       := AHabilitar;
  dblMotivoStatus.Enabled          := AHabilitar;
  memoObservacao.Enabled           := AHabilitar;
end;

procedure TFrmAgendamento.LimparCampos;
begin

  dblCliente.KeyValue           := null;
  dblContato.KeyValue           := null;
  dblContrato.KeyValue          := null;
  dblAtivo.KeyValue             := null;
  dtpDataRetirada.Date          := Date;
  dtpDataPrevistaDevolucao.Date := Date + 30;
  dtpDataDaDevolucao.Date       := Date;
  dblMotivoStatus.KeyValue      := null;
  memoObservacao.Lines.Clear;
end;

function TFrmAgendamento.ValidarCampos: Boolean;
begin
  Result := True;

  if dblCliente.KeyValue = null then
  begin
    ShowMessage('Selecione um cliente!');
    dblCliente.SetFocus;
    Result := False;
    Exit;
  end;
  
  if dblContato.KeyValue = null then
  begin
    ShowMessage('Selecione um contato!');
    dblContato.SetFocus;
    Result := False;
    Exit;
  end;
  
  if dblContrato.KeyValue = null then
  begin
    ShowMessage('Selecione um contrato!');
    dblContrato.SetFocus;
    Result := False;
    Exit;
  end;
  
  if dblAtivo.KeyValue = null then
  begin
    ShowMessage('Selecione um ativo!');
    dblAtivo.SetFocus;
    Result := False;
    Exit;
  end;
  
  if dblMotivoStatus.KeyValue = null then
  begin
    ShowMessage('Selecione um status!');
    dblMotivoStatus.SetFocus;
    Result := False;
    Exit;
  end;
  
  // Validação das datas
  if dtpDataPrevistaDevolucao.Date < dtpDataRetirada.Date then
  begin
    ShowMessage('A data prevista de devolução não pode ser anterior à data de retirada!');
    dtpDataPrevistaDevolucao.SetFocus;
    Result := False;
    Exit;
  end;
end;

procedure TFrmAgendamento.FormCreate(Sender: TObject);
begin
  DM.qryCliente.Active             := True;
  DM.qryContatos.Active            := True;
  DM.qryStatus.Active              := True;
  DM.qryAtivos.Active              := True;
  DM.qryContratos.Active           := True;
  DM.qryEquipamentosLocados.Active := True;
  DM.qryAgenda.Active              := True;
end;

procedure TFrmAgendamento.InitControlsD2Bridge(const PrismControl: TPrismControl);
begin
 inherited;

  if PrismControl.VCLComponent = memoObservacao then
    PrismControl.AsMemo.Rows := 10;


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