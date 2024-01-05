unit HDMessageDlg.Platform.FMX;

interface

uses
  Data.DB,

  HDMessageDlg.Interfaces,

  System.Classes,
  System.SysUtils;

type
  THDMessageFMX = class(TInterfacedObject, iHDMessageFMX)
  private
    [weak]
    FParent: iHDMessageOptions;
  public
    constructor Create(Parent: iHDMessageOptions);
    destructor Destroy; override;
    class function New(Parent: iHDMessageOptions): iHDMessageFMX;
    function DisplayMessage: iHDMessageFMX;
    function DisplayQuestion: Boolean;
  end;

implementation

{ THDMessageFMX }

constructor THDMessageFMX.Create(Parent: iHDMessageOptions);
begin
  FParent := Parent;
end;

destructor THDMessageFMX.Destroy;
begin

  inherited;
end;

function THDMessageFMX.DisplayMessage: iHDMessageFMX;
begin
  Result := Self;
end;

function THDMessageFMX.DisplayQuestion: Boolean;
begin
  Result := False;
end;

class function THDMessageFMX.New(Parent: iHDMessageOptions): iHDMessageFMX;
begin
  Result := Self.Create(Parent);
end;

end.
