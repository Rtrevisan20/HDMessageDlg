unit HDMessageDlg.View.FMX;

interface

uses
  FMX.Controls,
  FMX.Controls.Presentation,
  FMX.Dialogs,
  FMX.Effects,
  FMX.Forms,
  FMX.Graphics,
  FMX.Layouts,
  FMX.Objects,
  FMX.StdCtrls,
  FMX.Types,
  HDMessageDlg.Interfaces,
  System.Classes,
  System.SysUtils,
  System.UITypes;

type
  THDMessageDlgFMX = class(TForm)
    RecBackground     : TRectangle;
    LayoutContainer   : TLayout;
    LayoutTop         : TLayout;
    RecLblTitle: TRectangle;
    lbl_Title         : TLabel;
    LayoutContainerMessage: TLayout;
    LayoutIMG         : TLayout;
    LayoutMessage     : TLayout;
    lbl_Question      : TLabel;
    lbl_BodyMessage   : TLabel;
    LayoutButtons     : TLayout;
    LayoutYes         : TLayout;
    BackbtnYes        : TRectangle;
    btnYes            : TButton;
    ShadowEffectBtnSim: TShadowEffect;
    LayoutNo          : TLayout;
    BackbtnNo         : TRectangle;
    btnNo             : TButton;
    ShadowEffectBtnNao: TShadowEffect;
    StyleBook         : TStyleBook;
    PathIconSVG: TPath;
    procedure FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btnNoClick(Sender: TObject);
    procedure btnYesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RecLblTitleMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
      Y: Single);
  private
    FMsgTitle         : string;
    FMsgQuestion      : string;
    FMsgBody          : string;
    FMsgType          : THDMessageType;
    FMsgIcon          : string;
    FColorSvgIcon     : TAlphaColor;
    FMsgResponse      : Boolean;
    FColorBackground : TAlphaColor;
    FLanguage         : TLanguage;
    procedure SetMsgIcon(const Value: string);
    procedure SetMsgBody(const Value: string);
    procedure SetMsgQuestion(const Value: string);
    procedure SetMsgType(const Value: THDMessageType);
    procedure SetMsgTitle(const Value: string);
    procedure SetupOk;
    procedure SetupQuestion;
    procedure ConfirmNo;
    procedure ConfirmYes;
  published
    property MsgTitle         : string      read FMsgTitle         write SetMsgTitle;
    property MsgQuestion      : string      read FMsgQuestion      write SetMsgQuestion;
    property MsgBody          : string      read FMsgBody          write SetMsgBody;
    property MsgIcon          : string      read FMsgIcon          write SetMsgIcon;
    property MsgResponse      : Boolean     read FMsgResponse;
    property MsgType          : THDMessageType       read FMsgType          write SetMsgType;
    property Language         : TLanguage   read FLanguage         write FLanguage;
    property ColorSvgIcon     : TAlphaColor read FColorSvgIcon     write FColorSvgIcon;
    property ColorBackground : TAlphaColor read FColorBackground write FColorBackground;
  end;

implementation

uses
  HDMessageDlg.Consts;

{$R *.fmx}

procedure THDMessageDlgFMX.btnNoClick(Sender: TObject);
begin
  ConfirmNo;
end;

procedure THDMessageDlgFMX.btnYesClick(Sender: TObject);
begin
  ConfirmYes;
end;

procedure THDMessageDlgFMX.FormCreate(Sender: TObject);
begin
  // Set Color
  RecLblTitle.Fill.Color     := TAlphaColor(FMXColorTop);
  BackbtnNo.Fill.Color       := TAlphaColor(FMXColorButtonNo);
  BackbtnYes.Fill.Color      := TAlphaColor(FMXColorButtonYes);
  lbl_Title.FontColor        := TAlphaColor(FMXLabelTitle);
  lbl_Question.FontColor     := TAlphaColor(FMXLabelQuestion);
  lbl_BodyMessage.FontColor  := TAlphaColor(FMXLabelBodyMessage);
  btnNo.FontColor            := TAlphaColor(FMXTextButtonNo);
  btnYes.FontColor           := TAlphaColor(FMXTextButtonYes);
  FLanguage                  := lgPortuguese;
end;

procedure THDMessageDlgFMX.FormKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  if LayoutYes.Visible and (Key = vkReturn) then
  begin
    Key     := 0;
    KeyChar := #0;
    ConfirmYes;
    Exit;
  end;

  if LayoutNo.Visible and (Key = vkEscape) then
  begin
    Key     := 0;
    KeyChar := #0;
    ConfirmNo;
  end;
end;

procedure THDMessageDlgFMX.FormShow(Sender: TObject);
begin
  FMsgResponse             := False;
  lbl_Title.Text           := FMsgTitle;
  lbl_Question.Text        := FMsgQuestion;
  lbl_BodyMessage.Text     := FMsgBody;
  RecBackground.Fill.Color := TAlphaColor(FColorBackground);
  PathIconSVG.Fill.Color   := FColorSvgIcon;
  PathIconSVG.Data.Data    := FMsgIcon;

  case FMsgType of
   TyOK      : SetupOk;
   TyQuestion: SetupQuestion;
  end;
end;

procedure THDMessageDlgFMX.RecLblTitleMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  if (Button = TMouseButton.mbLeft) then StartWindowDrag;
end;

procedure THDMessageDlgFMX.SetMsgIcon(const Value: string);
begin
  FMsgIcon := Value;
end;

procedure THDMessageDlgFMX.SetMsgBody(const Value: string);
begin
  FMsgBody := Value;
end;

procedure THDMessageDlgFMX.ConfirmNo;
begin
  FMsgResponse := False;
  Close;
end;

procedure THDMessageDlgFMX.SetMsgQuestion(const Value: string);
begin
  FMsgQuestion := Value;
end;

procedure THDMessageDlgFMX.ConfirmYes;
begin
  FMsgResponse := True;
  Close;
end;

procedure THDMessageDlgFMX.SetMsgType(const Value: THDMessageType);
begin
  FMsgType := Value;
end;

procedure THDMessageDlgFMX.SetMsgTitle(const Value: string);
begin
  FMsgTitle := Value;
end;

procedure THDMessageDlgFMX.SetupOk;
begin
  LayoutNo.Visible := False;
  btnYes.Text      := TextButtonOK(FLanguage);
end;

procedure THDMessageDlgFMX.SetupQuestion;
begin
  LayoutNo.Visible      := True;
  btnYes.Text           := TextButtonYes(FLanguage);
  btnNo.Text            := TextButtonNo(FLanguage);
  BackbtnYes.Fill.Color := TAlphaColor(FMXColorButtonYes);
end;

end.
