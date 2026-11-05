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
  THDMessageDlg = class(TInterfacedObject, IHDMessageDlg)
  private
    FMsgTitle         : String;
    FMsgQuestion      : String;
    FMsgBody          : String;
    FMsgIcon          : string;
    FMsgType          : THDMessageType;
    FColorSvgIcon     : TAlphaColor;
    FColorBackground : TAlphaColor;
    FLanguage        : TLanguage;
    function CreateForm: THDMessageDlgFMX;
  public
    class var DefaultLanguage: TLanguage;
    constructor Create;
    class function New: IHDMessageDlg;
    function MsgTitle(aValue: String)   : IHDMessageDlg;
    function MsgQuestion(aValue: String): IHDMessageDlg;
    function MsgBody(aValue: String)    : IHDMessageDlg;
    function MsgIcon(aValue: THDMessageDlgIcon)         : IHDMessageDlg;
    function MsgType(aValue: THDMessageType)         : IHDMessageDlg;
    function MsgLanguage(aValue: TLanguage) : IHDMessageDlg;
    function DisplayMessage             : IHDMessageDlg;
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
  Result.ColorBackground := FColorBackground;
end;

function THDMessageDlg.DisplayMessage: IHDMessageDlg;
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

function THDMessageDlg.MsgBody(aValue: String): IHDMessageDlg;
begin
  Result   := Self;
  FMsgBody := aValue;
end;

function THDMessageDlg.MsgIcon(aValue: THDMessageDlgIcon): IHDMessageDlg;
begin
  Result            := Self;
  FMsgIcon          := THDMessageDlgIconsSVG.Icon(aValue);
  FColorSvgIcon     := THDMessageDlgIconsSVG.ColorSvgIcon(aValue);
  FColorBackground := THDMessageDlgIconsSVG.ColorBackground(aValue);
end;

function THDMessageDlg.MsgQuestion(aValue: String): IHDMessageDlg;
begin
  Result       := Self;
  FMsgQuestion := aValue;
end;

function THDMessageDlg.MsgTitle(aValue: String): IHDMessageDlg;
begin
  Result    := Self;
  FMsgTitle := aValue;
end;

function THDMessageDlg.MsgType(aValue: THDMessageType): IHDMessageDlg;
begin
  Result   := Self;
  FMsgType := aValue;
end;

function THDMessageDlg.MsgLanguage(aValue: TLanguage): IHDMessageDlg;
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
  FColorBackground := THDMessageDlgIconsSVG.ColorBackground(TiMessage);
  FLanguage         := DefaultLanguage;
end;

class function THDMessageDlg.New: IHDMessageDlg;
begin
  Result := Self.Create;
end;

initialization
  THDMessageDlg.DefaultLanguage := lgPortuguese;

end.
