unit DMVCF.Base.Persistence;

interface

uses
  System.SysUtils, System.Classes,
  //Dependencies FireDAC
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client,
  //Dependencies InfraFwk
  InfraFwk4D.Driver.FireDAC.Persistence,
  InfraFwk4D.Driver.FireDAC;

type
  TBasePersistence = class(TFireDACPersistenceAdapter)
  strict private
    FDatabase: TFireDACConnectionAdapter;
    FOwnsDatabase: Boolean;
  strict protected
    function GetConnection: TFireDACConnectionAdapter; override;
    procedure ConfigureDataSetsConnection; override;
  public
    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;

    function GetDataSet(): TDataSet;
  end;

implementation

uses
  DMVCF.Connection;

{ %CLASSGROUP 'Vcl.Controls.TControl' }

{$R *.dfm}

{ TBasePersistence }

procedure TBasePersistence.AfterConstruction;
begin
  FDatabase := TDMVCFConnection.GetAdapter();
  FOwnsDatabase := False;

  inherited AfterConstruction;
end;

procedure TBasePersistence.BeforeDestruction;
begin
  if FOwnsDatabase then
    FreeAndNil(FDatabase);
  inherited BeforeDestruction;
end;

procedure TBasePersistence.ConfigureDataSetsConnection;
var
  I: Integer;
begin
  inherited;
  for I := 0 to Pred(Self.ComponentCount) do
    if (Self.Components[I] is TFDQuery) then
      TFDQuery(Self.Components[I]).Connection := FDatabase.Component.Connection;
end;

function TBasePersistence.GetConnection: TFireDACConnectionAdapter;
begin
  Result := FDatabase;
end;
function TBasePersistence.GetDataSet: TDataSet;
  var
  I: Integer;
begin
  inherited;
  for I := 0 to Pred(Self.ComponentCount) do
    if (Self.Components[I] is TFDQuery) then
      Result := TFDQuery(Self.Components[I]);
end;

end.
