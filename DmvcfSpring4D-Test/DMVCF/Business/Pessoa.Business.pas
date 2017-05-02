unit Pessoa.Business;

interface

uses
  DMVCF.Base.Business,
  Pessoa.Persistence;

type

  TPessoaBC = class(TBaseBC<TPessoaPersistence>)
  end;

implementation

end.
