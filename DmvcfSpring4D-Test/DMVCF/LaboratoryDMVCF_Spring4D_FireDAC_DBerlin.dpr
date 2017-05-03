program LaboratoryDMVCF_Spring4D_FireDAC_DBerlin;
{$APPTYPE GUI}

uses
  Vcl.Forms,
  Spring.Container,
  Spring.Services,
  DMVCF.View in 'DMVCF.View.pas' {ViewDMVCF},
  DMVCF.Crud.Controller in 'Common\DMVCF.Crud.Controller.pas',
  DMVCF.Critical.Section in 'Common\DMVCF.Critical.Section.pas',
  Core.Context in 'Context\Core.Context.pas',
  DMVCF.Critical.Section.Impl in 'Common\Impl\DMVCF.Critical.Section.Impl.pas',
  DMVCF.Base.Business in 'Common\DMVCF.Base.Business.pas',
  DMVCF.Base.Persistence in 'Common\DMVCF.Base.Persistence.pas' {BasePersistence: TDataModule},
  DMVCF.Connection in 'Connection\DMVCF.Connection.pas' {DMVCFConnection: TDataModule},
  Pessoa.Persistence in 'Persistence\Pessoa.Persistence.pas' {PessoaPersistence: TDataModule},
  Pessoa.Business in 'Business\Pessoa.Business.pas',
  RESTFull.Context in 'Context\RESTFull.Context.pas',
  View.Context in 'Context\View.Context.pas',
  Business.Context in 'Context\Business.Context.pas',
  InfraFwk4D.Driver.FireDAC.Persistence in '..\..\..\InfraFramework4Delphi\src\InfraFwk4D.Driver.FireDAC.Persistence.pas' {FireDACPersistenceAdapter: TDataModule},
  Pessoa.Controller in 'Rest\Controllers\Pessoa.Controller.pas',
  DMVCF.WebModule in 'Rest\DMVCF.WebModule.pas' {WebModuleDMVCF: TWebModule},
  DMVCF.Query.Util in 'Util\DMVCF.Query.Util.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;

  ViewContext.RegisterTypes(GlobalContainer);
  CoreContext.RegisterTypes(GlobalContainer);
  BusinessContext.RegisterTypes(GlobalContainer);
  RESTFullContext.RegisterTypes(GlobalContainer);

  Application.Initialize;
  ServiceLocator.GetService<TViewDMVCF>;

  Application.Run;
end.
