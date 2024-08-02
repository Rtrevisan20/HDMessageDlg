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
  System.UITypes,

  Winapi.Windows;

type
  THDMessageDlgFMX = class(TForm)
    RecBackGround     : TRectangle;
    LayoutContainer   : TLayout;
    LayoutTop         : TLayout;
    RecLblTitle: TRectangle;
    lbl_Title         : TLabel;
    LayoutContainerMessage: TLayout;
    LayoutIMG         : TLayout;
    imgMenssage       : TImage;
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
    FMsgType          : TType;
    FMsgIcon          : string;
    FColorSvgIcon     : TAlphaColor;
    FMsgResponse      : Boolean;
    FColorBackuground : TAlphaColor;
    procedure SetMsgIcon(const Value: string);
    procedure SetMsgBody(const Value: string);
    procedure SetMsgQuestion(const Value: string);
    procedure SetMsgType(const Value: TType);
    procedure SetMsgTitle(const Value: string);
    procedure TypeOk;
    procedure TypeQuestion;
    procedure SetNo;
    procedure SetYes;
  public
  published
    property MsgTitle         : string      read FMsgTitle         write SetMsgTitle;
    property MsgQuestion      : string      read FMsgQuestion      write SetMsgQuestion;
    property MsgBody          : string      read FMsgBody          write SetMsgBody;
    property MsgIcon          : string      read FMsgIcon          write SetMsgIcon;
    property MsgResponse      : Boolean     read FMsgResponse      write FMsgResponse;
    property MsgType          : TType       read FMsgType          write SetMsgType;
    property ColorSvgIcon     : TAlphaColor read FColorSvgIcon     write FColorSvgIcon;
    property ColorBackuground : TAlphaColor read FColorBackuground write FColorBackuground;
  end;

implementation

uses
  HDMessageDlg.Consts;

{$R *.fmx}

procedure THDMessageDlgFMX.btnNoClick(Sender: TObject);
begin
  SetNo;
end;

procedure THDMessageDlgFMX.btnYesClick(Sender: TObject);
begin
  SetYes;
end;

procedure THDMessageDlgFMX.FormCreate(Sender: TObject);
begin
  // Set Color
  BackbtnNo.Fill.Color       := TAlphaColor(FMXColorButtonNo);
  BackbtnYes.Fill.Color      := TAlphaColor(FMXColorButtonYes);
  lbl_Title.FontColor        := TAlphaColor(FMXLabelTitle);
  lbl_Question.FontColor     := TAlphaColor(FMXLabelQuestion);
  lbl_BodyMessage.FontColor  := TAlphaColor(FMXLabelQuestion);
  btnNo.FontColor            := TAlphaColor(FMXTextButtonNo);
  btnYes.FontColor           := TAlphaColor(FMXTextButtonYes);
end;

procedure THDMessageDlgFMX.FormKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  if LayoutYes.Visible then
   if Key = VK_RETURN then
    SetYes;

 if LayoutNo.Visible then
   if Key = VK_ESCAPE then
    SetNo;
end;

procedure THDMessageDlgFMX.FormShow(Sender: TObject);
begin
  FMsgResponse             := False;
  btnNo.Text               := TextButtonNo;
  lbl_Title.Text           := FMsgTitle;
  lbl_Question.Text        := FMsgQuestion;
  lbl_BodyMessage.Text     := FMsgBody;
  RecBackGround.Fill.Color := TAlphaColor(FColorBackuground);
  RecLblTitle.Fill.Color   := TAlphaColor(FColorSvgIcon);
  PathIconSVG.Fill.Color   := FColorSvgIcon;
  PathIconSVG.WrapMode     := TPathWrapMode.Fit;
  PathIconSVG.Data.Data    := FMsgIcon;

  case FMsgType of
   TyOK      : TypeOk;
   TyQuestion: TypeQuestion;
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

procedure THDMessageDlgFMX.SetNo;
begin
  FMsgResponse := False;
  Close;
end;

procedure THDMessageDlgFMX.SetMsgQuestion(const Value: string);
begin
  FMsgQuestion := Value;
end;

procedure THDMessageDlgFMX.SetYes;
begin
  FMsgResponse := True;
  Close;
end;

procedure THDMessageDlgFMX.SetMsgType(const Value: TType);
begin
  FMsgType := Value;
end;

procedure THDMessageDlgFMX.SetMsgTitle(const Value: string);
begin
  FMsgTitle := Value;
end;

procedure THDMessageDlgFMX.TypeOk;
begin
  LayoutNo.Visible := False;
  btnYes.Text      := TextButtonOK;
end;

procedure THDMessageDlgFMX.TypeQuestion;
begin
  LayoutNo.Visible      := True;
  btnYes.Text           := TextButtonYes;
  btnNo.Text            := TextButtonNo;
  BackbtnYes.Fill.Color := TAlphaColor(FMXColorButtonYes);
end;

end.
