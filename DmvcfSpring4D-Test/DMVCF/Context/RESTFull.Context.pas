unit RESTFull.Context;

interface

uses
  Spring.Container;

type
  RESTFullContext = class sealed
    class procedure RegisterTypes(const container: TContainer); static;
  end;

implementation

uses
  Pessoa.Controller;

{ RESTFullContext }

class procedure RESTFullContext.RegisterTypes(const container: TContainer);
begin
  container.RegisterType<TPessoaController>;

  container.Build;
end;

end.
