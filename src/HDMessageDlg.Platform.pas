unit HDMessageDlg.Platform;

interface

uses
  Data.DB,

  HDMessageDlg.Interfaces,
  HDMessageDlg.Platform.FMX,
  HDMessageDlg.Platform.VCL,

  System.Classes,
  System.SysUtils;

type
  THDMessagePlatform = class(TInterfacedObject, iHDMessagePlatform)
  private
    [weak]
    FParent: iHDMessageOptions;
    FVCL: iHDMessageVCL;
    FFMX: iHDMessageFMX;
  public
    constructor Create(Parent: iHDMessageOptions);
    destructor Destroy; override;
    class function New(Parent: iHDMessageOptions): iHDMessagePlatform;
    function VCL: iHDMessageVCL;
    function FMX: iHDMessageFMX;
  end;

implementation

{ THDMessagePlatform }

constructor THDMessagePlatform.Create(Parent: iHDMessageOptions);
begin
  FParent := Parent;
end;

destructor THDMessagePlatform.Destroy;
begin

  inherited;
end;

function THDMessagePlatform.FMX: iHDMessageFMX;
begin
  if not Assigned(FFMX) then
    FFMX := THDMessageFMX.New(FParent);
  Result := FFMX;
end;

class function THDMessagePlatform.New(Parent: iHDMessageOptions)
  : iHDMessagePlatform;
begin
  Result := Self.Create(Parent);
end;

function THDMessagePlatform.VCL: iHDMessageVCL;
begin
  if not Assigned(FVCL) then
    FVCL := THDMessageVCL.New(FParent);
  Result := FVCL;
end;

end.
