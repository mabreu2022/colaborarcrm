program Contratos;

{$IFDEF D2BRIDGE}
 //{$APPTYPE CONSOLE}
{$ENDIF}



uses
  Vcl.Forms,
  D2Bridge.ServerControllerBase in 'C:\Componentes\d2bridge\D2Bridge Framework\D2Bridge.ServerControllerBase.pas' {D2BridgeServerControllerBase: TDataModule},
  Prism.SessionBase in 'C:\Componentes\d2bridge\D2Bridge Framework\Prism\Prism.SessionBase.pas' {PrismSessionBase: TPrismSessionBase},
  ContratosWebApp in 'ContratosWebApp.pas' {ContratosWebAppGlobal},
  Contratos_Session in 'Contratos_Session.pas' {ContratosSession},
  D2BridgeFormTemplate in 'D2BridgeFormTemplate.pas',
  Unit_Login in 'Unit_Login.pas' {Form_Login},
  Unit_D2Bridge_Server in 'Unit_D2Bridge_Server.pas' {Form_D2Bridge_Server},
  Unit1 in 'Unit1.pas' {Form1},
  uView.Clientes in 'uView.Clientes.pas' {FrmClientes},
  uDM in 'uDM.pas' {DM: TDataModule},
  uView.ContatosCad in 'uView.ContatosCad.pas' {FrmContatosCad},
  Vcl.Themes,
  Vcl.Styles,
  uView.ControleDeUsuarios in 'uView.ControleDeUsuarios.pas' {FrmControleDeUsuarios},
  uView.Ativos in 'uView.Ativos.pas' {FrmAtivos},
  uView.Contratos in 'uView.Contratos.pas' {FrmContratos},
  uView.Relatorios in 'uView.Relatorios.pas' {FrmRelatorios},
  uView.Relatorio.ListagemDeClientes in 'uView.Relatorio.ListagemDeClientes.pas' {FrmRelatorioListagemDeClientes};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar:= True;
  Application.CreateForm(TForm_D2Bridge_Server, Form_D2Bridge_Server);
  Application.Run;
end.
