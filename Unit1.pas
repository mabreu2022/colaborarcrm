unit Unit1;

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
  Vcl.Menus,
  Vcl.ComCtrls,
  D2BridgeFormTemplate,

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
  ShellAPI,

  D2Bridge.Interfaces,
  D2Bridge.Instance,
  D2Bridge.Forms;

type
  TForm1 = class(TD2BridgeForm)
    MainMenu1: TMainMenu;
    Module11: TMenuItem;
    AppModule21: TMenuItem;
    Cliente1: TMenuItem;
    Ativos1: TMenuItem;
    Contratos1: TMenuItem;
    Clientes2: TMenuItem;
    odosContratosdoCliente1: TMenuItem;
    ContratoporID1: TMenuItem;
    FormasdePagamento1: TMenuItem;
    Contratos2: TMenuItem;
    AtivosdoContrato1: TMenuItem;
    N1: TMenuItem;
    Contratos3: TMenuItem;
    Listagemcontratosativos1: TMenuItem;
    Listagemcontratosinativos1: TMenuItem;
    ListagememAberto1: TMenuItem;
    Agendamendo1: TMenuItem;
    Usuarios1: TMenuItem;
    Perfis1: TMenuItem;
    Permisses1: TMenuItem;
    StatusBar1: TStatusBar;
    LogOff1: TMenuItem;
    ListagemdeClientes1: TMenuItem;
    procedure Module11Click(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure Cliente1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Permisses1Click(Sender: TObject);
    procedure LogOff1Click(Sender: TObject);
    procedure Usuarios1Click(Sender: TObject);
    procedure Perfis1Click(Sender: TObject);
    procedure Ativos1Click(Sender: TObject);
    procedure ListagemdeClientes1Click(Sender: TObject);
    procedure Agendamendo1Click(Sender: TObject);
    procedure sair1Click(Sender: TObject);
    procedure Contratos2Click(Sender: TObject);
  private
    JaCarregouPermissoes: Boolean;

  public

    procedure HabilitarItemMenu(const NomeTela: string);
    procedure ExportarListaDeTelas;
    procedure ResetarMenus;
    function RemoverAcentos(const Texto: string): string;
    procedure CarregarPermissoesUsuario;

  protected

    procedure ExportD2Bridge; override;
    procedure InitControlsD2Bridge(const PrismControl: TPrismControl); override;
    procedure RenderD2Bridge(const PrismControl: TPrismControl;
      var HTMLControl: string); override;
  end;

Function Form1: TForm1;

implementation

Uses
  ContratosWebApp,
  uView.Clientes,
  uDM,
  uView.ControleDeUsuarios, Unit_Login, uView.Ativos, uView.Relatorios,
  uView.Agendamento, uView.Contratos;

Function Form1: TForm1;
begin
  Result := TForm1(TForm1.GetInstance);
end;

{$R *.dfm}
{ TForm1 }

procedure TForm1.Agendamendo1Click(Sender: TObject);
begin
   if FrmAgendamento = nil then
    TFrmAgendamento.CreateInstance;

  FrmAgendamento.ShowModal;
end;

procedure TForm1.Ativos1Click(Sender: TObject);
begin
  if FrmAtivos = nil then
    TFrmAtivos.CreateInstance;

  FrmAtivos.ShowModal;
end;

procedure TForm1.CarregarPermissoesUsuario;
var
  QryPerm: TFDQuery;
begin
  QryPerm := TFDQuery.Create(nil);
  try
    QryPerm.Connection := DM.Conn;
    QryPerm.SQL.Text := 'SELECT NOME_TELA FROM PERMISSOES WHERE ID_PERFIL = :ID AND PODE_ACESSAR = TRUE';
    QryPerm.ParamByName('ID').AsInteger := DM.PerfilID;
    QryPerm.Open;

    //ShowMessage('O usuário tem acesso a : ' + IntToStr(QryPerm.RecordCount));

    while not QryPerm.Eof do
    begin
      HabilitarItemMenu(QryPerm.FieldByName('NOME_TELA').AsString);
      QryPerm.Next;
    end;
  finally
    QryPerm.Free;
  end;
end;

procedure TForm1.Cliente1Click(Sender: TObject);
begin
  if FrmClientes = nil then
    TFrmClientes.CreateInstance;

  FrmClientes.ShowModal;
end;

procedure TForm1.Clientes1Click(Sender: TObject);
begin
  if FrmClientes = nil then
    TFrmClientes.CreateInstance;

  FrmClientes.ShowModal;
end;

procedure TForm1.Contratos2Click(Sender: TObject);
begin
  if FrmContratos = nil then
    TFrmContratos.CreateInstance;

  FrmContratos.ShowModal;
end;

procedure TForm1.ExportarListaDeTelas;
var
  i, j: Integer;
  Lista: TStringList;
  QryCheck: TFDQuery;
  NomeTela: string;
  NomePadronizado: string;
  PerfilID: Integer;
begin
  Lista := TStringList.Create;
  QryCheck := TFDQuery.Create(nil);
  try
    QryCheck.Connection := DM.Conn;
    PerfilID := DM.PerfilID;

    Lista.Add('Menus disponíveis e verificação de permissões:');
    Lista.Add('');

    for i := 0 to MainMenu1.Items.Count - 1 do
    begin
      NomeTela := MainMenu1.Items[i].Caption;
      NomePadronizado := RemoverAcentos(Trim(NomeTela));
      Lista.Add(NomeTela);

      QryCheck.SQL.Text := 'SELECT COUNT(*) FROM PERMISSOES ' +
        'WHERE ID_PERFIL = :ID AND TRIM(NOME_TELA) = :TELA AND PODE_ACESSAR = TRUE';
      QryCheck.ParamByName('ID').AsInteger  := PerfilID;
      QryCheck.ParamByName('TELA').AsString := NomePadronizado;
      QryCheck.Open;

      if QryCheck.Fields[0].AsInteger = 0 then
        Lista.Add('❌ Sem permissão cadastrada');

      for j := 0 to MainMenu1.Items[i].Count - 1 do
      begin
        NomeTela := MainMenu1.Items[i].Items[j].Caption;
        NomePadronizado := RemoverAcentos(Trim(NomeTela));

        Lista.Add('  - ' + NomeTela);

        QryCheck.ParamByName('TELA').AsString := NomePadronizado;
        QryCheck.Open;

        if QryCheck.Fields[0].AsInteger = 0 then
          Lista.Add('❌ Sem permissão cadastrada');
      end;

    end;

    //Lista.SaveToFile('ListaDeTelas_Validada.txt');
    //ShowMessage('Arquivo "ListaDeTelas_Validada.txt" foi gerado com sucesso!');
  finally
    QryCheck.Free;
    Lista.Free;

  end;
end;

procedure TForm1.ExportD2Bridge;
//var
//  imgLogo: TImage;
begin
  inherited;

  // Title:= 'Controle de Contratos';
  // SubTitle:= 'Controle de Contratos';

  D2Bridge.HTML.StyleSheets.Add
    ('<link rel="stylesheet" type="text/css" href="css/custom.css">');
//  TemplateClassForm:= TD2BridgeFormTemplate;
//  D2Bridge.FrameworkExportType.TemplateMasterHTMLFile:= 'templates\template.html';
//  D2Bridge.FrameworkExportType.TemplatePageHTMLFile  := 'templates\dashboard.html';


  with D2Bridge.Items.Add do
  begin
    SideMenu(MainMenu1);
  end;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
  if not JaCarregouPermissoes then
  begin
    CarregarPermissoesUsuario;
    JaCarregouPermissoes := True;
  end;

end;

procedure TForm1.HabilitarItemMenu(const NomeTela: string);
var
  i, j: Integer;
  NomeMenuItem, NomeSolicitado: string;
  Log: TStringList;
begin
  Log := TStringList.Create;
  try
    NomeSolicitado := RemoverAcentos(Trim(NomeTela));
    Log.Add('=== Comparação para ativar: ' + NomeSolicitado + ' ===');

    for i := 0 to MainMenu1.Items.Count - 1 do
    begin

      NomeMenuItem := RemoverAcentos(Trim(MainMenu1.Items[i].Caption));
      Log.Add('MenuPai [i=' + IntToStr(i) + ']: ' + NomeMenuItem + ' <=> ' + NomeSolicitado);

      if SameText(NomeMenuItem, NomeSolicitado) then
      begin
        MainMenu1.Items[i].Enabled := True;
        MainMenu1.Items[i].Visible := True;
        Log.Add('  ✅ Ativado como menu pai');
      end;

      // Verifica os submenus
      for j := 0 to MainMenu1.Items[i].Count - 1 do
      begin
        NomeMenuItem := RemoverAcentos(Trim(MainMenu1.Items[i].Items[j].Caption));
        Log.Add('  Submenu [j=' + IntToStr(j) + ']: ' + NomeMenuItem + ' <=> ' + NomeSolicitado);

        if SameText(NomeMenuItem, NomeSolicitado) then
        begin
          MainMenu1.Items[i].Items[j].Enabled := True;
          MainMenu1.Items[i].Items[j].Visible := True;

          // Ativa o pai também
          MainMenu1.Items[i].Enabled := True;
          MainMenu1.Items[i].Visible := True;

          Log.Add('    ✅ Ativado como submenu + pai');
          Break;
        end;
      end;
    end;

   // Log.SaveToFile('Log_ComparacaoPermissoes.txt');
  finally
    Log.Free;
  end;
end;

procedure TForm1.InitControlsD2Bridge(const PrismControl: TPrismControl);
begin
  inherited;

  if PrismControl.IsDBGrid then
  begin
    PrismControl.AsDBGrid.RecordsPerPage := 10;
    PrismControl.AsDBGrid.MaxRecords := 2000;
  end;

end;

procedure TForm1.ListagemdeClientes1Click(Sender: TObject);
begin
  if FrmRelatorios = nil then
     TFrmRelatorios.CreateInstance;

   FrmRelatorios.ShowModal;
end;


procedure TForm1.LogOff1Click(Sender: TObject);
var
i: integer;
begin
  if Application.MessageBox('Sair do sistema?', 'Atenção !!!',
    MB_ICONQUESTION + MB_YESNO) = ID_YES then
  begin
    // Fecha todos os formulários abertos, menos o MainForm
    for i := Screen.FormCount - 1 downto 0 do
    begin
      if Screen.Forms[i] <> Application.MainForm then
        Screen.Forms[i].Close;
    end;

    // Fecha também o MainForm (encerra a aplicação)
    Application.MainForm.Close;
  end;
end;

procedure TForm1.Module11Click(Sender: TObject);
begin
  TD2BridgeForm(Session.PrimaryForm).Show;
end;

procedure TForm1.Perfis1Click(Sender: TObject);
begin
  if FrmControleDeUsuarios = nil then
    TFrmControleDeUsuarios.CreateInstance;
    FrmControleDeUsuarios.PageControl1.ActivePage :=  FrmControleDeUsuarios.tabPerfis;
  Try
   if IsD2BridgeContext then
    begin
       With FrmControleDeUsuarios do
       begin
         with D2Bridge Do
         Begin
           FrmControleDeUsuarios.ShowModal;
//           PrismControlFromID('TabControl01').AsTabs.ActiveTabIndex := 1;
           //PrismControlFromID('TabControl01').AsTabs.ShowTabs       := True;
         End;
       end;
    end;
  except on e: exception do
           ShowMessage('Deu erro: ' + e.Message);
  End;

end;

procedure TForm1.Permisses1Click(Sender: TObject);
begin
  if FrmControleDeUsuarios = nil then
     TFrmControleDeUsuarios.CreateInstance;

  Try
   if IsD2BridgeContext then
    begin
       With FrmControleDeUsuarios do
       begin
         with D2Bridge Do
         Begin
           FrmControleDeUsuarios.ShowModal;
           PrismControlFromID('TabControl01').AsTabs.ActiveTabIndex := 2;
           //A aba abre e depois faz como se tivesse um refresh da página e volta a aba 0
           //PrismControlFromID('TabControl01').AsTabs.ShowTabs       := True;
         End;
       end;
    end;
  except on e: exception do
           ShowMessage('Deu erro: ' + e.Message);
  End;
end;

procedure TForm1.Usuarios1Click(Sender: TObject);
begin
  if FrmControleDeUsuarios = nil then
     TFrmControleDeUsuarios.CreateInstance;

   FrmControleDeUsuarios.PageControl1.ActivePage :=  FrmControleDeUsuarios.tabCadastro;
  Try
   if IsD2BridgeContext then
    begin
       With FrmControleDeUsuarios do
       begin
         with D2Bridge Do
         Begin
           FrmControleDeUsuarios.ShowModal;
 //          PrismControlFromID('TabControl01').AsTabs.ActiveTabIndex := 1;
           //PrismControlFromID('TabControl01').AsTabs.ShowTabs       := True;
         End;
       end;
    end;
  except on e: exception do
           ShowMessage('Deu erro: ' + e.Message);
  End;

end;

function TForm1.RemoverAcentos(const Texto: string): string;
const
  AComAcento = 'áàâãäéèêëíìîïóòôõöúùûüçÁÀÂÃÄÉÈÊËÍÌÎÏÓÒÔÕÖÚÙÛÜÇ';
  ASemAcento = 'aaaaaeeeeiiiiooooouuuucAAAAAEEEEIIIIOOOOOUUUUC';
var
  i, p: Integer;
  Resultado: string;
begin
  Resultado := Texto;
  for i := 1 to Length(Resultado) do
  begin
    p := Pos(Resultado[i], AComAcento);
    if p > 0 then
      Resultado[i] := ASemAcento[p];
  end;
  Result := Resultado;

end;

procedure TForm1.RenderD2Bridge(const PrismControl: TPrismControl;
  var HTMLControl: string);
begin
  inherited;

  // Exemplo: logar o HTML gerado no console ou salvar num arquivo
  // OutputDebugString(PChar('HTML gerado: ' + HTMLControl));

  // Intercept HTML
  {
    if PrismControl.VCLComponent = Edit1 then
    begin
    HTMLControl:= '</>';
    end;
  }
end;

procedure TForm1.ResetarMenus;
var
  i, j: Integer;
begin
  for i := 0 to MainMenu1.Items.Count - 1 do
  begin
    MainMenu1.Items[i].Enabled := False;
    // MainMenu1.Items[i].Visible := False;

    for j := 0 to MainMenu1.Items[i].Count - 1 do
    begin
      MainMenu1.Items[i].Items[j].Enabled := False;
      // MainMenu1.Items[i].Items[j].Visible := False;
    end;
  end;

end;

procedure TForm1.sair1Click(Sender: TObject);
begin
 Self.Close;
end;

end.
