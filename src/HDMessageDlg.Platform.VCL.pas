unit HDMessageDlg.Platform.VCL;

interface

uses
  Data.DB,

  HDMessageDlg.Interfaces,
  HDMessageDlg.View.VCL,

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
var
  HDMessageDlgVCL : THDMessageDlgVCL;
begin
  Result := Self;
  HDMessageDlgVCL := THDMessageDlgVCL.Create(nil);
  try
   HDMessageDlgVCL.MsgTitle    := FParent.MsgTitle;
   HDMessageDlgVCL.MsgQuestion := FParent.MsgQuestion;
   HDMessageDlgVCL.MsgBody     := FParent.MsgBody;
   HDMessageDlgVCL.MsgIcon     := FParent.MsgIcon;
   HDMessageDlgVCL.MsgType     := FParent.MsgType;
   HDMessageDlgVCL.ShowModal;
  finally
    FreeAndNil(HDMessageDlgVCL);
  end;
end;

function THDMessageVCL.DisplayQuestion: Boolean;
var
  HDMessageDlgVCL : THDMessageDlgVCL;
begin
  HDMessageDlgVCL := THDMessageDlgVCL.Create(nil);
  try
   HDMessageDlgVCL.MsgTitle    := FParent.MsgTitle;
   HDMessageDlgVCL.MsgQuestion := FParent.MsgQuestion;
   HDMessageDlgVCL.MsgBody     := FParent.MsgBody;
   HDMessageDlgVCL.MsgIcon     := FParent.MsgIcon;
   HDMessageDlgVCL.MsgType     := FParent.MsgType;
   HDMessageDlgVCL.ShowModal;
   Result := HDMessageDlgVCL.MsgResponse;
  finally
    FreeAndNil(HDMessageDlgVCL);
  end;
end;

class function THDMessageVCL.New(Parent: iHDMessageOptions): iHDMessageVCL;
begin
  Result := Self.Create(Parent);
end;

end.
