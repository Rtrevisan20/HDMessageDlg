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
  System.Types,
  System.UITypes,
  System.Variants,

  Winapi.Windows;

type
  THDMessageDlgFMX = class(TForm)
    RecBackGround: TRectangle;
    LayoutContainer: TLayout;
    LayoutTop: TLayout;
    ReclblTitulo: TRectangle;
    lblTitulo: TLabel;
    LayoutContainerMensagem: TLayout;
    LayoutIMG: TLayout;
    imgMensagem: TImage;
    LayoutMensagem: TLayout;
    lblPergunta: TLabel;
    lblMensagem: TLabel;
    LayoutButtons: TLayout;
    LayoutSim: TLayout;
    BackbtnSim: TRectangle;
    btnSim: TButton;
    ShadowEffectBtnSim: TShadowEffect;
    LayoutNao: TLayout;
    BackbtnNao: TRectangle;
    btnNao: TButton;
    ShadowEffectBtnNao: TShadowEffect;
    StyleBook: TStyleBook;
    procedure FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btnNaoClick(Sender: TObject);
    procedure btnSimClick(Sender: TObject);
  private
    FTitulo: string;
    FPergunta: string;
    FMensagem: string;
    FType: TType;
    FIcon: string;
    procedure SetIcone(const Value: string);
    procedure SetMensagem(const Value: string);
    procedure SetPergunta(const Value: string);
    procedure SetTipo(const Value: TType);
    procedure SetTitulo(const Value: string);
    procedure TipoOK;
    procedure TipoPergunta;
    procedure SetNao;
    procedure SetSim;
  public
    FRespostaMSG : Boolean;
  published
    property Titulo : string read FTitulo write SetTitulo;
    property Pergunta : string read FPergunta write SetPergunta;
    property Mensagem : string read FMensagem write SetMensagem;
    property Icone : string read FIcon write SetIcone;
    property Tipo : TType read FType write SetTipo;
  end;

implementation

{$R *.fmx}

{ TViewMensagem }

procedure THDMessageDlgFMX.btnNaoClick(Sender: TObject);
begin
  SetNao;
end;

procedure THDMessageDlgFMX.btnSimClick(Sender: TObject);
begin
  SetSim;
end;

procedure THDMessageDlgFMX.FormKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  if LayoutSim.Visible then
   if key = VK_RETURN then
    SetSim;

 if LayoutNao.Visible then
   if key = VK_ESCAPE then
    SetNao;
end;

procedure THDMessageDlgFMX.FormShow(Sender: TObject);
begin
  FRespostaMSG := False;
  lblTitulo.Text := FTitulo;
  lblPergunta.Text := FPergunta;
  lblMensagem.Text := FMensagem;
  imgMensagem.Bitmap.LoadFromStream(TResourceStream.Create(HInstance, FIcon ,RT_RCDATA));

  case FType of
   tOK: TipoOK;
   tQuestion: TipoPergunta;
  end;
end;

procedure THDMessageDlgFMX.SetIcone(const Value: string);
begin
  FIcon := Value;
end;

procedure THDMessageDlgFMX.SetMensagem(const Value: string);
begin
  FMensagem := Value;
end;

procedure THDMessageDlgFMX.SetNao;
begin
  FRespostaMSG := False;
  Close;
end;

procedure THDMessageDlgFMX.SetPergunta(const Value: string);
begin
  FPergunta := Value;
end;

procedure THDMessageDlgFMX.SetSim;
begin
  FRespostaMSG := True;
  Close;
end;

procedure THDMessageDlgFMX.SetTipo(const Value: TType);
begin
  FType := Value;
end;

procedure THDMessageDlgFMX.SetTitulo(const Value: string);
begin
  FTitulo := Value;
end;

procedure THDMessageDlgFMX.TipoOK;
begin
  LayoutNao.Visible := False;
  btnSim.Text := 'OK (ENTER)';
end;

procedure THDMessageDlgFMX.TipoPergunta;
begin
  LayoutNao.Visible := True;
  btnSim.Text := 'SIM (ENTER)';
  BackbtnSim.Fill.Color := TAlphaColor($FFEF553B);
end;

end.
