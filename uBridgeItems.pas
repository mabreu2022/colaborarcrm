unit uBridgeItems;

interface

uses
  System.Classes, Vcl.Controls, D2Bridge.Interfaces; // ajuste conforme o caminho da interface

type
  TMeuBridgeItem = class(TInterfacedObject, ID2BridgeItem)
  private
    FControl: TControl;
  public
    constructor Create(AControl: TControl);
    function GetControl: TControl;
  end;

implementation

{ TMeuBridgeItem }

constructor TMeuBridgeItem.Create(AControl: TControl);
begin
  FControl := AControl;
end;

function TMeuBridgeItem.GetControl: TControl;
begin
  Result := FControl;
end;

end.
