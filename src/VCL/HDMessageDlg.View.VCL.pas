unit HDMessageDlg.View.VCL;

interface

uses
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
    pn_Fundo: TPanel;
    pn_Topo: TPanel;
    pn_Linha: TPanel;
    lbl_Titulo: TLabel;
    pn_FundoMensagem: TPanel;
    pn_Imagem: TPanel;
    imgMensagem: TImage;
    pn_Mensagem: TPanel;
    pn_Pergunta: TPanel;
    lbl_Pergunta: TLabel;
    Panel1: TPanel;
    lbl_Mensagem: TLabel;
    pnButtons: TPanel;
    pn_Nao: TPanel;
    btn_Nao: TSpeedButton;
    pn_Sim: TPanel;
    btn_Sim: TSpeedButton;
    procedure btn_SimClick(Sender: TObject);
    procedure btn_NaoClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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

procedure THDMessageDlgVCL.btn_NaoClick(Sender: TObject);
begin
 MsgResponse := False;
 Close;
end;

procedure THDMessageDlgVCL.btn_SimClick(Sender: TObject);
begin
 MsgResponse := True;
 Close;
end;

procedure THDMessageDlgVCL.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Action := caFree;
end;

procedure THDMessageDlgVCL.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if pn_Sim.Visible then
   if key = VK_RETURN then
    btn_SimClick(Self);

 if pn_Nao.Visible then
   if key = VK_ESCAPE then
    btn_NaoClick(Self);
end;

procedure THDMessageDlgVCL.FormShow(Sender: TObject);
begin
 MsgResponse := False;
 lbl_Titulo.Caption := FMsgTitle;
 lbl_Pergunta.Caption := FMsgQuestion;
 lbl_Mensagem.Caption := FMsgBody;
 imgMensagem.Picture.LoadFromStream(TResourceStream.Create(HInstance, FMsgIcon ,RT_RCDATA));

 case FMsgType of
   TOK: TypeOK;
   tQuestion: TypeQuestion;
 end;

end;

procedure THDMessageDlgVCL.SetIcon(const Value: string);
begin
  FMsgIcon := Value;
end;

procedure THDMessageDlgVCL.SetMessage(const Value: string);
begin
  FMsgBody := Value;
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

procedure THDMessageDlgVCL.TypeOK;
begin
 pn_Nao.Visible := False;
 btn_Sim.Caption := 'OK (ENTER)';
end;

procedure THDMessageDlgVCL.TypeQuestion;
begin
  pn_Nao.Visible := True;
  btn_Sim.Caption := 'SIM (ENTER)';
end;

end.
