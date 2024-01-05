unit HDMessageDlg.Platform.FMX;

interface

uses
  Data.DB,

  HDMessageDlg.Interfaces,
  HDMessageDlg.View.FMX,

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
var
  HDMessageDlgFMX : THDMessageDlgFMX;
begin
  Result := Self;
  HDMessageDlgFMX := THDMessageDlgFMX.Create(nil);
  try
   HDMessageDlgFMX.MsgTitle    := FParent.MsgTitle;
   HDMessageDlgFMX.MsgQuestion := FParent.MsgQuestion;
   HDMessageDlgFMX.MsgBody     := FParent.MsgBody;
   HDMessageDlgFMX.MsgIcon     := FParent.MsgIcon;
   HDMessageDlgFMX.MsgType     := FParent.MsgType;
   HDMessageDlgFMX.ShowModal;
  finally
    FreeAndNil(HDMessageDlgFMX);
  end;
end;

function THDMessageFMX.DisplayQuestion: Boolean;
var
  HDMessageDlgFMX : THDMessageDlgFMX;
begin
  HDMessageDlgFMX := THDMessageDlgFMX.Create(nil);
  try
   HDMessageDlgFMX.MsgTitle    := FParent.MsgTitle;
   HDMessageDlgFMX.MsgQuestion := FParent.MsgQuestion;
   HDMessageDlgFMX.MsgBody     := FParent.MsgBody;
   HDMessageDlgFMX.MsgIcon     := FParent.MsgIcon;
   HDMessageDlgFMX.MsgType     := FParent.MsgType;
   HDMessageDlgFMX.ShowModal;
   Result := HDMessageDlgFMX.MsgResponse;
  finally
    FreeAndNil(HDMessageDlgFMX);
  end;

end;

class function THDMessageFMX.New(Parent: iHDMessageOptions): iHDMessageFMX;
begin
  Result := Self.Create(Parent);
end;

end.
