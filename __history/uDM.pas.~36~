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

  private

    { Private declarations }
  public
    class procedure CreateInstance;
    procedure DestroyInstance;
    procedure ListarClientes(Busca:String);
    procedure ListarContatos(Busca: String; IdClienteSelecionado: Variant);
    procedure InativarCliente;
    procedure SalvarContatoAtual;


  end;

function DM:TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

Uses
  D2Bridge.Instance, ContratosWebApp, uView.Clientes;

{$R *.dfm}

class procedure TDM.CreateInstance;
begin
 D2BridgeInstance.CreateInstance(self);
end;

function DM:TDM;
begin
 result:= TDM(D2BridgeInstance.GetInstance(TDM));
end;

procedure TDM.DestroyInstance;
begin
 D2BridgeInstance.DestroyInstance(self);
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
  qryContatos.SQL.Add('INNER JOIN CLIENTES cli ON cli.ID_CLIENTE = c.ID_CLIENTE');

  if (Busca <> '') or (not VarIsNull(IdClienteSelecionado)) then
  begin
    qryContatos.SQL.Add('WHERE 1=1');

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
  qryContatos.Active := True;

end;

procedure TDM.SalvarContatoAtual;
var
  qryEdicao: TFDQuery;
begin
  qryEdicao := TFDQuery.Create(nil);
  try
    qryEdicao.Connection := Conn;

    qryEdicao.SQL.Text :=
      'UPDATE CONTATOS SET ' +
      '  NOME_CONTATO     = :NOME_CONTATO, ' +
      '  CARGO            = :CARGO,        ' +
      '  TELEFONE_CONTATO = :TELEFONE,     ' +
      '  EMAIL_CONTATO    = :EMAIL,        ' +
      '  ID_CLIENTE       = :ID_CLIENTE    ' +
      'WHERE ID_CONTATO   = :ID_CONTATO    ';

    qryEdicao.ParamByName('NOME_CONTATO').AsString := qryContatos.FieldByName('NOME_CONTATO').AsString;
    qryEdicao.ParamByName('CARGO').AsString        := qryContatos.FieldByName('CARGO').AsString;
    qryEdicao.ParamByName('TELEFONE').AsString     := qryContatos.FieldByName('TELEFONE_CONTATO').AsString;
    qryEdicao.ParamByName('EMAIL').AsString        := qryContatos.FieldByName('EMAIL_CONTATO').AsString;
    qryEdicao.ParamByName('ID_CLIENTE').AsInteger  := qryContatos.FieldByName('ID_CLIENTE').AsInteger;
    qryEdicao.ParamByName('ID_CONTATO').AsInteger  := qryContatos.FieldByName('ID_CONTATO').AsInteger;
    ShowMessage(qryEdicao.SQL.Text);
    qryEdicao.ExecSQL;
  finally
    qryEdicao.Free;
  end;

end;

end.