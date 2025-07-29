unit uDM;

{ Copyright 2025 / 2026 D2Bridge Framework by Talis Jonatas Gomes }

interface

uses
  System.SysUtils,
  System.Classes,
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
  System.Variants,
  VCL.Dialogs;

type
  TDM = class(TDataModule)
    Conn: TFDConnection;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    qryCliente: TFDQuery;
    DSCliente: TDataSource;
    qryClienteID_CLIENTE: TIntegerField;
    qryClienteTIPO_PESSOA: TWideStringField;
    qryClienteNOME_RAZAO: TWideStringField;
    qryClienteNOME_FANTASIA: TWideStringField;
    qryClienteCPF_CNPJ: TWideStringField;
    qryClienteIE: TWideStringField;
    qryClienteRG: TWideStringField;
    qryClienteDATA_NASCIMENTO: TDateField;
    qryClienteTELEFONE: TWideStringField;
    qryClienteEMAIL: TWideStringField;
    qryClienteENDERECO: TWideStringField;
    qryClienteNUMERO: TWideStringField;
    qryClienteCOMPLEMENTO: TWideStringField;
    qryClienteBAIRRO: TWideStringField;
    qryClienteCEP: TWideStringField;
    qryClienteMUNICIPIO: TWideStringField;
    qryClienteUF: TWideStringField;
    qryClienteCODIGO_MUNICIPIO: TIntegerField;
    qryClientePAIS: TWideStringField;
    qryClienteCODIGO_PAIS: TIntegerField;
    qryContatos: TFDQuery;
    DScontatos: TDataSource;
    qryClienteATIVO: TWideStringField;
    qryContatosID_CONTATO: TIntegerField;
    qryContatosID_CLIENTE: TIntegerField;
    qryContatosNOME_CONTATO: TWideStringField;
    qryContatosTELEFONE_CONTATO: TWideStringField;
    qryContatosEMAIL_CONTATO: TWideStringField;
    qryContatosCARGO: TWideStringField;
    qryContatosOBSERVACAO: TWideStringField;
    qryContatosTIPO_CONTATO: TWideStringField;
    qryContatosDATA_CADASTRO: TDateField;
    qryContatosATIVO: TWideStringField;
    qryContatosNOME_RAZAO: TWideStringField;
    qryUsuarios: TFDQuery;
    qryPerfis: TFDQuery;
    qryPermissoes: TFDQuery;
    DSUsuarios: TDataSource;
    DSPerfis: TDataSource;
    DSPermissoes: TDataSource;
    qryUsuariosID_USUARIO: TIntegerField;
    qryUsuariosNOME: TWideStringField;
    qryUsuariosEMAIL: TWideStringField;
    qryUsuariosSENHA: TWideStringField;
    qryUsuariosID_PERFIL: TIntegerField;

  private

    { Private declarations }
  public
    perfilID: Integer;
    class procedure CreateInstance;
    procedure DestroyInstance;
    procedure ListarClientes(Busca: String);
    procedure ListarContatos(Busca: String; IdClienteSelecionado: Variant);
    procedure ListarUsuarios(Busca: String; IdUsuarioSelecionado: Variant);
    procedure InativarCliente;
    procedure SalvarContatoAtual;
    procedure InserirContato(aNome, aCargo, aTelefone, aEmail,
      aObservacao: String; aIDCliente: Integer);
    procedure EditarContato(aNome, aCargo, aTelefone, aEmail,
      aObservacao: String; aIDCliente: Integer);
    procedure SalvarCliente(aTipoPessoa, aNome_Razao, aNome_Fantasia, acpf_cnpj,
      aIE, aRG, aData_Nascimento, aTelefone, aEmail, aEndereco, aNumero,
      aComplemento, aBairro, aMunicipio, aUf, aCEP, aCodigo_Municipio: String;
      aId_Cliente: Integer);
    procedure SalvarUsuario(aNome, aSenha, aEmail: String; aIdPerfil: Integer);
    function Login(aUser, aSenha: String): Boolean;
    procedure LoadPermissoes(IDPerfil: Integer);

  end;

function DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

Uses
  D2Bridge.Instance, ContratosWebApp, uView.Clientes, uView.ContatosCad, Unit1;

{$R *.dfm}

class procedure TDM.CreateInstance;
begin
  D2BridgeInstance.CreateInstance(self);
end;

function DM: TDM;
begin
  result := TDM(D2BridgeInstance.GetInstance(TDM));
end;

procedure TDM.DestroyInstance;
begin
  D2BridgeInstance.DestroyInstance(self);
end;

procedure TDM.EditarContato(aNome, aCargo, aTelefone, aEmail,
  aObservacao: String; aIDCliente: Integer);
var
  qryEdicao: TFDQuery;
begin
  qryEdicao := TFDQuery.Create(nil);
  try
    qryEdicao.Connection := Conn;

    qryEdicao.SQL.Text := 'UPDATE CONTATOS SET ' +
      '  NOME_CONTATO     = :NOME_CONTATO, ' +
      '  CARGO            = :CARGO,        ' +
      '  TELEFONE_CONTATO = :TELEFONE,     ' +
      '  EMAIL_CONTATO    = :EMAIL,        ' +
      '  OBSERVACAO       = :OBSERVACAO    ' +
      '  ID_CLIENTE       = :ID_CLIENTE    ' +
      'WHERE ID_CONTATO   = :ID_CONTATO    ';

    qryEdicao.ParamByName('NOME_CONTATO').AsString := aNome;
    qryEdicao.ParamByName('CARGO').AsString := aCargo;
    qryEdicao.ParamByName('TELEFONE').AsString := aTelefone;
    qryEdicao.ParamByName('EMAIL').AsString := aEmail;
    qryEdicao.ParamByName('EMAIL').AsString := aObservacao;
    qryEdicao.ParamByName('ID_CLIENTE').AsInteger := aIDCliente;

    ShowMessage('Contato editado com sucesso!');
    qryEdicao.ExecSQL;
  finally
    qryEdicao.Free;
  end;

end;

procedure TDM.InativarCliente;
begin
  if not qryCliente.IsEmpty then
  begin
    qryCliente.Edit;
    qryCliente.FieldByName('ATIVO').AsString := 'N';
    qryCliente.Post;
  end;
end;

procedure TDM.InserirContato(aNome, aCargo, aTelefone, aEmail,
  aObservacao: String; aIDCliente: Integer);
var
  qryEdicao: TFDQuery;
begin
  qryEdicao := TFDQuery.Create(nil);
  try
    qryEdicao.Connection := Conn;

    qryEdicao.SQL.Text := 'INSERT INTO CONTATOS (' + '  NOME_CONTATO,       ' +
      '  CARGO,              ' + '  TELEFONE_CONTATO,   ' +
      '  EMAIL_CONTATO,      ' + '  OBSERVACAO,         ' +
      '  ID_CLIENTE          ' + ') VALUES (' + '  :NOME_CONTATO,      ' +
      '  :CARGO,             ' + '  :TELEFONE,          ' +
      '  :EMAIL,             ' + '  :OBSERVACAO,        ' +
      '  :ID_CLIENTE         ' + ')';

    qryEdicao.ParamByName('NOME_CONTATO').AsString := aNome;
    qryEdicao.ParamByName('CARGO').AsString := aCargo;
    qryEdicao.ParamByName('TELEFONE').AsString := aTelefone;
    qryEdicao.ParamByName('EMAIL').AsString := aEmail;
    qryEdicao.ParamByName('OBSERVACAO').AsString := aObservacao;
    qryEdicao.ParamByName('ID_CLIENTE').AsInteger := aIDCliente;

    ShowMessage('Contato inserido com sucesso');
    qryEdicao.ExecSQL;

  finally
    qryEdicao.Free;
  end;

end;

procedure TDM.ListarClientes(Busca: String);
begin
  qryCliente.Active := False;
  qryCliente.SQL.Clear;
  qryCliente.SQL.Add('select * from clientes');

  if Busca <> '' then
  begin
    qryCliente.SQL.Add('where UPPER(NOME_RAZAO) like :nome');
    qryCliente.SQL.Add('  and ATIVO = ''S''');
    qryCliente.ParamByName('nome').Value := '%' + UpperCase(Busca) + '%';
  end
  else
    qryCliente.SQL.Add('where ATIVO = ''S''');

  qryCliente.SQL.Add('order by NOME_RAZAO');
  qryCliente.Active := True;

end;

procedure TDM.ListarContatos(Busca: String; IdClienteSelecionado: Variant);
begin
  qryContatos.Active := False;
  qryContatos.SQL.Clear;

  qryContatos.SQL.Add('SELECT c.*, cli.NOME_RAZAO');
  qryContatos.SQL.Add('FROM CONTATOS c');
  qryContatos.SQL.Add
    ('INNER JOIN CLIENTES cli ON cli.ID_CLIENTE = c.ID_CLIENTE');

  if (Busca <> '') or (not VarIsNull(IdClienteSelecionado)) then
  begin
    qryContatos.SQL.Add('WHERE 1=1');
    qryContatos.SQL.Add('AND c.ATIVO = ''S''');

    if Busca <> '' then
    begin
      qryContatos.SQL.Add('AND UPPER(NOME_CONTATO) LIKE :nome');
      qryContatos.ParamByName('nome').Value := '%' + UpperCase(Busca) + '%';
    end;

    if not VarIsNull(IdClienteSelecionado) then
    begin
      qryContatos.SQL.Add('AND c.ID_CLIENTE = :idCliente');
      qryContatos.ParamByName('idCliente').AsInteger := IdClienteSelecionado;
    end;
  end;

  qryContatos.SQL.Add('ORDER BY c.NOME_CONTATO');

  // ShowMessage(qryContatos.sql.text);

  qryContatos.Active := True;

end;

procedure TDM.ListarUsuarios(Busca: String; IdUsuarioSelecionado: Variant);
begin
  qryUsuarios.Active := False;
  qryUsuarios.SQL.Clear;

  qryUsuarios.SQL.Add('SELECT *');
  qryUsuarios.SQL.Add('FROM USUARIOS');

  if (Busca <> '') or (not VarIsNull(IdUsuarioSelecionado)) then
  begin
    qryUsuarios.SQL.Add('WHERE 1=1');

    // Se existir o campo ATIVO na tabela, mantenha o filtro
    qryUsuarios.SQL.Add('AND ATIVO = ''S''');

    if Busca <> '' then
    begin
      qryUsuarios.SQL.Add('AND UPPER(NOME) LIKE :nome');
      qryUsuarios.ParamByName('nome').Value := '%' + UpperCase(Busca) + '%';
    end;

    if not VarIsNull(IdUsuarioSelecionado) then
    begin
      qryUsuarios.SQL.Add('AND ID_CLIENTE = :idCliente');
      qryUsuarios.ParamByName('idCliente').AsInteger := IdUsuarioSelecionado;
    end;
  end;

  qryUsuarios.SQL.Add('ORDER BY NOME');

  qryUsuarios.Active := True;

end;

Function TDM.Login(aUser, aSenha: String): Boolean;
var
  QryLogin: TFDQuery;

begin
  result := False;
  QryLogin := TFDQuery.Create(nil);
  try
    QryLogin.Connection := Conn;

    QryLogin.SQL.Text := 'SELECT ID_USUARIO, ID_PERFIL ' + 'FROM USUARIOS ' +
      'WHERE NOME = :NOME AND SENHA = :SENHA';

    QryLogin.ParamByName('NOME').AsString := aUser;
    QryLogin.ParamByName('SENHA').AsString := aSenha;

    QryLogin.Open;

    if not QryLogin.IsEmpty then
    begin
      perfilID := QryLogin.FieldByName('ID_PERFIL').AsInteger;

      // Agora carregamos as permissões
      result := True;
      LoadPermissoes(perfilID);

    end
    else
    begin
      MessageDlg('Usuário ou senha inválido.', mtWarning, [mbOK], 0);
      result := False;
    end;
  finally
    QryLogin.Free;
  end;

end;

procedure TDM.LoadPermissoes(IDPerfil: Integer);
var
  QryPerm: TFDQuery;
  AForm: TForm1;
begin
  QryPerm := TFDQuery.Create(nil);
  try
    QryPerm.Connection := Conn;

    QryPerm.SQL.Text :=
      'SELECT NOME_TELA FROM PERMISSOES WHERE ID_PERFIL = :ID AND PODE_ACESSAR = TRUE';
    QryPerm.ParamByName('ID').AsInteger := IDPerfil;
    QryPerm.Open;

    // Garante que o formulário principal está instanciado
    if Form1 = nil then
      TForm1.CreateInstance;

    // Primeiro, desativa todos os itens do menu
    Form1.ResetarMenus;

    // Em seguida, ativa os itens permitidos
    while not QryPerm.Eof do
    begin
      Form1.HabilitarItemMenu(QryPerm.FieldByName('NOME_TELA').AsString);
      QryPerm.Next;
    end;
  finally
    QryPerm.Free;
  end;

end;

procedure TDM.SalvarCliente(aTipoPessoa, aNome_Razao, aNome_Fantasia, acpf_cnpj,
  aIE, aRG, aData_Nascimento, aTelefone, aEmail, aEndereco, aNumero,
  aComplemento, aBairro, aMunicipio, aUf, aCEP, aCodigo_Municipio: String;
  aId_Cliente: Integer);
var
  qryEdicao: TFDQuery;
begin
  qryEdicao := TFDQuery.Create(nil);
  try
    qryEdicao.Connection := Conn;

    qryEdicao.SQL.Text := 'INSERT INTO CLIENTES (' + '  TIPO_PESSOA,       ' +
      '  NOME_RAZAO,        ' + '  NOME_FANTASIA,     ' +
      '  CPF_CNPJ,          ' + '  IE,                ' +
      '  RG,                ' + '  DATA_NASCIMENTO,   ' +
      '  TELEFONE,          ' + '  EMAIL,             ' +
      '  ENDERECO,          ' + '  NUMERO,            ' +
      '  COMPLEMENTO,       ' + '  BAIRRO,            ' +
      '  CEP,               ' + '  MUNICIPIO,         ' +
      '  UF,                ' + '  CODIGO_MUNICIPIO,  ' +
      '  PAIS,              ' + '  CODIGO_PAIS,       ' +
      '  ID_CLIENTE         ' + ') VALUES (           ' +
      '  :TIPO_PESSOA,      ' + '  :NOME_RAZAO,       ' +
      '  :NOME_FANTASIA,    ' + '  :IE,               ' +
      '  :RG,               ' + '  :DATA_NASCIMENTO,  ' +
      '  :TELEFONE,         ' + '  :EMAIL,            ' +
      '  :ENDERECO,         ' + '  :NUMERO,           ' +
      '  :COMPLEMENTO,      ' + '  :BAIRRO,           ' +
      '  :CEP,              ' + '  :MUNICIPIO,        ' +
      '  :UF,               ' + '  :CODIGO_MUNICIPIO, ' +
      '  :PAIS,             ' + '  :CODIGO_PAIS,      ' +
      '  :ID_CLIENTE        ' + ')';

    qryEdicao.ParamByName('TIPO_PESSOA').AsString := aTipoPessoa;
    qryEdicao.ParamByName('NOME_RAZAO').AsString := aNome_Razao;
    qryEdicao.ParamByName('NOME_FANTASIA').AsString := aNome_Fantasia;
    qryEdicao.ParamByName('CPF_CNPJ').AsString := acpf_cnpj;
    qryEdicao.ParamByName('IE').AsString := aIE;
    qryEdicao.ParamByName('RG').AsString := aRG;
    qryEdicao.ParamByName('EMAIL').AsString := aEmail;
    qryEdicao.ParamByName('ENDERECO').AsString := aEndereco;
    qryEdicao.ParamByName('NUMERO').AsString := aNumero;
    qryEdicao.ParamByName('COMPLEMENTO').AsString := aComplemento;
    qryEdicao.ParamByName('BAIRRO').AsString := aBairro;
    qryEdicao.ParamByName('CEP').AsString := aCEP;
    qryEdicao.ParamByName('MUNICIPIO').AsString := aMunicipio;
    qryEdicao.ParamByName('UF').AsString := aUf;
    qryEdicao.ParamByName('CODIGO_MUNICIPIO').AsString := aCodigo_Municipio;
    qryEdicao.ParamByName('RG').AsString := aRG;
    qryEdicao.ParamByName('EMAIL').AsString := aEmail;
    qryEdicao.ParamByName('ENDERECO').AsString := aEndereco;
    qryEdicao.ParamByName('ID_CLIENTE').AsInteger := aId_Cliente;

    ShowMessage('Cliente inserido com sucesso');
    qryEdicao.ExecSQL;

  finally
    qryEdicao.Free;
  end;

end;

procedure TDM.SalvarContatoAtual;
var
  qryEdicao: TFDQuery;
begin
  qryEdicao := TFDQuery.Create(nil);
  try
    qryEdicao.Connection := Conn;

    qryEdicao.SQL.Text := 'UPDATE CONTATOS SET ' +
      '  NOME_CONTATO     = :NOME_CONTATO, ' +
      '  CARGO            = :CARGO,        ' +
      '  TELEFONE_CONTATO = :TELEFONE,     ' +
      '  EMAIL_CONTATO    = :EMAIL,        ' +
      '  ID_CLIENTE       = :ID_CLIENTE    ' +
      'WHERE ID_CONTATO   = :ID_CONTATO    ';

    qryEdicao.ParamByName('NOME_CONTATO').AsString :=
      qryContatos.FieldByName('NOME_CONTATO').AsString;
    qryEdicao.ParamByName('CARGO').AsString :=
      qryContatos.FieldByName('CARGO').AsString;
    qryEdicao.ParamByName('TELEFONE').AsString :=
      qryContatos.FieldByName('TELEFONE_CONTATO').AsString;
    qryEdicao.ParamByName('EMAIL').AsString :=
      qryContatos.FieldByName('EMAIL_CONTATO').AsString;
    qryEdicao.ParamByName('ID_CLIENTE').AsInteger :=
      qryContatos.FieldByName('ID_CLIENTE').AsInteger;
    qryEdicao.ParamByName('ID_CONTATO').AsInteger :=
      qryContatos.FieldByName('ID_CONTATO').AsInteger;

    qryEdicao.ExecSQL;
  finally
    qryEdicao.Free;
  end;

end;

procedure TDM.SalvarUsuario(aNome, aSenha, aEmail: String; aIdPerfil: Integer);
var
  qryEdicao: TFDQuery;
begin
  qryEdicao := TFDQuery.Create(nil);
  try
    qryEdicao.Connection := Conn;

    qryEdicao.SQL.Text := 'INSERT INTO USUARIOS (' + '  NOME,       ' +
      '  SENHA,      ' + '  EMAIL       ' + ') VALUES (    ' + '  :NOME,      '
      + '  :SENHA,     ' + '  :EMAIL      ' + ')';

    qryEdicao.ParamByName('NOME  ').AsString := aNome;
    qryEdicao.ParamByName('SENHA').AsString := aSenha;
    qryEdicao.ParamByName('EMAIL').AsString := aEmail;

    ShowMessage('Usuário inserido com sucesso');
    qryEdicao.ExecSQL;

  finally
    qryEdicao.Free;
  end;

end;

end.
