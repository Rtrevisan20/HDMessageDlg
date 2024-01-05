unit HDMessageDlg.Platform.VCL;

interface

uses
  Data.DB,

  HDMessageDlg.Interfaces,

  System.Classes,
  System.SysUtils;

type
  THDMessageVCL = class(TInterfacedObject, iHDMessageVCL)
  private
    [weak]
    FParent: iHDMessageOptions;
  public
    constructor Create(Parent: iHDMessageOptions);
    destructor Destroy; override;
    class function New(Parent: iHDMessageOptions): iHDMessageVCL;
    function DisplayMessage: iHDMessageVCL;
    function DisplayQuestion: Boolean;
  end;

implementation

{ THDMessageVCL }

constructor THDMessageVCL.Create(Parent: iHDMessageOptions);
begin
  FParent := Parent;
end;

destructor THDMessageVCL.Destroy;
begin

  inherited;
end;

function THDMessageVCL.DisplayMessage: iHDMessageVCL;
begin
  Result := Self;
end;

function THDMessageVCL.DisplayQuestion: Boolean;
begin
  Result := False;
end;

class function THDMessageVCL.New(Parent: iHDMessageOptions): iHDMessageVCL;
begin
  Result := Self.Create(Parent);
end;

end.
