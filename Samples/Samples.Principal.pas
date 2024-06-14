unit Samples.Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation,
  FMX.StdCtrls, FMX.Memo.Types, FMX.ScrollBox, FMX.Memo;

type
  TForm1 = class(TForm)
    BtnQuestion: TButton;
    BtnMessage: TButton;
    Button3: TButton;
    BtnLike: TButton;
    BtnError: TButton;
    BtnAttention: TButton;
    mm: TMemo;
    procedure BtnQuestionClick(Sender: TObject);
    procedure BtnMessageClick(Sender: TObject);
    procedure BtnLikeClick(Sender: TObject);
    procedure BtnErrorClick(Sender: TObject);
    procedure BtnAttentionClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses
  HDMessageDlg,
  HDMessageDlg.Interfaces;

procedure TForm1.BtnAttentionClick(Sender: TObject);
var
  Msg: iHDMessageDlg;
begin
  Msg := THDMessageDlg.New;

  Msg
   .MsgTitle('Essa � uma mensagem')
   .MsgQuestion('')
   .MsgBody('Aten��o isso pode n�o dar certo!!!')
   .MsgIcon(TiAttention)
   .MsgType(TyOK)
   .DisplayMessage;
end;

procedure TForm1.BtnErrorClick(Sender: TObject);
var
  Msg: iHDMessageDlg;
begin
  Msg := THDMessageDlg.New;

  Msg
   .MsgTitle('Essa � uma mensagem')
   .MsgQuestion('')
   .MsgBody('N�o deu nada certo, n�o precisa se desesperar!')
   .MsgIcon(TiError)
   .MsgType(TyOK)
   .DisplayMessage;
end;

procedure TForm1.BtnLikeClick(Sender: TObject);
var
  Msg: iHDMessageDlg;
begin
  Msg := THDMessageDlg.New;

  Msg
   .MsgTitle('Essa � uma mensagem')
   .MsgQuestion('')
   .MsgBody('Deu tudo certo, pode ficar tranquilo!')
   .MsgIcon(TiLike)
   .MsgType(TyOK)
   .DisplayMessage;
end;

procedure TForm1.BtnMessageClick(Sender: TObject);
var
  Msg: iHDMessageDlg;
begin
  Msg := THDMessageDlg.New;

  Msg
   .MsgTitle('Essa � uma mensagem')
   .MsgQuestion('')
   .MsgBody('Isso � apenas uma informa��o para voc�!')
   .MsgIcon(TiMessage)
   .MsgType(TyOK)
   .DisplayMessage;
end;

procedure TForm1.BtnQuestionClick(Sender: TObject);
var
  Msg: iHDMessageDlg;
begin
  Msg := THDMessageDlg.New;
 if
  Msg
   .MsgTitle('Essa � uma pergunta')
   .MsgQuestion('Deseja Continuar?')
   .MsgBody('Selecione uma das op��es')
   .MsgIcon(TiQuestion)
   .MsgType(TyQuestion)
   .DisplayQuestion then
   mm.Lines.Add('Voc� selecionou Sim') else
   mm.Lines.Add('Voc� selecionou N�o');
end;

end.
