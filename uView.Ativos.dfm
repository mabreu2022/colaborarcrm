object FrmAtivos: TFrmAtivos
  Left = 0
  Top = 0
  Caption = 'Cadastro de ativos'
  ClientHeight = 441
  ClientWidth = 735
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  OnShow = FormShow
  TextHeight = 15
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 735
    Height = 441
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    ExplicitHeight = 400
    object TabSheet1: TTabSheet
      Caption = 'Cadastro'
      object lblAtivo: TLabel
        Left = 12
        Top = 3
        Width = 28
        Height = 15
        Caption = 'Ativo'
      end
      object lblNumeroDeSerie: TLabel
        Left = 336
        Top = 3
        Width = 88
        Height = 15
        Caption = 'N'#250'mero de S'#233'rie'
      end
      object lblStatusatual: TLabel
        Left = 12
        Top = 54
        Width = 63
        Height = 15
        Caption = 'Status Atual'
      end
      object lblLocadoNoCliente: TLabel
        Left = 336
        Top = 54
        Width = 96
        Height = 15
        Caption = 'Locado no Cliente'
      end
      object edtAtivo: TEdit
        Left = 12
        Top = 24
        Width = 297
        Height = 23
        TabOrder = 0
      end
      object edtNumeroDeSerie: TEdit
        Left = 336
        Top = 24
        Width = 353
        Height = 23
        TabOrder = 1
      end
      object dblcbStatusAtual: TDBLookupComboBox
        Left = 12
        Top = 72
        Width = 297
        Height = 23
        TabOrder = 2
      end
      object dblLocadoNoCliente: TDBLookupComboBox
        Left = 336
        Top = 72
        Width = 353
        Height = 23
        TabOrder = 3
      end
      object Panel1: TPanel
        Left = 0
        Top = 370
        Width = 727
        Height = 41
        Align = alBottom
        TabOrder = 4
        ExplicitTop = 400
        ExplicitWidth = 735
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
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Listagem'
      ImageIndex = 1
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 727
        Height = 41
        Align = alTop
        TabOrder = 0
        object lblPessuisarNumeroDeSerie: TLabel
          Left = 5
          Top = 11
          Width = 88
          Height = 15
          Caption = 'N'#250'mero de S'#233'rie'
        end
        object edtPesquisarNumeroDeSerie: TEdit
          Left = 102
          Top = 8
          Width = 183
          Height = 23
          TabOrder = 0
        end
        object btnPesquisarNumeroDeserie: TButton
          Left = 291
          Top = 7
          Width = 75
          Height = 25
          Caption = 'Pesquisar'
          TabOrder = 1
        end
      end
      object DBGrid_NumerosDeserie: TDBGrid
        Left = 0
        Top = 41
        Width = 727
        Height = 370
        Align = alClient
        DataSource = DM.DSAtivos
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
