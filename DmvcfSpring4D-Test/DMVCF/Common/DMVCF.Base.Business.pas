unit DMVCF.Base.Business;

interface

uses
  InfraFwk4D.Driver,
  DMVCF.Base.Persistence;

type

  TBaseBC<TPersistence: TBasePersistence> = class(TBusinessAdapter<TPersistence>)
  strict private
  public
    procedure FindOne(const pId: Int64);
  end;

implementation

{ TBaseBC<TPersistence> }

procedure TBaseBC<TPersistence>.FindOne(const pId: Int64);
begin

end;

end.

