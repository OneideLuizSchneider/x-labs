unit Principal.View;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  MVCFramework.RESTClient,
  MVCFramework.Commons, Vcl.StdCtrls, Data.DB, Datasnap.DBClient, Vcl.Grids,
  Vcl.DBGrids;

type
  TForm5 = class(TForm)
    btnStart: TButton;
    dbgrd1: TDBGrid;
    btn1: TButton;
    dsPessoa: TDataSource;
    DtsPessoa: TClientDataSet;
    DtsPessoaid: TIntegerField;
    DtsPessoanome: TStringField;
    DtsPessoacpfcnpj: TStringField;
    DtsPessoaendereco_id: TIntegerField;
    edtPort: TEdit;
    lbl1: TLabel;
    procedure btnStartClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
    FRest: TRESTClient;
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

uses
  System.JSON,
  DataSetConverter4D,
  DataSetConverter4D.Impl;

{$R *.dfm}

procedure TForm5.btn1Click(Sender: TObject);
var
  response: IRESTResponse;
  vJsonArray: TJSONArray;
begin
  if (DtsPessoa.Active) then
    DtsPessoa.EmptyDataSet
  else
    DtsPessoa.CreateDataSet;

  response := FRest.Resource('/pessoa').doGET;
  case response.ResponseCode of
    HTTP_STATUS.OK:
      begin
        TConverter.New.JSON.Source(response.BodyAsJSONArray).ToDataSet(DtsPessoa);
      end;
    HTTP_STATUS.NoContent:
      raise Exception.Create(response.ResponseCode.ToString + ' - ' + response.ResponseText);
    HTTP_STATUS.NotFound:
      raise Exception.Create(response.ResponseCode.ToString + ' - ' + response.ResponseText);
  else
    raise Exception.Create(response.ResponseCode.ToString + ' - ' + response.ResponseText);
  end;
end;

procedure TForm5.btnStartClick(Sender: TObject);
begin
  FRest := TRESTClient.Create('localhost', StrToInt(edtPort.Text));
  FRest.Accept(TMVCMediaType.APPLICATION_JSON);
  FRest.ContentType(TMVCMediaType.APPLICATION_JSON);
  FRest.AcceptCharSet(TMVCCharSet.ISO88591);
  FRest.ContentCharSet(TMVCCharSet.ISO88591);
end;

end.
