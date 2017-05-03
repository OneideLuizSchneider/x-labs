unit DMVCF.WebModule;

interface

uses
  System.SysUtils, System.Classes, Web.HTTPApp,
  MVCFramework,
  MVCFramework.Commons,
  Spring.Services;

type
  TWebModuleDMVCF = class(TWebModule)
    procedure WebModuleCreate(Sender: TObject);
    procedure WebModuleDestroy(Sender: TObject);
  private
    FEngine: TMVCEngine;
    procedure RegisterControllers;
  end;

var
  RESTFullWebModuleClass: TComponentClass = TWebModuleDMVCF;

implementation

uses
  Pessoa.Controller;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}


procedure TWebModuleDMVCF.RegisterControllers;
begin
  FEngine.AddController(TPessoaController)
end;

procedure TWebModuleDMVCF.WebModuleCreate(Sender: TObject);
begin
  FEngine := TMVCEngine.Create(Self);
  FEngine.Config[TMVCConfigKey.SessionTimeout] := '500';
  FEngine.Config[TMVCConfigKey.DefaultContentType] := TMVCMediaType.APPLICATION_JSON;
  FEngine.Config[TMVCConfigKey.DefaultContentCharset] := TMVCCharSet.ISO88591;
  RegisterControllers();
end;

procedure TWebModuleDMVCF.WebModuleDestroy(Sender: TObject);
begin
  FEngine.Free;
end;

end.
