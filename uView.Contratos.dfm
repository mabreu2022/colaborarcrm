object FrmContratos: TFrmContratos
  Left = 0
  Top = 0
  Caption = 'Contratos'
  ClientHeight = 441
  ClientWidth = 807
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 807
    Height = 441
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Cadastro'
      object Panel1: TPanel
        Left = 0
        Top = 370
        Width = 799
        Height = 41
        Align = alBottom
        TabOrder = 0
        object btnNovoAtivo: TButton
          Left = 16
          Top = 10
          Width = 75
          Height = 25
          Caption = 'Novo'
          TabOrder = 0
        end
        object btnEditarAtivo: TButton
          Left = 104
          Top = 9
          Width = 75
          Height = 25
          Caption = 'Editar'
          TabOrder = 1
        end
        object btnSalvarAtivo: TButton
          Left = 193
          Top = 10
          Width = 75
          Height = 25
          Caption = 'Salvar'
          TabOrder = 2
        end
        object btnExcluirAtivo: TButton
          Left = 279
          Top = 10
          Width = 75
          Height = 25
          Caption = 'Excluir'
          TabOrder = 3
        end
        object btnCancelarAtivo: TButton
          Left = 365
          Top = 10
          Width = 75
          Height = 25
          Caption = 'Cancelar'
          TabOrder = 4
        end
        object btnFechar: TButton
          Left = 712
          Top = 8
          Width = 75
          Height = 25
          Caption = 'Fechar'
          TabOrder = 5
          OnClick = btnFecharClick
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Listagem'
      ImageIndex = 1
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 799
        Height = 41
        Align = alTop
        TabOrder = 0
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 41
        Width = 799
        Height = 370
        Align = alClient
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
      end
    end
  end
end
