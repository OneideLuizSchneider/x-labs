unit View.Context;

interface

uses
  Forms,
  Spring.Container;

type
  ViewContext = class sealed
    class procedure RegisterTypes(const container: TContainer); static;
  end;
implementation

uses
  DMVCF.View;

{ ViewContext }

class procedure ViewContext.RegisterTypes(const container: TContainer);
begin
  container.RegisterType<TViewDMVCF>.DelegateTo(
    function: TViewDMVCF
    begin
      Application.CreateForm(TViewDMVCF, Result);
    end
  ).AsSingleton;

  container.Build;
end;

end.
