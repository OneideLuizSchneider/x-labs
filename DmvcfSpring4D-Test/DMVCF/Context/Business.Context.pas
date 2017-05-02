unit Business.Context;

interface

uses
  Spring.Container;

type
  BusinessContext = class sealed
    class procedure RegisterTypes(const container: TContainer); static;
  end;

implementation

uses
  Pessoa.Business;

class procedure BusinessContext.RegisterTypes(const container: TContainer);
begin
  container.RegisterType<TPessoaBC>;//(TPessoaBC.ClassName);

  container.Build;
end;

end.

