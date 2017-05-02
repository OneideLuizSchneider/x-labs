unit DMVCF.View;

interface

uses
  Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.AppEvnts, Vcl.StdCtrls, IdHTTPWebBrokerBridge, Web.HTTPApp,
  MVCFramework.Server,
  MVCFramework.Server.Impl;

type
  TViewDMVCF = class(TForm)
    ButtonStart: TButton;
    ButtonStop: TButton;
    EditPort: TEdit;
    Label1: TLabel;
    ButtonOpenBrowser: TButton;
    procedure ButtonStartClick(Sender: TObject);
    procedure ButtonOpenBrowserClick(Sender: TObject);
    procedure ButtonStopClick(Sender: TObject);
  private
    FServerListenerCtx: IMVCListenersContext;
    procedure StartServer;
  end;

var
  ViewDMVCF: TViewDMVCF;

implementation

{$R *.dfm}

uses
  WinApi.Windows, Winapi.ShellApi, DMVCF.WebModule;

procedure TViewDMVCF.ButtonOpenBrowserClick(Sender: TObject);
var
  LURL: string;
begin
//  StartServer;
  LURL := Format('http://localhost:%s', [EditPort.Text]);
  ShellExecute(0, nil, PChar(LURL), nil, nil, SW_SHOWNOACTIVATE);
end;

procedure TViewDMVCF.ButtonStartClick(Sender: TObject);
begin
  StartServer;
end;

procedure TViewDMVCF.ButtonStopClick(Sender: TObject);
begin
  FServerListenerCtx.StopAll;
end;

procedure TViewDMVCF.StartServer;
begin
  if not(Assigned(FServerListenerCtx)) then
  begin
    FServerListenerCtx := TMVCListenersContext.Create;
    FServerListenerCtx.Add(TMVCListenerProperties.New
       .SetName('RESTFullStandalone')
       .SetPort(StrToInt(EditPort.Text))
       .SetMaxConnections(1024)
       .SetWebModuleClass(RESTFullWebModuleClass)
     );
  end;
  FServerListenerCtx.StartAll;
end;

end.
