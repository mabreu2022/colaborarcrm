object ViewPDF: TViewPDF
  Left = 0
  Top = 0
  Caption = 'ViewPDF'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnActivate = FormActivate
  TextHeight = 15
  object LBL_PDF: TLabel
    Left = 128
    Top = 56
    Width = 357
    Height = 15
    Caption = '<embed src="" type="application/pdf" width="600" height="400">'
  end
end
