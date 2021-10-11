object Form1: TForm1
  Left = 216
  Top = 129
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1054#1087#1090#1080#1082#1072
  ClientHeight = 651
  ClientWidth = 902
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 17
  object Image1: TImage
    Left = 10
    Top = 10
    Width = 495
    Height = 410
  end
  object StringGrid1: TStringGrid
    Left = 513
    Top = 10
    Width = 378
    Height = 410
    ColCount = 2
    FixedCols = 0
    RowCount = 2
    TabOrder = 0
    OnClick = StringGrid1Click
  end
  object PageControl1: TPageControl
    Left = 10
    Top = 439
    Width = 883
    Height = 204
    ActivePage = TabSheet1
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = #1057#1080#1085#1075#1083
      object Label1: TLabel
        Left = 4
        Top = 63
        Width = 96
        Height = 17
        Caption = #1055#1072#1088#1072#1084#1077#1090#1088' '#1091#1075#1083#1072
      end
      object Label2: TLabel
        Left = 4
        Top = 98
        Width = 164
        Height = 17
        Caption = #1055#1086#1082#1072#1079#1072#1090#1077#1083#1100' '#1087#1088#1077#1083#1086#1084#1083#1077#1085#1080#1103
      end
      object Edit1: TEdit
        Left = 201
        Top = 56
        Width = 159
        Height = 25
        TabOrder = 0
        Text = 'Edit1'
      end
      object Edit2: TEdit
        Left = 201
        Top = 90
        Width = 159
        Height = 25
        TabOrder = 1
        Text = 'Edit2'
      end
      object Button1: TButton
        Left = 367
        Top = 92
        Width = 99
        Height = 26
        Caption = #1055#1088#1080#1085#1103#1090#1100
        TabOrder = 2
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 473
        Top = 90
        Width = 98
        Height = 26
        Caption = #1057#1073#1088#1086#1089
        TabOrder = 3
        OnClick = Button2Click
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1048#1085#1090#1077#1088#1074#1072#1083
      ImageIndex = 1
      object Label3: TLabel
        Left = 4
        Top = 29
        Width = 82
        Height = 17
        Caption = #1048#1085#1090#1077#1088#1074#1072#1083' '#1086#1090
      end
      object Label4: TLabel
        Left = 4
        Top = 64
        Width = 16
        Height = 17
        Caption = #1076#1086
      end
      object Label5: TLabel
        Left = 4
        Top = 99
        Width = 23
        Height = 17
        Caption = #1096#1072#1075
      end
      object Label6: TLabel
        Left = 4
        Top = 129
        Width = 163
        Height = 17
        Caption = #1087#1086#1082#1072#1079#1072#1090#1077#1083#1100' '#1087#1088#1077#1083#1086#1084#1083#1077#1085#1080#1103
      end
      object Edit3: TEdit
        Left = 179
        Top = 25
        Width = 158
        Height = 21
        TabOrder = 0
        Text = 'Edit3'
      end
      object Edit4: TEdit
        Left = 179
        Top = 59
        Width = 158
        Height = 21
        TabOrder = 1
        Text = 'Edit4'
      end
      object Edit5: TEdit
        Left = 179
        Top = 94
        Width = 158
        Height = 21
        TabOrder = 2
        Text = 'Edit5'
      end
      object Button3: TButton
        Left = 349
        Top = 126
        Width = 98
        Height = 26
        Caption = #1055#1088#1080#1085#1103#1090#1100
        TabOrder = 3
        OnClick = Button3Click
      end
      object Button4: TButton
        Left = 455
        Top = 126
        Width = 98
        Height = 26
        Caption = #1057#1073#1088#1086#1089
        TabOrder = 4
        OnClick = Button4Click
      end
      object Edit6: TEdit
        Left = 179
        Top = 126
        Width = 158
        Height = 21
        TabOrder = 5
        Text = 'Edit6'
      end
      object Button5: TButton
        Left = 561
        Top = 126
        Width = 98
        Height = 26
        Caption = #1043#1088#1072#1092#1080#1082
        TabOrder = 6
        OnClick = Button5Click
      end
    end
  end
end
