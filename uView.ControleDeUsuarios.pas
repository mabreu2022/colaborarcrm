unit uView.ControleDeUsuarios;

{ Copyright 2025 / 2026 D2Bridge Framework by Talis Jonatas Gomes }

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ComCtrls,
  Vcl.DBCtrls,
  Vcl.ExtCtrls,
  Vcl.CheckLst,
  System.Generics.Collections,

  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Phys.FB,
  FireDAC.Phys.FBDef,
  FireDAC.VCLUI.Wait,
  FireDAC.Phys.IBBase,
  Data.DB,
  FireDAC.Comp.Client,
  FireDAC.Stan.Param,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.DApt,
  FireDAC.Comp.DataSet,
  Unit1,
  uDM,

  D2Bridge.Interfaces,
  D2Bridge.BaseClass,
  D2Bridge.Item,
  D2Bridge.ItemCommon.Add,
  D2Bridge.Item.HTML.Tabs,
  D2Bridge.Item.HTML.Row,
  D2Bridge.Item.HTML.FormGroup,
  D2Bridge.Item.HTML.PanelGroup,
  D2Bridge.Item.VCLObj,

  D2Bridge.Forms, Vcl.Grids, Vcl.DBGrids;

type
  TFrmControleDeUsuarios = class(TForm1)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    CheckListBoxItens: TCheckListBox;
    Panel1: TPanel;
    Panel2: TPanel;
    cbPerfil: TDBLookupComboBox;
    lblPerfil: TLabel;
    btnNovoPermissoes: TButton;
    btnEditarPermissoes: TButton;
    btnExcluirPermissoes: TButton;
    btnCancelarPermissoes: TButton;
    cbAgendamentos: TCheckBox;
    cbPerfis: TCheckBox;
    cbPermissoes: TCheckBox;
    cbRelatorios: TCheckBox;
    cbUsuarios: TCheckBox;
    cbFormas: TCheckBox;
    cbAtivos: TCheckBox;
    cbClientes: TCheckBox;
    cbContratos: TCheckBox;
    btnSalvarPermissoes: TButton;
    Panel3: TPanel;
    btnNovoUsuario: TButton;
    btnEditarUsuario: TButton;
    btnSalvarUsuario: TButton;
    btnExcluirUsuario: TButton;
    btnCancelarUsuario: TButton;
    edtNomeUsuario: TEdit;
    edtSenhaUsuario: TEdit;
    edtEmailUsuario: TEdit;
    cbPerfilUsuario: TDBLookupComboBox;
    lblNomeUsuario: TLabel;
    lblSenhaUsuario: TLabel;
    lblEmailUsuario: TLabel;
    lblPerfilUsuario: TLabel;
    Panel4: TPanel;
    btnSalvarPerfis: TButton;
    btnNovoPerfis: TButton;
    btnEditarPerfis: TButton;
    btnExcluirPerfis: TButton;
    btnCancelarPerfis: TButton;
    edtNomePerfil: TEdit;
    edtDescricaoPerfil: TEdit;
    lblNomePerfil: TLabel;
    lblDescricaoPerfil: TLabel;
    cbNovo: TCheckBox;
    cbSalvar: TCheckBox;
    cbEditar: TCheckBox;
    cbExcluir: TCheckBox;
    cbCancelar: TCheckBox;
    DBGrid1: TDBGrid;
    Panel5: TPanel;
    edtPesquisarUsuario: TEdit;
    lblPesquisarUsuario: TLabel;
    btnPesquisarUsuario: TButton;
    Panel6: TPanel;
    DBGrid_Perfil: TDBGrid;
    lblPesquisarPerfil: TLabel;
    edtPesquisarPerfil: TEdit;
    btnPesquisarPerfil: TButton;
    procedure FormShow(Sender: TObject);
    procedure cbPerfilCloseUp(Sender: TObject);
    procedure btnNovoUsuarioClick(Sender: TObject);
    procedure btnSalvarUsuarioClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnEditarUsuarioClick(Sender: TObject);
    procedure btnExcluirUsuarioClick(Sender: TObject);
  private
    procedure CarregarItensMenu;
    procedure ReexportarAbaPermissoes;
    procedure ListarUsuarios;

  public
    procedure AtivarPermissoesFixas(const PerfilID: Integer);
    procedure AtivarPermissaoPorComponente(const PerfilID: Integer;
      const NomeTela, NomeAcao: string; Componente: TControl);

  protected
    procedure ExportD2Bridge; override;
    procedure InitControlsD2Bridge(const PrismControl: TPrismControl); override;
    procedure RenderD2Bridge(const PrismControl: TPrismControl;
      var HTMLControl: string); override;
  end;

function FrmControleDeUsuarios: TFrmControleDeUsuarios;

implementation

Uses
  ContratosWebApp;

{$R *.dfm}

procedure TFrmControleDeUsuarios.AtivarPermissaoPorComponente
  (const PerfilID: Integer; const NomeTela, NomeAcao: string;
  Componente: TControl);
begin
  with DM.qryPermissoes do
  begin
    Close;
    SQL.Text := 'SELECT PODE_EXECUTAR FROM PERMISSOES ' +
      'WHERE ID_PERFIL = :ID ' + 'AND NOME_TELA = :TELA ' + 'AND ACAO = :ACAO';
    ParamByName('ID').AsInteger := PerfilID;
    ParamByName('TELA').AsString := Form1.RemoverAcentos(Trim(NomeTela));
    ParamByName('ACAO').AsString := Form1.RemoverAcentos(Trim(NomeAcao));
    Open;
  end;

  if DM.qryPermissoes.RecordCount > 0 then
  begin
    if Componente is TCheckBox then
      TCheckBox(Componente).Checked := DM.qryPermissoes.FieldByName
        ('PODE_EXECUTAR').AsBoolean
    else if Componente is TButton then
      TButton(Componente).Enabled := DM.qryPermissoes.FieldByName
        ('PODE_EXECUTAR').AsBoolean;
  end;

end;

procedure TFrmControleDeUsuarios.AtivarPermissoesFixas(const PerfilID: Integer);
var
  NomeTela: string;
  NomeAcao: String;

  procedure AtivarSeTiverPermissao(Check: TCheckBox);
  begin
    NomeTela := Form1.RemoverAcentos(Trim(Check.Caption));
    if DM.qryPermissoes.Locate('NOME_TELA', NomeTela, [loCaseInsensitive]) and
      DM.qryPermissoes.FieldByName('PODE_ACESSAR').AsBoolean then
      Check.Checked := True
    else
      Check.Checked := False;
  end;

  procedure AtivarCheckBoxDosBotoesSeTiverPermissao(Check: TCheckBox);
  begin
    NomeAcao := Form1.RemoverAcentos(Trim(Check.Caption));
    if DM.qryPermissoes.Locate('ACAO', NomeAcao, [loCaseInsensitive]) and
      DM.qryPermissoes.FieldByName('PODE_EXECUTAR').AsBoolean then
      Check.Checked := True
    else
      Check.Checked := False;
  end;

  procedure AtivarBotoesSeTiverPermissao(Botao: TButton);
  begin
    NomeAcao := Form1.RemoverAcentos(Trim(Botao.Caption));
    if DM.qryPermissoes.Locate('ACAO', NomeAcao, [loCaseInsensitive]) and
      DM.qryPermissoes.FieldByName('PODE_EXECUTAR').AsBoolean then
      Botao.Enabled := True
    else
      Botao.Enabled := False;
  end;

begin
  with DM.qryPermissoes do
  begin
    Close;
    SQL.Text :=
      'SELECT NOME_TELA, PODE_ACESSAR, ACAO,PODE_EXECUTAR,EXIBE_BOTAO, LOG_ACAO FROM PERMISSOES WHERE ID_PERFIL = :ID';
    ParamByName('ID').AsInteger := PerfilID;
    Open;
  end;

  AtivarSeTiverPermissao(cbAgendamentos);
  AtivarSeTiverPermissao(cbAtivos);
  AtivarSeTiverPermissao(cbClientes);
  AtivarSeTiverPermissao(cbContratos);
  AtivarSeTiverPermissao(cbFormas);
  AtivarSeTiverPermissao(cbPerfis);
  AtivarSeTiverPermissao(cbPermissoes);
  AtivarSeTiverPermissao(cbRelatorios);
  AtivarSeTiverPermissao(cbUsuarios);

  // Checks Box sobre botões
  AtivarCheckBoxDosBotoesSeTiverPermissao(cbNovo);
  AtivarCheckBoxDosBotoesSeTiverPermissao(cbSalvar);
  AtivarCheckBoxDosBotoesSeTiverPermissao(cbEditar);
  AtivarCheckBoxDosBotoesSeTiverPermissao(cbExcluir);
  AtivarCheckBoxDosBotoesSeTiverPermissao(cbCancelar);

  // Teria que informar todos os botões do sistema

end;

procedure TFrmControleDeUsuarios.btnEditarUsuarioClick(Sender: TObject);
begin
  inherited;
  DM.qryUsuarios.Edit;
end;

procedure TFrmControleDeUsuarios.btnExcluirUsuarioClick(Sender: TObject);
begin
  inherited;
  if not DM.qryUsuarios.IsEmpty then
  begin
    if MessageDlg('Deseja inativar este usuário?', mtConfirmation,
      [mbYes, mbNo], 0) = mrYes then
    begin
      DM.qryUsuarios.Edit;
      DM.qryUsuarios.FieldByName('ATIVO').AsString := 'N';
      DM.qryUsuarios.Post;
    end;
    ListarUsuarios;
  end;
end;

procedure TFrmControleDeUsuarios.ListarUsuarios;
begin
  DM.ListarUsuarios(edtPesquisarUsuario.Text, cbPerfilUsuario.KeyValue);
end;

procedure TFrmControleDeUsuarios.btnNovoUsuarioClick(Sender: TObject);
begin
  inherited;
  edtNomeUsuario.Text := '';
  edtSenhaUsuario.Text := '';
  edtEmailUsuario.Text := '';
end;

procedure TFrmControleDeUsuarios.btnSalvarUsuarioClick(Sender: TObject);
begin
  inherited;
  DM.SalvarUsuario(edtNomeUsuario.Text, edtSenhaUsuario.Text,
    edtEmailUsuario.Text, cbPerfil.KeyValue);
end;

function FrmControleDeUsuarios: TFrmControleDeUsuarios;
begin
  Result := TFrmControleDeUsuarios(TFrmControleDeUsuarios.GetInstance);
end;

procedure TFrmControleDeUsuarios.CarregarItensMenu;
var
  i, j: Integer;
begin
  CheckListBoxItens.Clear;
  for i := 0 to Form1.MainMenu1.Items.Count - 1 do
  begin
    CheckListBoxItens.Items.Add(Form1.MainMenu1.Items[i].Caption);
    for j := 0 to Form1.MainMenu1.Items[i].Count - 1 do
      CheckListBoxItens.Items.Add('  ' + Form1.MainMenu1.Items[i].Items
        [j].Caption);
  end;
end;

procedure TFrmControleDeUsuarios.cbPerfilCloseUp(Sender: TObject);
begin
  if cbPerfil.ListSource.DataSet.Active and
    not cbPerfil.ListSource.DataSet.IsEmpty and not VarIsNull(cbPerfil.KeyValue)
  then
  begin
    AtivarPermissoesFixas(cbPerfil.KeyValue);
    ReexportarAbaPermissoes;
  end;

end;

procedure TFrmControleDeUsuarios.ExportD2Bridge;
begin
  inherited;

  Title := 'Controle de Usuários';

  // Preparar os checkboxes com base no perfil do login
  AtivarPermissoesFixas(DM.PerfilID);

  D2Bridge.FrameworkExportType.TemplateMasterHTMLFile := '';
  D2Bridge.FrameworkExportType.TemplatePageHTMLFile := '';

  with D2Bridge.Items.Add do
  begin
    with Row.Items.Add do
      with Tabs('TabControl01') do
      begin
        with AddTab('Cadastro').Items.Add do
        begin
          with Row.Items.Add do
          begin
            FormGroup(lblNomeUsuario.Caption).AddVCLObj(edtNomeUsuario);
            FormGroup(lblSenhaUsuario.Caption).AddVCLObj(edtSenhaUsuario);
            FormGroup(lblEmailUsuario.Caption).AddVCLObj(edtEmailUsuario);
            FormGroup(lblPerfilUsuario.Caption).AddVCLObj(cbPerfilUsuario);
          end;
//          with Row.Items.Add do
//          begin
//            VCLObj(Label5, CSSClass.Space.margim_top5);
//          end;

          with Row.Items.Add do
          begin
            VCLObj(DBGrid1);
          end;

          with Row.Items.Add do
          begin
            FormGroup(lblPesquisarUsuario.Caption)
              .AddVCLObj(edtPesquisarUsuario);
            FormGroup('').AddVCLObj(btnPesquisarUsuario,
              CSSClass.Button.search);
          end;

          with Row.Items.Add do
          begin
            FormGroup('').AddVCLObj(btnNovoUsuario, CSSClass.Button.Add);
            FormGroup('').AddVCLObj(btnSalvarUsuario, CSSClass.Button.save);
            FormGroup('').AddVCLObj(btnEditarUsuario, CSSClass.Button.Edit);
            FormGroup('').AddVCLObj(btnExcluirUsuario, CSSClass.Button.delete);
            FormGroup('').AddVCLObj(btnCancelarUsuario, CSSClass.Button.Cancel);
          end;

        end;

        with AddTab('Perfis').Items.Add do
        begin
          with Row.Items.Add do
          begin
            FormGroup(lblNomePerfil.Caption).AddVCLObj(edtNomePerfil);
            FormGroup(lblDescricaoPerfil.Caption).AddVCLObj(edtDescricaoPerfil);
          end;
          with Row.Items.Add do
          begin
            VCLObj(DBGrid_Perfil);
          end;
          with Row.Items.Add do
          begin
            FormGroup(lblPesquisarPerfil.Caption).AddVCLObj(edtPesquisarPerfil);
            FormGroup('').AddVCLObj(btnPesquisarPerfil, CSSClass.Button.search);
          end;
          with Row.Items.Add do
          begin
            FormGroup('').AddVCLObj(btnNovoPerfis, CSSClass.Button.Add);
            FormGroup('').AddVCLObj(btnSalvarPerfis, CSSClass.Button.save);
            FormGroup('').AddVCLObj(btnEditarPerfis, CSSClass.Button.Edit);
            FormGroup('').AddVCLObj(btnExcluirPerfis, CSSClass.Button.delete);
            FormGroup('').AddVCLObj(btnCancelarPerfis, CSSClass.Button.Cancel);
          end;

        end;

        with AddTab('Permissões').Items.Add do
        begin
          with Row.Items.Add do
          begin
            FormGroup(lblPerfil.Caption).AddVCLObj(cbPerfil);
          end;

          with Row.Items.Add do
          begin
            FormGroup('').AddVCLObj(cbAgendamentos);
            FormGroup('').AddVCLObj(cbAtivos);
            FormGroup('').AddVCLObj(cbClientes);
            FormGroup('').AddVCLObj(cbContratos);
            FormGroup('').AddVCLObj(cbFormas);
            FormGroup('').AddVCLObj(cbPerfis);
            FormGroup('').AddVCLObj(cbPermissoes);
            FormGroup('').AddVCLObj(cbRelatorios);
            FormGroup('').AddVCLObj(cbUsuarios);
          end;

          with Row.Items.Add do
          begin
            FormGroup('').AddVCLObj(cbNovo);
            FormGroup('').AddVCLObj(cbSalvar);
            FormGroup('').AddVCLObj(cbEditar);
            FormGroup('').AddVCLObj(cbExcluir);
            FormGroup('').AddVCLObj(cbCancelar);
          end;

          with Row.Items.Add do
          begin
            FormGroup('').AddVCLObj(btnNovoPermissoes, CSSClass.Button.Add);
            FormGroup('').AddVCLObj(btnSalvarPermissoes, CSSClass.Button.save);
            FormGroup('').AddVCLObj(btnEditarPermissoes, CSSClass.Button.Edit);
            FormGroup('').AddVCLObj(btnExcluirPermissoes,
              CSSClass.Button.delete);
            FormGroup('').AddVCLObj(btnCancelarPermissoes,
              CSSClass.Button.Cancel);
          end;
        end;

      end;

  end;

end;

procedure TFrmControleDeUsuarios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DM.qryUsuarios.Active   := False;
  DM.qryPerfis.Active     := False;
  DM.qryPermissoes.Active := False;
end;

procedure TFrmControleDeUsuarios.FormShow(Sender: TObject);
begin
  DM.qryUsuarios.Active   := True;
  DM.qryPerfis.Active     := True;
  DM.qryPermissoes.Active := True;
end;

procedure TFrmControleDeUsuarios.InitControlsD2Bridge(const PrismControl
  : TPrismControl);
begin
  inherited;

  // Change Init Property of Prism Controls
  {
    if PrismControl.VCLComponent = Edit1 then
    PrismControl.AsEdit.DataType:= TPrismFieldType.PrismFieldTypeInteger;
 }
   if PrismControl.IsDBGrid then
   begin
     PrismControl.AsDBGrid.RecordsPerPage := 10;
     PrismControl.AsDBGrid.MaxRecords     := 2000;
   end;

end;

procedure TFrmControleDeUsuarios.ReexportarAbaPermissoes;
begin

  with D2Bridge Do
  begin
    if PrismControlFromID('TabControl01').IsTabs then
    begin
      PrismControlFromID('TabControl01').AsTabs.ActiveTabIndex := 2;

      with D2Bridge.Items.Add do
      begin
        PrismControlFromID('TabControl01').AsTabs.ShowTabs := False;
        with Row.Items.Add do
          with Tabs.AddTab(PageControl1.Pages[2].Caption).Items.Add do
          begin
            with Row.Items.Add do
              FormGroup(lblPerfil.Caption).AddVCLObj(cbPerfil);

            with Row.Items.Add do
            begin
              FormGroup(cbAgendamentos.Caption).AddVCLObj(cbAgendamentos);
              FormGroup(cbAtivos.Caption).AddVCLObj(cbAtivos);
              FormGroup(cbClientes.Caption).AddVCLObj(cbClientes);
              FormGroup(cbContratos.Caption).AddVCLObj(cbContratos);
              FormGroup(cbFormas.Caption).AddVCLObj(cbFormas);
              FormGroup(cbPerfis.Caption).AddVCLObj(cbPerfis);
              FormGroup(cbPermissoes.Caption).AddVCLObj(cbPermissoes);
              FormGroup(cbRelatorios.Caption).AddVCLObj(cbRelatorios);
              FormGroup(cbUsuarios.Caption).AddVCLObj(cbUsuarios);
            end;

            with Row.Items.Add do
            begin
              FormGroup('').AddVCLObj(cbAgendamentos);
              FormGroup('').AddVCLObj(cbAtivos);
              FormGroup('').AddVCLObj(cbClientes);
              FormGroup('').AddVCLObj(cbContratos);
              FormGroup('').AddVCLObj(cbFormas);
              FormGroup('').AddVCLObj(cbPerfis);
              FormGroup('').AddVCLObj(cbPermissoes);
              FormGroup('').AddVCLObj(cbRelatorios);
              FormGroup('').AddVCLObj(cbUsuarios);
            end;

            with Row.Items.Add do
            begin
              FormGroup('').AddVCLObj(btnNovoPermissoes, CSSClass.Button.Add);
              FormGroup('').AddVCLObj(btnSalvarPermissoes,
                CSSClass.Button.save);
              FormGroup('').AddVCLObj(btnEditarPermissoes,
                CSSClass.Button.Edit);
              FormGroup('').AddVCLObj(btnExcluirPermissoes,
                CSSClass.Button.delete);
              FormGroup('').AddVCLObj(btnCancelarPermissoes,
                CSSClass.Button.Cancel);
            end;
          end;
      end;

      PrismControlFromID('TabControl01').AsTabs.ShowTabs := True;
    end;
  end;

end;

procedure TFrmControleDeUsuarios.RenderD2Bridge(const PrismControl
  : TPrismControl; var HTMLControl: string);
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
