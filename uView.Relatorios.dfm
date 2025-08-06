object FrmRelatorios: TFrmRelatorios
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rios'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 400
    Width = 624
    Height = 41
    Align = alBottom
    TabOrder = 0
    ExplicitLeft = 8
    ExplicitTop = 392
    ExplicitWidth = 185
    object btnFechar: TButton
      Left = 536
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Fechar'
      TabOrder = 0
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 624
    Height = 400
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'Clientes'
      object btnListagemDeClientes: TButton
        Left = 16
        Top = 24
        Width = 153
        Height = 25
        Caption = 'Listagem de Clientes'
        TabOrder = 0
        OnClick = btnListagemDeClientesClick
      end
      object btnClientesPorCNPJ: TButton
        Left = 200
        Top = 24
        Width = 177
        Height = 25
        Caption = 'Clientes por CNPJ'
        TabOrder = 1
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Contratos'
      ImageIndex = 1
    end
    object TabSheet3: TTabSheet
      Caption = 'Ativos'
      ImageIndex = 2
    end
  end
end
