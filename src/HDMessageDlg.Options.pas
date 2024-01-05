unit HDMessageDlg.Options;

interface

uses
  Data.DB,

  HDMessageDlg.Interfaces,
  HDMessageDlg.Platform,

  System.Classes,
  System.SysUtils;

type
  THDMessageOptions = class(TInterfacedObject, iHDMessageOptions)
  private
    FMsgTitle: String;
    FMsgQuestion: String;
    FMsgBody: String;
    FMsgIcon: string;
    FMsgType: TType;
    FMessagePlatform : iHDMessagePlatform;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iHDMessageOptions;
    function MsgTitle: String; overload;
    function MsgTitle(aValue: String): iHDMessageOptions; overload;
    function MsgQuestion: String; overload;
    function MsgQuestion(aValue: String): iHDMessageOptions; overload;
    function MsgBody: String; overload;
    function MsgBody(aValue: String): iHDMessageOptions; overload;
    function MsgIcon: string; overload;
    function MsgIcon(aValue: TIcon): iHDMessageOptions; overload;
    function MsgType: TType; overload;
    function MsgType(aValue: TType): iHDMessageOptions; overload;
    function MessagePlatform : iHDMessagePlatform;
  end;

implementation

{ THDMessageOptions }

constructor THDMessageOptions.Create;
begin
  FMessagePlatform := THDMessagePlatform.New(Self);
end;

destructor THDMessageOptions.Destroy;
begin

  inherited;
end;

function THDMessageOptions.MessagePlatform: iHDMessagePlatform;
begin
  Result := FMessagePlatform;
end;

function THDMessageOptions.MsgBody(aValue: String): iHDMessageOptions;
begin
  Result := Self;
  FMsgBody := aValue;
end;

function THDMessageOptions.MsgBody: String;
begin
  Result := FMsgBody;
end;

function THDMessageOptions.MsgIcon(aValue: TIcon): iHDMessageOptions;
begin
  Result := Self;
  case aValue of
    iAlert:     FMsgIcon := 'Alert';
    iAttention: FMsgIcon := 'Attention';
    iError:     FMsgIcon := 'Error';
    iLike:      FMsgIcon := 'Like';
    iMessage:   FMsgIcon := 'Message';
    iQuestion:  FMsgIcon := 'Question';
  end;
end;

function THDMessageOptions.MsgIcon: string;
begin
  Result := FMsgIcon;
end;

function THDMessageOptions.MsgQuestion: String;
begin
  Result := FMsgQuestion;
end;

function THDMessageOptions.MsgQuestion(aValue: String): iHDMessageOptions;
begin
  Result := Self;
  FMsgQuestion := aValue;
end;

function THDMessageOptions.MsgTitle: String;
begin
  Result := FMsgTitle;
end;

function THDMessageOptions.MsgTitle(aValue: String): iHDMessageOptions;
begin
  Result := Self;
  FMsgTitle := aValue;
end;

function THDMessageOptions.MsgType(aValue: TType): iHDMessageOptions;
begin
  Result := Self;
  FMsgType := aValue;
end;

function THDMessageOptions.MsgType: TType;
begin
  Result := FMsgType;
end;

class function THDMessageOptions.New: iHDMessageOptions;
begin
  Result := Self.Create;
end;

end.
