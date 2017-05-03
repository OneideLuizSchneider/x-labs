program Client;

uses
  Vcl.Forms,
  Principal.View in 'Principal.View.pas' {Form5};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm5, Form5);
  Application.Run;
end.
