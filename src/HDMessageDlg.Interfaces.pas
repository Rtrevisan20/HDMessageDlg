unit HDMessageDlg.Interfaces;

interface

type
  TType = (tOK, tQuestion);
  TIcon = (iAlert, iAttention, iError, ilike, iMessage, iQuestion);
  iHDMessageFMX = Interface;
  iHDMessageVCL = interface;
  iHDMessagePlatform = interface;

  iHDMessageOptions = interface
    ['{206A0343-2168-418C-9AB6-8A6412F91916}']
    function MsgTitle: String; overload;
    function MsgTitle(aValue: String): iHDMessageOptions; overload;
    function MsgQuestion: String; overload;
    function MsgQuestion(aValue: String): iHDMessageOptions; overload;
    function MsgBody: String; overload;
    function MsgBody(aValue: String): iHDMessageOptions; overload;
    function MsgIcon: Integer; overload;
    function MsgIcon(aValue: TIcon): iHDMessageOptions; overload;
    function MsgType: TType; overload;
    function MsgType(aValue: TType): iHDMessageOptions; overload;
    function MessagePlatform : iHDMessagePlatform;
  end;

  iHDMessagePlatform = interface
    ['{2F2A5504-8628-4703-8509-1CA5B4260C2D}']
    function VCL : iHDMessageVCL;
    function FMX : iHDMessageFMX;
  end;

  iHDMessageFMX = interface
    ['{97759AB7-067B-47E9-992F-0624B74CAB0A}']
    function DisplayMessage: iHDMessageFMX;
    function DisplayQuestion: Boolean;
  end;

  iHDMessageVCL = interface
    ['{4BD7D5DF-2250-4335-8D87-6E2DDA39A9E6}']
    function DisplayMessage: iHDMessageVCL;
    function DisplayQuestion: Boolean;
  end;

implementation

end.
