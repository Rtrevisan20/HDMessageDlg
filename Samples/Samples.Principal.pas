unit Samples.Principal;

interface

uses
  FMX.Controls,
  FMX.Controls.Presentation,
  FMX.Dialogs,
  FMX.Forms,
  FMX.Graphics,
  FMX.Memo,
  FMX.Memo.Types,
  FMX.ScrollBox,
  FMX.StdCtrls,
  FMX.Types,

  System.Classes,
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Variants;

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

uses
  HDMessageDlg,
  HDMessageDlg.Interfaces;
{$R *.fmx}


procedure TForm1.BtnAttentionClick(Sender: TObject);
var
  Msg: iHDMessageDlg;
begin
  Msg := THDMessageDlg.New;

  Msg
   .MsgTitle('Essa é uma mensagem')
   .MsgQuestion('')
   .MsgBody('Atenção isso pode não dar certo!!!')
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
   .MsgTitle('Essa é uma mensagem')
   .MsgQuestion('')
   .MsgBody('Não deu nada certo, não precisa se desesperar!')
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
   .MsgTitle('Essa é uma mensagem')
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
   .MsgTitle('Essa é uma mensagem')
   .MsgQuestion('')
   .MsgBody('Isso é apenas uma informação para você!')
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
   .MsgTitle('Essa é uma pergunta')
   .MsgQuestion('Deseja Continuar?')
   .MsgBody('Selecione uma das opções')
   .MsgIcon(TiQuestion)
   .MsgType(TyQuestion)
   .DisplayQuestion then
   mm.Lines.Add('Você selecionou Sim') else
   mm.Lines.Add('Você selecionou Não');
end;

end.
