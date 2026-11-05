unit HDMessageDlg;

interface

uses
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
    FLanguage        : TLanguage;
    function CreateForm: THDMessageDlgFMX;
  public
    class var DefaultLanguage: TLanguage;
    constructor Create;
    class function New: iHDMessageDlg;
    function MsgTitle(aValue: String)   : iHDMessageDlg;
    function MsgQuestion(aValue: String): iHDMessageDlg;
    function MsgBody(aValue: String)    : iHDMessageDlg;
    function MsgIcon(aValue: TIcon)         : iHDMessageDlg;
    function MsgType(aValue: TType)         : iHDMessageDlg;
    function MsgLanguage(aValue: TLanguage) : iHDMessageDlg;
    function DisplayMessage             : iHDMessageDlg;
    function DisplayQuestion            : Boolean;
  end;

implementation

function THDMessageDlg.CreateForm: THDMessageDlgFMX;
begin
  Result := THDMessageDlgFMX.Create(nil);
  Result.MsgTitle         := FMsgTitle;
  Result.MsgQuestion      := FMsgQuestion;
  Result.MsgBody          := FMsgBody;
  Result.MsgIcon          := FMsgIcon;
  Result.MsgType          := FMsgType;
  Result.Language         := FLanguage;
  Result.ColorSvgIcon     := FColorSvgIcon;
  Result.ColorBackuground := FColorBackuground;
end;

function THDMessageDlg.DisplayMessage: iHDMessageDlg;
var
  HDMessageDlgFMX : THDMessageDlgFMX;
begin
  Result := Self;
  HDMessageDlgFMX := CreateForm;
  try
    HDMessageDlgFMX.ShowModal;
  finally
    FreeAndNil(HDMessageDlgFMX);
  end;
end;

function THDMessageDlg.DisplayQuestion: Boolean;
var
  HDMessageDlgFMX : THDMessageDlgFMX;
begin
  HDMessageDlgFMX := CreateForm;
  try
    HDMessageDlgFMX.ShowModal;
    Result := HDMessageDlgFMX.MsgResponse;
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
  Result            := Self;
  FMsgIcon          := THDMessageDlgIconsSVG.Icon(aValue);
  FColorSvgIcon     := THDMessageDlgIconsSVG.ColorSvgIcon(aValue);
  FColorBackuground := THDMessageDlgIconsSVG.ColorBackuground(aValue);
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

function THDMessageDlg.MsgLanguage(aValue: TLanguage): iHDMessageDlg;
begin
  Result    := Self;
  FLanguage := aValue;
end;

constructor THDMessageDlg.Create;
begin
  inherited;
  // defaults quando MsgIcon não for chamado
  FMsgIcon          := THDMessageDlgIconsSVG.Icon(TiMessage);
  FColorSvgIcon     := THDMessageDlgIconsSVG.ColorSvgIcon(TiMessage);
  FColorBackuground := THDMessageDlgIconsSVG.ColorBackuground(TiMessage);
  FLanguage         := DefaultLanguage;
end;

class function THDMessageDlg.New: iHDMessageDlg;
begin
  Result := Self.Create;
end;

initialization
  THDMessageDlg.DefaultLanguage := lgPortuguese;

end.
