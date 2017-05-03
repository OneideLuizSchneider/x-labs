unit Pessoa.Controller;

interface

uses
  MVCFramework,
  Pessoa.Business,
  DMVCF.Crud.Controller,
  MVCFramework.Commons;


type

  [MVCPath('/pessoa')]
  TPessoaController = class(TDMVCFCrudController<TPessoaBC>)
  end;

implementation

end.
