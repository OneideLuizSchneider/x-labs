unit DMVCF.Connection;

interface

uses
  System.SysUtils,System.SyncObjs, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Stan.ExprFuncs, Data.DB, FireDAC.Comp.Client,
  FireDAC.VCLUI.Wait, FireDAC.Comp.UI,
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
    class var SingletonDatabaseFireDAC: TDMVCFConnection;

    class constructor Create;
    class destructor Destroy;
  strict private
    FConnectionAdapter: TFireDACConnectionAdapter;

    function GetConnectionAdapter(): TFireDACConnectionAdapter;
  public
    class function GetAdapter(): TFireDACConnectionAdapter; static;
  end;

implementation

{ %CLASSGROUP 'Vcl.Controls.TControl' }

{$R *.dfm}

{ TDMVCFConnection }

class constructor TDMVCFConnection.Create;
begin
  SingletonDatabaseFireDAC := nil;
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
begin
  if (SingletonDatabaseFireDAC <> nil) then
    FreeAndNil(SingletonDatabaseFireDAC);
end;

class function TDMVCFConnection.GetAdapter: TFireDACConnectionAdapter;
begin
  if (SingletonDatabaseFireDAC = nil) then
  begin
    Critical.Section.Enter;
    try
      SingletonDatabaseFireDAC := TDMVCFConnection.Create(nil);
    finally
      Critical.Section.Leave;
    end;
  end;
  Result := SingletonDatabaseFireDAC.GetConnectionAdapter();
end;

function TDMVCFConnection.GetConnectionAdapter: TFireDACConnectionAdapter;
begin
  Result := FConnectionAdapter;
end;
end.
