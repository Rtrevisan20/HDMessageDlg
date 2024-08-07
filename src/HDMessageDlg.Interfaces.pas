unit HDMessageDlg.Interfaces;

interface

type
  TType = (TyOK, TyQuestion);
  TIcon = (TiAttention, TiError, TiLike, TiMessage, TiQuestion);

  iHDMessageDlg = interface
    ['{206A0343-2168-418C-9AB6-8A6412F91916}']
    function MsgTitle(aValue: String)   : iHDMessageDlg;
    function MsgQuestion(aValue: String): iHDMessageDlg;
    function MsgBody(aValue: String)    : iHDMessageDlg;
    function MsgIcon(aValue: TIcon)     : iHDMessageDlg;
    function MsgType(aValue: TType)     : iHDMessageDlg;
    function DisplayMessage             : iHDMessageDlg;
    function DisplayQuestion            : Boolean;
  end;

implementation

end.
