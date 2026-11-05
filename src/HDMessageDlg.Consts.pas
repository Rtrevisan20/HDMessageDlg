unit HDMessageDlg.Consts;

interface

uses
  HDMessageDlg.Interfaces;

const
  //Colors FMX
  FMXColorTop         = $FF086FFB;
  FMXColorButtonNo    = $FF086FFB;
  FMXColorButtonYes   = $FF0CA950;
  FMXLabelTitle       = $FFFFFFFF;
  FMXLabelQuestion    = $FF086FFB;
  FMXLabelBodyMessage = $FF555962;
  FMXTextButtonNo     = $FFFFFFFF;
  FMXTextButtonYes    = $FFFFFFFF;

function TextButtonYes(aLanguage: TLanguage): string;
function TextButtonNo(aLanguage: TLanguage): string;
function TextButtonOK(aLanguage: TLanguage): string;

implementation

function TextButtonYes(aLanguage: TLanguage): string;
begin
  case aLanguage of
    lgEnglish: Result := 'YES (ENTER)';
  else
    Result := 'SIM (ENTER)';
  end;
end;

function TextButtonNo(aLanguage: TLanguage): string;
begin
  case aLanguage of
    lgEnglish: Result := 'NO (ESC)';
  else
    Result := 'NÃO (ESC)';
  end;
end;

function TextButtonOK(aLanguage: TLanguage): string;
begin
  Result := 'OK (ENTER)';
end;

end.
