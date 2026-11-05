program Samples;

uses
  System.StartUpCopy,
  FMX.Forms,
  Samples.Principal in 'Samples.Principal.pas' {Form1},
  HDMessageDlg.Consts in '..\src\HDMessageDlg.Consts.pas',
  HDMessageDlg.IconsSVG in '..\src\HDMessageDlg.IconsSVG.pas',
  HDMessageDlg.Interfaces in '..\src\HDMessageDlg.Interfaces.pas',
  HDMessageDlg in '..\src\HDMessageDlg.pas',
  HDMessageDlg.View.FMX in '..\src\FMX\HDMessageDlg.View.FMX.pas' {HDMessageDlgFMX};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
