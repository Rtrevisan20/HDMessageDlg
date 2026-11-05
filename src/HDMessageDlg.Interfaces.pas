unit HDMessageDlg.Interfaces;

interface

type
  THDMessageType = (TyOK, TyQuestion);
  THDMessageDlgIcon = (TiAttention, TiError, TiLike, TiMessage, TiQuestion);
  TLanguage = (lgPortuguese, lgEnglish);

  IHDMessageDlg = interface
    ['{206A0343-2168-418C-9AB6-8A6412F91916}']
    function MsgTitle(aValue: String)       : IHDMessageDlg;
    function MsgQuestion(aValue: String)    : IHDMessageDlg;
    function MsgBody(aValue: String)        : IHDMessageDlg;
    function MsgIcon(aValue: THDMessageDlgIcon)         : IHDMessageDlg;
    function MsgType(aValue: THDMessageType)         : IHDMessageDlg;
    function MsgLanguage(aValue: TLanguage) : IHDMessageDlg;
    function DisplayMessage                 : IHDMessageDlg;
    function DisplayQuestion                : Boolean;
  end;

implementation

end.
