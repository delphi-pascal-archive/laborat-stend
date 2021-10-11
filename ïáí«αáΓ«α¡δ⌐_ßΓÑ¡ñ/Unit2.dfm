object Form2: TForm2
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1043#1088#1072#1092#1080#1082
  ClientHeight = 315
  ClientWidth = 520
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Chart1: TChart
    Left = 8
    Top = 8
    Width = 504
    Height = 289
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    BottomWall.Brush.Color = clWhite
    LeftWall.Brush.Color = clWhite
    Title.Text.Strings = (
      #1047#1072#1074#1080#1089#1080#1084#1086#1089#1090#1100' '#1091#1075#1083#1072' '#1087#1077#1088#1077#1083#1086#1084#1083#1077#1085#1080#1103' '#1086#1090' '#1087#1072#1088#1072#1084#1077#1090#1088#1072' '#1091#1075#1083#1072'.')
    Legend.Visible = False
    View3D = False
    TabOrder = 0
    object Series1: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clRed
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
    end
  end
end
