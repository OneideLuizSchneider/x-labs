unit DMVCF.Crud.Controller;

interface

uses
  System.Rtti,
  System.SysUtils,
  MVCFramework,
  MVCFramework.Commons,
  Spring.Services,
  Spring.Collections,
  DMVCF.Critical.Section,
  DMVCF.Base.Business,
  DMVCF.Base.Persistence;

type

  TRESTFullController = class(TMVCController)
  end;

  TDMVCFCrudController<TBusiness: class> = class(TRESTFullController)
  strict private
    FCriticalSection: IDMVCFCriticalSection;
    FBusiness: TBaseBC<TBasePersistence>;
  strict protected
    procedure MVCControllerAfterCreate; override;
    procedure MVCControllerBeforeDestroy; override;

    function GetCriticalSection: IDMVCFCriticalSection;
  public
    [MVCPath('/($id)')]
    [MVCHTTPMethod([httpGET])]
    [MVCProduces(TMVCMediaType.APPLICATION_JSON, TMVCCharSet.ISO88591)]
    procedure FindOne(ctx: TWebContext); virtual;

    [MVCPath]
    [MVCHTTPMethod([httpGET])]
    [MVCProduces(TMVCMediaType.APPLICATION_JSON, TMVCCharSet.ISO88591)]
    procedure FindAll(ctx: TWebContext); virtual;

    [MVCPath]
    [MVCHTTPMethod([httpPOST])]
    [MVCProduces(TMVCMediaType.APPLICATION_JSON, TMVCCharSet.ISO88591)]
    [MVCConsumes(TMVCMediaType.APPLICATION_JSON)]
    procedure Insert(ctx: TWebContext); virtual;

    [MVCPath('/($id)')]
    [MVCHTTPMethod([httpPUT])]
    [MVCProduces(TMVCMediaType.APPLICATION_JSON, TMVCCharSet.ISO88591)]
    [MVCConsumes(TMVCMediaType.APPLICATION_JSON)]
    procedure Update(ctx: TWebContext); virtual;

    [MVCPath('/($id)')]
    [MVCHTTPMethod([httpDELETE])]
    procedure Delete(ctx: TWebContext); virtual;
  end;

implementation

{ TDMVCFCrudController<Business> }

procedure TDMVCFCrudController<TBusiness>.Delete(ctx: TWebContext);
begin

end;

procedure TDMVCFCrudController<TBusiness>.FindAll(ctx: TWebContext);
begin
  FBusiness.Persistence.GetDataSet().Open();
  Render(FBusiness.Persistence.GetDataSet());
end;

procedure TDMVCFCrudController<TBusiness>.FindOne(ctx: TWebContext);
begin

end;

procedure TDMVCFCrudController<TBusiness>.MVCControllerAfterCreate;
begin
  inherited;
  FCriticalSection := ServiceLocator.GetService<IDMVCFCriticalSection>;
  FBusiness := TBaseBC<TBasePersistence>(ServiceLocator.GetService<TBusiness>);
end;

procedure TDMVCFCrudController<TBusiness>.MVCControllerBeforeDestroy;
begin
  inherited;
  FBusiness.Free;
end;

function TDMVCFCrudController<TBusiness>.GetCriticalSection: IDMVCFCriticalSection;
begin
  Result := FCriticalSection;
end;

procedure TDMVCFCrudController<TBusiness>.Insert(ctx: TWebContext);
begin

end;

procedure TDMVCFCrudController<TBusiness>.Update(ctx: TWebContext);
begin

end;

end.
