unit DMVCF.Query.Util;

interface

uses
  Firedac.Stan.Intf, Firedac.Stan.Option,
  Firedac.Stan.Param, Firedac.Stan.Error, Firedac.DatS, Firedac.Phys.Intf,
  Firedac.DApt.Intf, Firedac.Stan.Async, Firedac.DApt, Firedac.Comp.DataSet,
  Firedac.Comp.Client,
  Variants, StrUtils, SysUtils;

type
  TDMVCFQueryUtil = class
  public
    class procedure ClearWhere(pQry: TFDQuery);
  end;

implementation


class procedure TDMVCFQueryUtil.ClearWhere(pQry: TFDQuery);
var
  i, h: Integer;
begin
  for i := 0 to pQry.SQL.Count - 1 do
  begin
    if (UpperCase(Copy(pQry.SQL.Strings[i], 1, 5)) = 'WHERE') or
      (UpperCase(Copy(pQry.SQL.Strings[i], 1, 5)) = 'ORDER') then
      Break;
  end;
  for h := pQry.SQL.Count - 1 downto i do
    pQry.SQL.Delete(h);
end;

end.

