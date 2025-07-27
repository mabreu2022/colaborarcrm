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

  D2Bridge.Interfaces,
  D2Bridge.BaseClass,
  D2Bridge.Item,
  D2Bridge.ItemCommon.Add,
  D2Bridge.Item.HTML.Tabs,
  D2Bridge.Item.HTML.Row,
  D2Bridge.Item.HTML.FormGroup,
  D2Bridge.Item.HTML.PanelGroup,
  D2Bridge.Item.VCLObj,

  D2Bridge.Forms;

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
    btnNovo: TButton;
    btnEditar: TButton;
    btnExcluir: TButton;
    btnCancelar: TButton;
    cbAgendamentos: TCheckBox;
    cbPerfis: TCheckBox;
    cbPermissoes: TCheckBox;
    cbRelatorios: TCheckBox;
    cbUsuarios: TCheckBox;
    cbFormas: TCheckBox;
    cbAtivos: TCheckBox;
    cbClientes: TCheckBox;
    cbContratos: TCheckBox;
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbPerfilCloseUp(Sender: TObject);
  private
    { Private declarations }
    FListaChecks: TList<TCheckBox>;
    FPerfilAtual: Variant;

    procedure CarregarItensMenu;
    function GerarCheckboxesPermissao(const PerfilID: Integer)
      : TList<TCheckBox>;
    procedure LimparCheckboxes;
    function NomeSeguro(const Texto: string): string;
    procedure AtualizarPanelPermissoes;
    procedure ReexportarAbaPermissoes;
    procedure AtivarPermissoesFixas(const PerfilID: Integer);

  public
    { Public declarations }
  protected
    procedure ExportD2Bridge; override;
    procedure InitControlsD2Bridge(const PrismControl: TPrismControl); override;
    procedure RenderD2Bridge(const PrismControl: TPrismControl;
      var HTMLControl: string); override;
  end;

function FrmControleDeUsuarios: TFrmControleDeUsuarios;

implementation

Uses
  ContratosWebApp,
  uDM;

{$R *.dfm}

procedure TFrmControleDeUsuarios.AtivarPermissoesFixas(const PerfilID: Integer);
var
  NomeTela: string;

  procedure AtivarSeTiverPermissao(Check: TCheckBox);
  begin
    NomeTela := Form1.RemoverAcentos(Trim(Check.Caption));
    if DM.qryPermissoes.Locate('NOME_TELA', NomeTela, [loCaseInsensitive]) and
      DM.qryPermissoes.FieldByName('PODE_ACESSAR').AsBoolean then
      Check.Checked := True
    else
      Check.Checked := False;
  end;

begin
  with DM.qryPermissoes do
  begin
    Close;
    SQL.Text :=
      'SELECT NOME_TELA, PODE_ACESSAR FROM PERMISSOES WHERE ID_PERFIL = :ID';
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

    AtivarPermissoesFixas(cbperfil.KeyValue);
    ReexportarAbaPermissoes;
    //CarregarItensMenu;
  end;

end;

procedure TFrmControleDeUsuarios.ExportD2Bridge;
begin
  inherited;

  // Como libero todos os itens exportados anteriormente
  // D2Bridge.PrismControlFromID('Permissoes').RefreshHTMLControl;

  Title := 'Controle de Usuários';

  // Libera FListaChecks se já existir
  if Assigned(FListaChecks) then
  begin
    FListaChecks.Free;
    FListaChecks := nil;
  end;

  // Preparar os checkboxes com base no perfil selecionado
  // FListaChecks := GerarCheckboxesPermissao(DM.PerfilID);
  AtivarPermissoesFixas(DM.PerfilID);

  // TemplateClassForm:= TD2BridgeFormTemplate;
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

          end;

        end;
        with AddTab('Perfis').Items.Add do
        begin
          with Row.Items.Add do
          begin

          end;

        end;

        with AddTab('Permissões').Items.Add do
        begin
          with Row.Items.Add do
          begin
            FormGroup(lblPerfil.Caption).AddVCLObj(cbPerfil);
          end;

          // with Row.Items.Add do
          // begin
          // for var k := 0 to FListaChecks.Count - 1 do
          // begin
          // with PanelGroup('Permissoes').Items.Add do
          // VCLObj(FListaChecks[k]);
          // end;
          // end;
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
        end;

        with Row.Items.Add do
        begin
          FormGroup('').AddVCLObj(btnNovo, CSSClass.Button.Add);
          FormGroup('').AddVCLObj(btnEditar, CSSClass.Button.Edit);
          FormGroup('').AddVCLObj(btnExcluir, CSSClass.Button.delete);
          // FormGroup('').AddVCLObj(btnSalvar, CSSClass.Button.save);
          FormGroup('').AddVCLObj(btnCancelar, CSSClass.Button.Cancel);
        end;

      end;

  end;

end;

procedure TFrmControleDeUsuarios.FormDestroy(Sender: TObject);
begin
  FListaChecks.Free;
end;

procedure TFrmControleDeUsuarios.FormShow(Sender: TObject);
begin
  DM.qryPerfis.Active := True;
  DM.qryPermissoes.Active := True;
end;

function TFrmControleDeUsuarios.GerarCheckboxesPermissao(const PerfilID
  : Integer): TList<TCheckBox>;
var
  i, j, PosY: Integer;
  Qry: TFDQuery;
  Check: TCheckBox;
  NomeTela, NomeComp: string;
  TemPermissao: Boolean;
begin
  PosY := 20;
  FListaChecks := TObjectList<TCheckBox>.Create(True);
  Result := FListaChecks;

  Qry := TFDQuery.Create(nil);
  try
    Qry.Close;
    Qry.Connection := DM.Conn;
    Qry.SQL.Text :=
      'SELECT NOME_TELA, PODE_ACESSAR FROM PERMISSOES WHERE ID_PERFIL = :ID AND PODE_ACESSAR = TRUE';
    Qry.ParamByName('ID').AsInteger := PerfilID;
    Qry.Open;

    ShowMessage('Perfil Técnico tem : ' + IntToStr(Qry.recordcount));

    for i := 0 to Form1.MainMenu1.Items.Count - 1 do
    begin
      NomeTela := Form1.RemoverAcentos(Trim(Form1.MainMenu1.Items[i].Caption));
      TemPermissao := Qry.Locate('NOME_TELA', NomeTela, [loCaseInsensitive]);

      Check := TCheckBox.Create(Self);
      Check.Caption := Form1.MainMenu1.Items[i].Caption;
      Check.Checked := TemPermissao and Qry.FieldByName('PODE_ACESSAR')
        .AsBoolean;
      Check.Left := 20;
      Check.Top := PosY;
      Check.Width := 300;

      NomeComp := 'Check_' + NomeSeguro(Check.Caption);
      if FindComponent(NomeComp) = nil then
        Check.Name := NomeComp;

      Check.Parent := Self;
      FListaChecks.Add(Check);
      PosY := PosY + 30;

      for j := 0 to Form1.MainMenu1.Items[i].Count - 1 do
      begin
        NomeTela := Form1.RemoverAcentos
          (Trim(Form1.MainMenu1.Items[i].Items[j].Caption));
        TemPermissao := Qry.Locate('NOME_TELA', NomeTela, [loCaseInsensitive]);

        Check := TCheckBox.Create(Self);
        Check.Caption := Form1.MainMenu1.Items[i].Items[j].Caption;
        Check.Checked := TemPermissao and Qry.FieldByName('PODE_ACESSAR')
          .AsBoolean;
        Check.Left := 40;
        Check.Top := PosY;
        Check.Width := 300;

        NomeComp := 'Check_' + NomeSeguro(Check.Caption);
        if FindComponent(NomeComp) = nil then
          Check.Name := NomeComp;

        Check.Parent := Self;
        FListaChecks.Add(Check);
        PosY := PosY + 30;
      end;
    end;
  finally
    Qry.Free;
  end;
end;

procedure TFrmControleDeUsuarios.InitControlsD2Bridge(const PrismControl
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

procedure TFrmControleDeUsuarios.AtualizarPanelPermissoes;
begin
  // Criar nova estrutura visual dentro da aba de Permissões
  // não passou pela carga do banco?
  with D2Bridge.Items.Add do
    with Row.Items.Add do
      with Tabs.AddTab(PageControl1.Pages[2].Caption).Items.Add do
      begin
        for var k := 0 to FListaChecks.Count - 1 do
        begin
          with PanelGroup('Permissoes').Items.Add do
            VCLObj(FListaChecks[k]);
        end;
      end;
end;

procedure TFrmControleDeUsuarios.LimparCheckboxes;
begin

  if Assigned(FListaChecks) then
  begin
    // Remove visualmente da tela, se necessário
    for var Check in FListaChecks do
      Check.Parent := nil;

    // Libera os objetos e a lista com segurança
    // FListaChecks.Clear; // destrói os checkboxes
    // FreeAndNil(FListaChecks); // remove a lista da memória
  end;
end;

function TFrmControleDeUsuarios.NomeSeguro(const Texto: string): string;
begin
  Result := StringReplace(Texto, ' ', '_', [rfReplaceAll]);
  Result := StringReplace(Result, '-', '_', [rfReplaceAll]);
  Result := StringReplace(Result, '&', '', [rfReplaceAll]);
  Result := StringReplace(Result, '.', '', [rfReplaceAll]);
  Result := StringReplace(Result, ',', '', [rfReplaceAll]);
  Result := StringReplace(Result, '''', '', [rfReplaceAll]);
  Result := StringReplace(Result, '"', '', [rfReplaceAll]);
  Result := StringReplace(Result, 'ç', 'c', [rfReplaceAll]);
  Result := StringReplace(Result, 'á', 'a', [rfReplaceAll]);
  Result := StringReplace(Result, 'é', 'e', [rfReplaceAll]);
  Result := StringReplace(Result, 'í', 'i', [rfReplaceAll]);
  Result := StringReplace(Result, 'ó', 'o', [rfReplaceAll]);
  Result := StringReplace(Result, 'ú', 'u', [rfReplaceAll]);
  Result := StringReplace(Result, 'ã', 'a', [rfReplaceAll]);
  Result := StringReplace(Result, 'ô', 'o', [rfReplaceAll]);
  Result := StringReplace(Result, 'ê', 'e', [rfReplaceAll]);
  Result := LowerCase(Result);
end;

procedure TFrmControleDeUsuarios.ReexportarAbaPermissoes;
begin

  with D2Bridge Do
  begin
    if PrismControlFromID('TabControl01').IsTabs then
    begin
      PrismControlFromID('TabControl01').AsTabs.ActiveTabIndex := 1;

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
              FormGroup('').AddVCLObj(btnNovo, CSSClass.Button.Add);
              FormGroup('').AddVCLObj(btnEditar, CSSClass.Button.Edit);
              FormGroup('').AddVCLObj(btnExcluir, CSSClass.Button.delete);
              FormGroup('').AddVCLObj(btnCancelar, CSSClass.Button.Cancel);
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
