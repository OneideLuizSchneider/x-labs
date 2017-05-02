unit Core.Context;

interface

uses
  Spring.Container;

type
  CoreContext = class sealed
    class procedure RegisterTypes(const container: TContainer); static;
  end;

implementation

uses
  DMVCF.Critical.Section, DMVCF.Critical.Section.Impl;

class procedure CoreContext.RegisterTypes(const container: TContainer);
begin
  container.RegisterType<IDMVCFCriticalSection, TDMVCFCriticalSection>.AsSingleton;

  container.Build;
end;

end.
