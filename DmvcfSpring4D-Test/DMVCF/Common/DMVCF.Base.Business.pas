unit DMVCF.Base.Business;

interface

uses
  InfraFwk4D.Driver,
  DMVCF.Base.Persistence;

type

  TBaseBC<TPersistence: TBasePersistence> = class(TBusinessAdapter<TPersistence>)
  strict private
  public
  end;

implementation



end.

