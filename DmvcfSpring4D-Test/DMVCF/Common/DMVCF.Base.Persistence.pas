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
  InfraFwk4D.Driver.FireDAC, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TBasePersistence = class(TFireDACPersistenceAdapter)
    DtsPersistence: TFDQuery;
  strict private
    FDatabase: TFireDACConnectionAdapter;
  strict protected
    function GetConnection: TFireDACConnectionAdapter; override;
    procedure ConfigureDataSetsConnection; override;
  public
    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;

    procedure FindOne(const pId: Int64);

    function GetDataSet(): TDataSet;
  end;

implementation

uses
  DMVCF.Connection, DMVCF.Query.Util;

{ %CLASSGROUP 'Vcl.Controls.TControl' }

{$R *.dfm}

{ TBasePersistence }

procedure TBasePersistence.AfterConstruction;
begin
  FDatabase := TDMVCFConnection.GetConnection(Self).GetAdapter();

  inherited AfterConstruction;
end;

procedure TBasePersistence.BeforeDestruction;
begin
  TDMVCFConnection.RemoveConnection(Self);
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

procedure TBasePersistence.FindOne(const pId: Int64);
begin
  DtsPersistence.Close;
  TDMVCFQueryUtil.ClearWhere(DtsPersistence);
  raise Exception.Create('Falta finalizar...');
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
