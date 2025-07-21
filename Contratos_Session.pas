unit Contratos_Session;

interface

uses
  SysUtils, Classes,
  Prism.SessionBase;

type
  TContratosSession = class(TPrismSessionBase)
  private

  public
   constructor Create(APrismSession: TPrismSession); override;  //OnNewSession
   destructor Destroy; override; //OnCloseSession
  end;


implementation

Uses
  D2Bridge.Instance,
  ContratosWebApp, uDM;

{$IFNDEF FPC}
{$R *.dfm}
{$ELSE}
{$R *.lfm}
{$ENDIF} 

constructor TContratosSession.Create(APrismSession: TPrismSession); //OnNewSession
begin
 inherited;

 if DM = nil then
   TDM.CreateInstance;

end;

destructor TContratosSession.Destroy; //OnCloseSession
begin
 //Close ALL DataBase connection
 //Ex: Dm.DBConnection.Close;
 DM.Conn.Close;

 inherited;
end;

end.

