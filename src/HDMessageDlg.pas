unit HDMessageDlg;

interface

uses
  Data.DB,

  HDMessageDlg.IconsSVG,
  HDMessageDlg.Interfaces,
  HDMessageDlg.View.FMX,

  System.Classes,
  System.SysUtils,
  System.UITypes;

type
  THDMessageDlg = class(TInterfacedObject, iHDMessageDlg)
  private
    FMsgTitle         : String;
    FMsgQuestion      : String;
    FMsgBody          : String;
    FMsgIcon          : string;
    FMsgType          : TType;
    FColorSvgIcon     : TAlphaColor;
    FColorBackuground : TAlphaColor;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iHDMessageDlg;
    function MsgTitle(aValue: String)   : iHDMessageDlg;
    function MsgQuestion(aValue: String): iHDMessageDlg;
    function MsgBody(aValue: String)    : iHDMessageDlg;
    function MsgIcon(aValue: TIcon)     : iHDMessageDlg;
    function MsgType(aValue: TType)     : iHDMessageDlg;
    function DisplayMessage             : iHDMessageDlg;
    function DisplayQuestion            : Boolean;
  end;

implementation

constructor THDMessageDlg.Create;
begin
end;

destructor THDMessageDlg.Destroy;
begin
  inherited;
end;

function THDMessageDlg.DisplayMessage: iHDMessageDlg;
var
  HDMessageDlgFMX : THDMessageDlgFMX;
begin
  Result := Self;
  HDMessageDlgFMX := THDMessageDlgFMX.Create(nil);
  try
   HDMessageDlgFMX.MsgTitle         := FMsgTitle;
   HDMessageDlgFMX.MsgQuestion      := FMsgQuestion;
   HDMessageDlgFMX.MsgBody          := FMsgBody;
   HDMessageDlgFMX.MsgIcon          := FMsgIcon;
   HDMessageDlgFMX.MsgType          := FMsgType;
   HDMessageDlgFMX.ColorSvgIcon     := FColorSvgIcon;
   HDMessageDlgFMX.ColorBackuground := FColorBackuground;
   HDMessageDlgFMX.ShowModal;
  finally
   FreeAndNil(HDMessageDlgFMX);
  end;
end;

function THDMessageDlg.DisplayQuestion: Boolean;
var
  HDMessageDlgFMX : THDMessageDlgFMX;
begin
  HDMessageDlgFMX := THDMessageDlgFMX.Create(nil);
  try
   HDMessageDlgFMX.MsgTitle         := FMsgTitle;
   HDMessageDlgFMX.MsgQuestion      := FMsgQuestion;
   HDMessageDlgFMX.MsgBody          := FMsgBody;
   HDMessageDlgFMX.MsgIcon          := FMsgIcon;
   HDMessageDlgFMX.MsgType          := FMsgType;
   HDMessageDlgFMX.ColorSvgIcon     := FColorSvgIcon;
   HDMessageDlgFMX.ColorBackuground := FColorBackuground;
   HDMessageDlgFMX.ShowModal;
   Result                           := HDMessageDlgFMX.MsgResponse;
  finally
   FreeAndNil(HDMessageDlgFMX);
  end;
end;

function THDMessageDlg.MsgBody(aValue: String): iHDMessageDlg;
begin
  Result   := Self;
  FMsgBody := aValue;
end;

function THDMessageDlg.MsgIcon(aValue: TIcon): iHDMessageDlg;
begin
  Result := Self;
  case aValue of
   TiAttention:
     begin
      FMsgIcon          := THDMessageDlgIconsSVG.Icon(aValue);
      FColorSvgIcon     := THDMessageDlgIconsSVG.ColorSvgIcon(aValue);
      FColorBackuground := THDMessageDlgIconsSVG.ColorBackuground(aValue);
     end;
   TiError:
     begin
      FMsgIcon          := THDMessageDlgIconsSVG.Icon(aValue);
      FColorSvgIcon     := THDMessageDlgIconsSVG.ColorSvgIcon(aValue);
      FColorBackuground := THDMessageDlgIconsSVG.ColorBackuground(aValue);
     end;
   TiLike:
     begin
      FMsgIcon          := THDMessageDlgIconsSVG.Icon(aValue);
      FColorSvgIcon     := THDMessageDlgIconsSVG.ColorSvgIcon(aValue);
      FColorBackuground := THDMessageDlgIconsSVG.ColorBackuground(aValue);
     end;
   TiMessage:
     begin
      FMsgIcon          := THDMessageDlgIconsSVG.Icon(aValue);
      FColorSvgIcon     := THDMessageDlgIconsSVG.ColorSvgIcon(aValue);
      FColorBackuground := THDMessageDlgIconsSVG.ColorBackuground(aValue);
     end;
   TiQuestion:
     begin
      FMsgIcon          := THDMessageDlgIconsSVG.Icon(aValue);
      FColorSvgIcon     := THDMessageDlgIconsSVG.ColorSvgIcon(aValue);
      FColorBackuground := THDMessageDlgIconsSVG.ColorBackuground(aValue);
     end;
  end;
end;

function THDMessageDlg.MsgQuestion(aValue: String): iHDMessageDlg;
begin
  Result       := Self;
  FMsgQuestion := aValue;
end;

function THDMessageDlg.MsgTitle(aValue: String): iHDMessageDlg;
begin
  Result    := Self;
  FMsgTitle := aValue;
end;

function THDMessageDlg.MsgType(aValue: TType): iHDMessageDlg;
begin
  Result   := Self;
  FMsgType := aValue;
end;

class function THDMessageDlg.New: iHDMessageDlg;
begin
  Result := Self.Create;
end;

end.
