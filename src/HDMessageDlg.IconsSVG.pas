unit HDMessageDlg.IconsSVG;

interface

uses
  Data.DB,

  HDMessageDlg.Interfaces,

  System.Classes,
  System.SysUtils,
  System.UITypes;

type
  THDMessageDlgIconsSVG = class
  private
  public
    class function Icon(ATipo : TIcon) : string;
    class function ColorSvgIcon(ATipo : TIcon) : TAlphaColor;
    class function ColorBackuground(ATipo : TIcon) : TAlphaColor;
  end;

const
 CIconQuestion =
  'M20 2H4C2.9 2 2 2.9 2 4V22L6 18H20C21.1 18 22 17.1 22 16V4C22 2.9 21.1 2 20 2M20 '+
  '16H5.2L4 17.2V4H20V16M12.2 5.5C11.3 5.5 10.6 5.7 10.1 6C9.5 6.4 9.2 7 9.3 7.7H11.3C11.3 '+
  '7.4 11.4 7.2 11.6 7.1C11.8 7 12 6.9 12.3 6.9C12.6 6.9 12.9 7 13.1 7.2C13.3 7.4 13.4 '+
  '7.6 13.4 7.9C13.4 8.2 13.3 8.4 13.2 8.6C13 8.8 12.8 9 12.6 9.1C12.1 9.4 11.7 9.7 11.5 '+
  '9.9C11.1 10.2 11 10.5 11 11H13C13 10.7 13.1 10.5 13.1 10.3C13.2 10.1 13.4 10 13.6 9.8C14.1 '+
  '9.6 14.4 9.3 14.7 8.9C15 8.5 15.1 8.1 15.1 7.7C15.1 7 14.8 6.4 14.3 6C13.9 5.7 13.1 5.5 12.2 '+
  '5.5M11 12V14H13V12H11Z';
 CIconMessage =
  'M10 11.5H17V13H10V11.5M10 8.5H19V10H10V8.5M20 5H9C7.9 5 7 5.9 7 '+
  '7V21L11 17H20C21.1 17 22 16.1 22 15V7C22 5.9 21.1 5 20 5M20 15H10.2L9 '+
  '16.2V7H20V15M3 7C2.4 7 2 7.4 2 8S2.4 9 3 9H5V7H3M2 11C1.4 11 1 11.4 1 '+
  '12S1.4 13 2 13H5V11H2M1 15C.4 15 0 15.4 0 16C0 16.6 .4 17 1 17H5V15H1Z';
 CIconLike =
  'M23,10C23,8.89 22.1,8 21,8H14.68L15.64,3.43C15.66,3.33 15.67,3.22 15.67,3.11C15.67,2.7 15.5,'+
  '2.32 15.23,2.05L14.17,1L7.59,7.58C7.22,7.95 7,8.45 7,9V19A2,2 0 0,0 9,21H18C18.83,21 19.54,'+
  '20.5 19.84,19.78L22.86,12.73C22.95,12.5 23,12.26 23,12V10M1,21H5V9H1V21Z';
 CIconError =
  'M3,16.74L7.76,12L3,7.26L7.26,3L12,7.76L16.74,3L21,7.26L16.24,12L21,16.74L16.74,21L12,16.24L7.26,'+
  '21L3,16.74M12,13.41L16.74,18.16L18.16,16.74L13.41,12L18.16,7.26L16.74,5.84L12,10.59L7.26,'+
  '5.84L5.84,7.26L10.59,12L5.84,16.74L7.26,18.16L12,13.41Z';
 CIconAttention =
  'M20,11.7V9c0-.19,0-.37,0-.54a4,4,0,1,0-4.42-6.61A8,8,0,0,0,4,9v2.7L2.56,13.86A3.22,3.22,0,0,0,2,'+
  '15.7a3.36,3.36,0,0,0,1,2.35A3.34,3.34,0,0,0,5.3,19H7.1a5,5,0,0,0,9.8,0h1.8A3.3,3.3,0,0,0,22,'+
  '15.7a3.24,3.24,0,0,0-.56-1.83ZM20,5a2,2,0,1,1-2-2A2,2,0,0,1,20,5ZM12,21a3,3,0,0,'+
  '1-2.83-2h5.66A3,3,0,0,1,12,21Zm6.7-4H5.3a1.29,1.29,0,0,1-.91-.37A1.31,1.31,0,0,1,4,15.7,1.26,'+
  '1.26,0,0,1,4.22,15l1.61-2.42A1,1,0,0,0,6,12V9a6,6,0,0,1,6-6,6.07,6.07,0,0,1,2.31.47A3.91,'+
  '3.91,0,0,0,14,5a4,4,0,0,0,4,4v3a1,1,0,0,0,.17.55L19.78,15a1.2,1.2,0,0,1,.22.72A1.3,1.3,0,0,1,18.7,17Z';
  //Colors SVG
  CColorSvgError             = $FFD54309;
  CColorSvgAttention         = $FFFFBE2E;
  CColorSvgLike              = $FF00BDE3;
  CColorSvgQuestion          = $FF9C3D10;
  CColorSvgMessage           = $FF00BDE3;
  CColorSvgDefault           = $FF086FFB;

  CColorBackugroundAttention = $FFFAF3D1;
  CColorBackugroundError     = $FFF4E3DB;
  CColorBackugroundLike      = $FFE7F6F8;
  CColorBackugroundMessage   = $FFE7F6F8;
  CColorBackugroundQuestion  = $FFF4E3DB;
  CColorBackugroundDefault   = $FFD7D8DB;


implementation

class function THDMessageDlgIconsSVG.ColorBackuground(ATipo: TIcon): TAlphaColor;
begin
  Result := CColorBackugroundDefault;
  case ATipo of
    TiAttention : Result := CColorBackugroundAttention;
    TiError     : Result := CColorBackugroundError;
    TiLike      : Result := CColorBackugroundLike;
    TiMessage   : Result := CColorBackugroundMessage;
    TiQuestion  : Result := CColorBackugroundQuestion;
  end;
end;

class function THDMessageDlgIconsSVG.ColorSvgIcon(ATipo: TIcon): TAlphaColor;
begin
  Result := CColorSvgDefault;
  case ATipo of
    TiAttention: Result := CColorSvgAttention;
    TiError:     Result := CColorSvgError;
    TiLike:      Result := CColorSvgLike;
    TiMessage:   Result := CColorSvgQuestion;
    TiQuestion:  Result := CColorSvgMessage;
  end;
end;

class function THDMessageDlgIconsSVG.Icon(ATipo : TIcon) : string;
begin
  case ATipo of
    TiAttention : Result := CIconAttention;
    TiError     : Result := CIconError;
    TiLike      : Result := CIconLike;
    TiMessage   : Result := CIconMessage;
    TiQuestion  : Result := CIconQuestion;
  end;
end;

end.
