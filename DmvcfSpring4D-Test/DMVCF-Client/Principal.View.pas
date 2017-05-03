unit Principal.View;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  MVCFramework.RESTClient,
  MVCFramework.Commons, Vcl.StdCtrls, Data.DB, Datasnap.DBClient, Vcl.Grids,
  Vcl.DBGrids, frxClass, frxDBSet;

type
  TForm5 = class(TForm)
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
    mmo1: TMemo;
    lbl2: TLabel;
    btn2: TButton;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
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
  mmo1.Lines.Clear;
  FRest := TRESTClient.Create('localhost', StrToInt(edtPort.Text));
  try
    FRest.Accept(TMVCMediaType.APPLICATION_JSON);
    FRest.ContentType(TMVCMediaType.APPLICATION_JSON);
    FRest.AcceptCharSet(TMVCCharSet.ISO88591);
    FRest.ContentCharSet(TMVCCharSet.ISO88591);
    FRest.ReadTimeOut(500000);
    FRest.ConnectionTimeOut(500000);

    if (DtsPessoa.Active) then
      DtsPessoa.EmptyDataSet
    else
      DtsPessoa.CreateDataSet;

    DtsPessoa.DisableControls;
    mmo1.Lines.Add('Iniciou...' + DateTimeToStr(Now));
    response := FRest.Resource('/pessoa').doGET;
    mmo1.Lines.Add('Finalizou requisação REST...' + DateTimeToStr(Now));
    case response.ResponseCode of
      HTTP_STATUS.OK:
        begin
          mmo1.Lines.Add('Iniciando serealizacao...' + DateTimeToStr(Now));
          TConverter.New.JSON.Source(response.BodyAsJSONArray).ToDataSet(DtsPessoa);
          mmo1.Lines.Add('Finalizou serealizacao...' + DateTimeToStr(Now));
        end;
      HTTP_STATUS.NoContent:
        raise Exception.Create(response.ResponseCode.ToString + ' - ' + response.ResponseText);
      HTTP_STATUS.NotFound:
        raise Exception.Create(response.ResponseCode.ToString + ' - ' + response.ResponseText);
    else
      raise Exception.Create(response.ResponseCode.ToString + ' - ' + response.ResponseText);
    end;
  finally
    DtsPessoa.First;
    DtsPessoa.EnableControls;
    FRest.Free;
  end;
end;

procedure TForm5.btn2Click(Sender: TObject);
begin
  frxReport1.Showreport;
end;

end.
