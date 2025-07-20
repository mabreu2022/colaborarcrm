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
  FireDAC.Comp.DataSet;

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
  private
    { Private declarations }
  public
    class procedure CreateInstance;
    procedure DestroyInstance;
    procedure ListarClientes(Busca:String);
  end;

function DM:TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

Uses
  D2Bridge.Instance, ContratosWebApp;

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

procedure TDM.ListarClientes(Busca: String);
begin
  qryCliente.Active:= False;
  qryCliente.SQL.Clear;
  qryCliente.SQL.Add('select * from clientes');

  if busca <>  '' then
  begin
    qryCliente.SQL.Add('where NOME_RAZAO like :nome');
    qryCliente.ParamByName('nome').Value := '%' + busca + '%';
  end;

  qryCliente.SQL.Add('order by NOME_RAZAO');

  qryCliente.Active := True;

end;

end.