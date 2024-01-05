object HDMessageDlgVCL: THDMessageDlgVCL
  Left = 0
  Top = 0
  BorderStyle = bsNone
  ClientHeight = 222
  ClientWidth = 608
  Color = 14407895
  Font.Charset = DEFAULT_CHARSET
  Font.Color = 5728885
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  TextHeight = 15
  object pn_Background: TPanel
    Left = 0
    Top = 0
    Width = 608
    Height = 222
    Align = alClient
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    object pn_Top: TPanel
      Left = 0
      Top = 0
      Width = 608
      Height = 46
      Align = alTop
      BevelOuter = bvNone
      Color = 16477960
      ParentBackground = False
      TabOrder = 0
      object lbl_Titulo: TLabel
        Left = 15
        Top = 6
        Width = 81
        Height = 30
        Caption = 'lbl_Tytle'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object pn_Linha: TPanel
        Left = 0
        Top = 43
        Width = 608
        Height = 3
        Align = alBottom
        BevelOuter = bvNone
        Color = 16477960
        ParentBackground = False
        TabOrder = 0
      end
    end
    object pn_BackgroundMessage: TPanel
      Left = 0
      Top = 46
      Width = 608
      Height = 176
      Align = alClient
      BevelOuter = bvNone
      Color = 14407895
      ParentBackground = False
      TabOrder = 1
      object pn_Image: TPanel
        Left = 0
        Top = 0
        Width = 176
        Height = 176
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object imgMensagem: TImage
          Left = 0
          Top = 0
          Width = 176
          Height = 176
          Align = alClient
          Center = True
          ExplicitLeft = -3
          ExplicitTop = -4
        end
      end
      object pn_Message: TPanel
        Left = 176
        Top = 0
        Width = 432
        Height = 176
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object pn_Question: TPanel
          Left = 0
          Top = 0
          Width = 432
          Height = 34
          Align = alTop
          BevelOuter = bvNone
          Color = 14407895
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 5728885
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
          object lbl_Question: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 426
            Height = 28
            Align = alClient
            Caption = 'lbl_Question'
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 16477960
            Font.Height = -19
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            Layout = tlCenter
            WordWrap = True
            ExplicitWidth = 110
            ExplicitHeight = 25
          end
        end
        object pn_BodyMessage: TPanel
          Left = 0
          Top = 34
          Width = 432
          Height = 74
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object lbl_BodyMessage: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 426
            Height = 68
            Align = alClient
            Caption = 'lbl_BodyMessage'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 6445397
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            WordWrap = True
            ExplicitLeft = 6
          end
        end
        object pn_Buttons: TPanel
          Left = 0
          Top = 137
          Width = 432
          Height = 39
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 2
          object pn_No: TPanel
            AlignWithMargins = True
            Left = 103
            Top = 3
            Width = 160
            Height = 33
            Align = alRight
            BevelOuter = bvNone
            Color = 16477960
            ParentBackground = False
            TabOrder = 0
            object btn_No: TSpeedButton
              Left = 0
              Top = 0
              Width = 160
              Height = 33
              Cursor = crHandPoint
              Align = alClient
              Caption = 'N'#195'O (ESC)'
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -16
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
              OnClick = btn_NoClick
              ExplicitLeft = -24
              ExplicitTop = -16
            end
          end
          object pn_Yes: TPanel
            AlignWithMargins = True
            Left = 269
            Top = 3
            Width = 160
            Height = 33
            Align = alRight
            BevelOuter = bvNone
            Color = 5286156
            ParentBackground = False
            TabOrder = 1
            object btn_Yes: TSpeedButton
              Left = 0
              Top = 0
              Width = 160
              Height = 33
              Cursor = crHandPoint
              Align = alClient
              Caption = 'SIM (ENTER)'
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -16
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
              OnClick = btn_YesClick
              ExplicitLeft = 32
              ExplicitTop = 8
              ExplicitWidth = 113
            end
          end
        end
      end
    end
  end
end
