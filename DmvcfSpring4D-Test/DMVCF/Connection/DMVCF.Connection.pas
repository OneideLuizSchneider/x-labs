unit DMVCF.Connection;

interface

uses
  System.SysUtils,System.SyncObjs, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Stan.ExprFuncs, Data.DB, FireDAC.Comp.Client,
  FireDAC.VCLUI.Wait, FireDAC.Comp.UI, System.Generics.Collections,
  //Infra
  InfraFwk4D.Driver.FireDAC, InfraFwk4D, FireDAC.Phys.PGDef, FireDAC.Phys.PG;

type
  TDMVCFConnection = class(TDataModule)
    FDConnection: TFDConnection;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysPgDriverLink1: TFDPhysPgDriverLink;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  strict private
    class var FListaConnection: TDictionary<TComponent, TDMVCFConnection>;

    class constructor Create;
    class destructor Destroy;
  strict private
    FConnectionAdapter: TFireDACConnectionAdapter;

    function GetConnectionAdapter(): TFireDACConnectionAdapter;
  public
    function GetAdapter(): TFireDACConnectionAdapter;

    class procedure RemoveConnection(const pComponent: TComponent);
    class function GetConnection(const pComponent: TComponent): TDMVCFConnection; static;
  end;

implementation

{ %CLASSGROUP 'Vcl.Controls.TControl' }

{$R *.dfm}

{ TDMVCFConnection }

class constructor TDMVCFConnection.Create;
begin
  FListaConnection:= TDictionary<TComponent, TDMVCFConnection>.Create;
end;

procedure TDMVCFConnection.DataModuleCreate(Sender: TObject);
begin
  FConnectionAdapter := TFireDACConnectionAdapter.Create;
  FDConnection.Connected := True;
  FConnectionAdapter.Build(TFireDACComponentAdapter.Create(FDConnection), True);
end;

procedure TDMVCFConnection.DataModuleDestroy(Sender: TObject);
begin
  FreeAndNil(FConnectionAdapter);
  FDConnection.Connected := False;
end;

class destructor TDMVCFConnection.Destroy;
var
  Key: TComponent;
begin
  for Key in FListaConnection.Keys do
    FListaConnection.Items[Key].Free;

  FreeAndNil(FListaConnection);
end;

function TDMVCFConnection.GetAdapter: TFireDACConnectionAdapter;
begin
  Result := FConnectionAdapter;
end;

class function TDMVCFConnection.GetConnection(const pComponent: TComponent): TDMVCFConnection;
begin
  Critical.Section.Enter;
  try
    Result := nil;
    if not(FListaConnection.TryGetValue(pComponent, Result)) then
    begin
      Result := TDMVCFConnection.Create(nil);
      FListaConnection.Add(pComponent, Result);
    end;
  finally
    Critical.Section.Leave;
  end;
end;

function TDMVCFConnection.GetConnectionAdapter: TFireDACConnectionAdapter;
begin
  Result := FConnectionAdapter;
end;

class procedure TDMVCFConnection.RemoveConnection(const pComponent: TComponent);
var
  vObj: TDMVCFConnection;
begin
  Critical.Section.Enter;
  try
    if (FListaConnection.ContainsKey(pComponent)) then
    begin
      FListaConnection.TryGetValue(pComponent, vObj);
      vObj.Free;
      FListaConnection.Remove(pComponent);
    end;
  finally
    Critical.Section.Leave;
  end;
end;

end.
