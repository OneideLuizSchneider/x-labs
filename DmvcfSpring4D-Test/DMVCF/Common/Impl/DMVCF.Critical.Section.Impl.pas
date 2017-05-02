unit DMVCF.Critical.Section.Impl;

interface

uses
  DMVCF.Critical.Section,
  System.Classes,
  System.SyncObjs;

type

  TDMVCFCriticalSection = class(TInterfacedObject, IDMVCFCriticalSection)
  strict private
    FInternal: TCriticalSection;
  strict protected
  public
    constructor Create;
    destructor Destroy; override;

    procedure Enter;
    procedure Leave;
  end;

implementation

{ TDMVCFCriticalSection }

constructor TDMVCFCriticalSection.Create;
begin
  FInternal := TCriticalSection.Create;
end;

destructor TDMVCFCriticalSection.Destroy;
begin
  FInternal.Free;
  inherited;
end;

procedure TDMVCFCriticalSection.Enter;
begin
  FInternal.Enter;
end;

procedure TDMVCFCriticalSection.Leave;
begin
  FInternal.Leave;
end;

end.
