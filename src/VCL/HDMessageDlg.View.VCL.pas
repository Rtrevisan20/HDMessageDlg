unit HDMessageDlg.View.VCL;

interface

uses
  HDMessageDlg.Consts,
  HDMessageDlg.Interfaces,

  System.Classes,
  System.ImageList,
  System.SysUtils,
  System.Variants,

  Vcl.Buttons,
  Vcl.Controls,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.Forms,
  Vcl.Graphics,
  Vcl.Imaging.pngimage,
  Vcl.ImgList,
  Vcl.StdCtrls,

  Winapi.Messages,
  Winapi.Windows;

type
  THDMessageDlgVCL = class(TForm)
    pn_Background: TPanel;
    pn_Top: TPanel;
    pn_Linha: TPanel;
    lbl_Titulo: TLabel;
    pn_BackgroundMessage: TPanel;
    pn_Image: TPanel;
    imgMensagem: TImage;
    pn_Message: TPanel;
    pn_Question: TPanel;
    lbl_Question: TLabel;
    pn_BodyMessage: TPanel;
    pn_Buttons: TPanel;
    pn_No: TPanel;
    btn_No: TSpeedButton;
    pn_Yes: TPanel;
    btn_Yes: TSpeedButton;
    lbl_BodyMessage: TLabel;
    procedure btn_YesClick(Sender: TObject);
    procedure btn_NoClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    FMsgTitle: string;
    FMsgQuestion: string;
    FMsgBody: string;
    FMsgIcon: string;
    FMsgType: TType;
    procedure SetTytle(const Value: string);
    procedure SetMessage(const Value: string);
    procedure SetQuestion(const Value: string);
    procedure SetIcon(const Value: string);
    procedure SetType(const Value: TType);
    procedure TypeOK;
    procedure TypeQuestion;
    procedure SetNo;
    procedure SetYes;
  public
    MsgResponse : Boolean;
  published
    property MsgTitle : string read FMsgTitle write SetTytle;
    property MsgQuestion : string read FMsgQuestion write SetQuestion;
    property MsgBody : string read FMsgBody write SetMessage;
    property MsgIcon : string read FMsgIcon write SetIcon;
    property MsgType : TType read FMsgType write SetType;
  end;

implementation

{$R *.dfm}

procedure THDMessageDlgVCL.btn_NoClick(Sender: TObject);
begin
  SetNo;
end;

procedure THDMessageDlgVCL.btn_YesClick(Sender: TObject);
begin
   SetYes;
end;

procedure THDMessageDlgVCL.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Action := caFree;
end;

procedure THDMessageDlgVCL.FormCreate(Sender: TObject);
begin
  // Set colors
  pn_Top.Color               := VCLColorTop;
  pn_Background.Color        := VCLColorBackuground;
  pn_No.Color                := VCLColorButtonNo;
  pn_Yes.Color               := VCLColorButtonYes;
  lbl_Titulo.Font.Color      := VCLLabelTitle;
  lbl_Question.Font.Color    := VCLLabelQuestion;
  lbl_BodyMessage.Font.Color := VCLLabelQuestion;
  btn_No.Font.Color          := VCLTextButtonNo;
  btn_Yes.Font.Color         := VCLTextButtonYes;
end;

procedure THDMessageDlgVCL.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if pn_Yes.Visible then
   if key = VK_RETURN then
    SetYes;

 if pn_No.Visible then
   if key = VK_ESCAPE then
    SetNo;
end;

procedure THDMessageDlgVCL.FormShow(Sender: TObject);
begin
 MsgResponse             := False;
 btn_No.Caption          := TextButtonNo;
 lbl_Titulo.Caption      := FMsgTitle;
 lbl_Question.Caption    := FMsgQuestion;
 lbl_BodyMessage.Caption := FMsgBody;

 case FMsgType of
   tOK: TypeOK;
   tQuestion: TypeQuestion;
 end;

 imgMensagem.Picture.LoadFromStream(TResourceStream.Create(HInstance, FMsgIcon , RT_RCDATA));
end;

procedure THDMessageDlgVCL.SetIcon(const Value: string);
begin
  FMsgIcon := Value;
end;

procedure THDMessageDlgVCL.SetMessage(const Value: string);
begin
  FMsgBody := Value;
end;

procedure THDMessageDlgVCL.SetNo;
begin
  MsgResponse := False;
  Close;
end;

procedure THDMessageDlgVCL.SetQuestion(const Value: string);
begin
  FMsgQuestion := Value;
end;

procedure THDMessageDlgVCL.SetType(const Value: TType);
begin
  FMsgType := Value;
end;

procedure THDMessageDlgVCL.SetTytle(const Value: string);
begin
  FMsgTitle := Value;
end;

procedure THDMessageDlgVCL.SetYes;
begin
  MsgResponse := True;
  Close;
end;

procedure THDMessageDlgVCL.TypeOK;
begin
 pn_No.Visible := False;
 btn_Yes.Caption := TextButtonOK;
end;

procedure THDMessageDlgVCL.TypeQuestion;
begin
  pn_No.Visible := True;
  btn_Yes.Caption := TextButtonYes;
end;

end.
