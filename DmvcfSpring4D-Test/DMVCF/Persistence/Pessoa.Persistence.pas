unit Pessoa.Persistence;

interface

uses
  System.SysUtils, System.Classes, DMVCF.Base.Persistence, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPessoaPersistence = class(TBasePersistence)
    FDQueryPessoa: TFDQuery;
    FDQueryPessoaid: TIntegerField;
    FDQueryPessoanome: TWideStringField;
    FDQueryPessoacpfcnpj: TWideStringField;
    FDQueryPessoaendereco_id: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation


{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
