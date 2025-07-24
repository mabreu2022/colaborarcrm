unit uView.ControleDeUsuarios;

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
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbPerfilCloseUp(Sender: TObject);
    procedure cbPerfilClick(Sender: TObject);
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

function FrmControleDeUsuarios: TFrmControleDeUsuarios;
begin
  result := TFrmControleDeUsuarios(TFrmControleDeUsuarios.GetInstance);
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

//procedure TFrmControleDeUsuarios.LimparLayoutPermissoesD2Bridge;
//begin
////   try
////    // Limpa o grupo 'Permissoes' da aba 2
////    // Isso depende do framework permitir algo como:
////    with D2Bridge.Items.Add do
////    Tabs[2].Items.Clear; //ou PanelGroup('Permissoes').Items.Clear;
////
////
////  except
////    on E: Exception do
////      OutputDebugString(PChar('Erro ao limpar layout D2Bridge: ' + E.Message));
////  end;
//
//end;

procedure TFrmControleDeUsuarios.cbPerfilClick(Sender: TObject);
begin
  //LimparLayoutPermissoesD2Bridge;     // primeiro: limpar layout renderizado
  LimparCheckboxes;                   // segundo: destruir objetos visuais
  FListaChecks := GerarCheckboxesPermissao(cbPerfil.KeyValue); // recriar
  ReexportarAbaPermissoes;            // reexportar visual completo
end;

procedure TFrmControleDeUsuarios.cbPerfilCloseUp(Sender: TObject);
begin
  if not VarIsNull(cbPerfil.KeyValue) then
  begin
    if FPerfilAtual <> cbPerfil.KeyValue then
    begin
      FPerfilAtual := cbPerfil.KeyValue;
      LimparCheckboxes;
      FListaChecks := GerarCheckboxesPermissao(FPerfilAtual);
      ReexportarAbaPermissoes;
      //ExportD2Bridge; // ou apenas recriar o painel de permissões
    end;
  end;
end;

procedure TFrmControleDeUsuarios.ExportD2Bridge;
begin
  inherited;

  Title := 'Contrle de Usuários';

  // Preparar os checkboxes com base no perfil selecionado
  FListaChecks := GerarCheckboxesPermissao(DM.PerfilID);

  // TemplateClassForm:= TD2BridgeFormTemplate;
  D2Bridge.FrameworkExportType.TemplateMasterHTMLFile := '';
  D2Bridge.FrameworkExportType.TemplatePageHTMLFile := '';

  with D2Bridge.Items.Add do
  begin
    with Row.Items.Add do
      with Tabs do
      begin
        with AddTab(PageControl1.Pages[0].Caption).Items.Add do
        begin
          with Row.Items.Add do
          begin

          end;

        end;
        with AddTab(PageControl1.Pages[1].Caption).Items.Add do
        begin
          with Row.Items.Add do
          begin

          end;

        end;

        with AddTab(PageControl1.Pages[2].Caption).Items.Add do
        begin
          with Row.Items.Add do
          begin
            FormGroup(lblPerfil.Caption).AddVCLObj(cbPerfil);
          end;

          with Row.Items.Add do
          begin
            for var k := 0 to FListaChecks.Count - 1 do
            begin
              with PanelGroup('Permissoes').Items.Add do
                VCLObj(FListaChecks[k]);
            end;
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
  DM.qryPerfis.Active := true;
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
  FListaChecks := TList<TCheckBox>.Create;
  result := FListaChecks;

  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := DM.Conn;
    Qry.SQL.Text :=
      'SELECT NOME_TELA, PODE_ACESSAR FROM PERMISSOES WHERE ID_PERFIL = :ID';
    Qry.ParamByName('ID').AsInteger := PerfilID;
    Qry.Open;

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
var
  i: Integer;
  Check: TCheckBox;
begin
  if Assigned(FListaChecks) then
  begin
    for i := 0 to FListaChecks.Count - 1 do
    begin
      Check := FListaChecks[i];
      if Assigned(Check) and not(csDestroying in Check.ComponentState) then
      begin
        Check.Visible := False;
        Check.Parent := nil;
        Check.Free;
      end;
    end;
    FListaChecks.Clear;
    FreeAndNil(FListaChecks);
  end;

end;

function TFrmControleDeUsuarios.NomeSeguro(const Texto: string): string;
begin
  result := StringReplace(Texto, ' ', '_', [rfReplaceAll]);
  result := StringReplace(result, '-', '_', [rfReplaceAll]);
  result := StringReplace(result, '&', '', [rfReplaceAll]);
  result := StringReplace(result, '.', '', [rfReplaceAll]);
  result := StringReplace(result, ',', '', [rfReplaceAll]);
  result := StringReplace(result, '''', '', [rfReplaceAll]);
  result := StringReplace(result, '"', '', [rfReplaceAll]);
  result := StringReplace(result, 'ç', 'c', [rfReplaceAll]);
  result := StringReplace(result, 'á', 'a', [rfReplaceAll]);
  result := StringReplace(result, 'é', 'e', [rfReplaceAll]);
  result := StringReplace(result, 'í', 'i', [rfReplaceAll]);
  result := StringReplace(result, 'ó', 'o', [rfReplaceAll]);
  result := StringReplace(result, 'ú', 'u', [rfReplaceAll]);
  result := StringReplace(result, 'ã', 'a', [rfReplaceAll]);
  result := StringReplace(result, 'ô', 'o', [rfReplaceAll]);
  result := StringReplace(result, 'ê', 'e', [rfReplaceAll]);
  result := LowerCase(result);
end;

procedure TFrmControleDeUsuarios.ReexportarAbaPermissoes;
begin
  LimparCheckboxes;
  FListaChecks := GerarCheckboxesPermissao(cbPerfil.KeyValue);

  with D2Bridge.Items.Add do
    with Row.Items.Add do
      with Tabs.AddTab(PageControl1.Pages[2].Caption).Items.Add do
      begin
        with Row.Items.Add do
          FormGroup(lblPerfil.Caption).AddVCLObj(cbPerfil);

        with Row.Items.Add do
        begin
          for var k := 0 to FListaChecks.Count - 1 do
          begin
            with PanelGroup('Permissoes').Items.Add do
              VCLObj(FListaChecks[k]);
          end;
        end;

        with Row.Items.Add do
        begin
          FormGroup('').AddVCLObj(btnNovo, CSSClass.Button.Add);
          FormGroup('').AddVCLObj(btnEditar, CSSClass.Button.Edit);
          FormGroup('').AddVCLObj(btnExcluir, CSSClass.Button.Delete);
          FormGroup('').AddVCLObj(btnCancelar, CSSClass.Button.Cancel);
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
