object FrmContratos: TFrmContratos
  Left = 0
  Top = 0
  Caption = 'Contratos'
  ClientHeight = 441
  ClientWidth = 744
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
    Width = 744
    Height = 441
    ActivePage = TabSheet2
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Cadastro'
      object lblIDCliente: TLabel
        Left = 16
        Top = 8
        Width = 37
        Height = 15
        Caption = 'Cliente'
      end
      object lblDataInicio: TLabel
        Left = 16
        Top = 61
        Width = 56
        Height = 15
        Caption = 'Data Inicio'
      end
      object lblDataFim: TLabel
        Left = 234
        Top = 61
        Width = 47
        Height = 15
        Caption = 'Data Fim'
      end
      object lblValorMensal: TLabel
        Left = 16
        Top = 112
        Width = 67
        Height = 15
        Caption = 'Valor Mensal'
      end
      object lblObservacoes: TLabel
        Left = 16
        Top = 160
        Width = 67
        Height = 15
        Caption = 'Observa'#231#245'es'
      end
      object lblIDStatus: TLabel
        Left = 16
        Top = 272
        Width = 32
        Height = 15
        Caption = 'Status'
      end
      object lblDescricao: TLabel
        Left = 16
        Top = 317
        Width = 51
        Height = 15
        Caption = 'Descri'#231#227'o'
      end
      object Panel1: TPanel
        Left = 0
        Top = 370
        Width = 736
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
          OnClick = btnNovoAtivoClick
        end
        object btnEditarAtivo: TButton
          Left = 104
          Top = 9
          Width = 75
          Height = 25
          Caption = 'Editar'
          TabOrder = 1
          OnClick = btnEditarAtivoClick
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
          Left = 449
          Top = 10
          Width = 75
          Height = 25
          Caption = 'Fechar'
          TabOrder = 5
          OnClick = btnFecharClick
        end
      end
      object dblIDCliente: TDBLookupComboBox
        Left = 16
        Top = 24
        Width = 145
        Height = 23
        DataField = 'ID_CLIENTE'
        DataSource = DM.DSContratos
        KeyField = 'ID_CLIENTE'
        ListField = 'NOME_RAZAO'
        ListSource = DM.DSCliente
        TabOrder = 1
      end
      object dtpDataInicio: TDateTimePicker
        Left = 16
        Top = 80
        Width = 186
        Height = 23
        Date = 45889.000000000000000000
        Time = 0.260414131946163300
        TabOrder = 2
      end
      object dtpDataFim: TDateTimePicker
        Left = 232
        Top = 80
        Width = 186
        Height = 23
        Date = 45889.000000000000000000
        Time = 0.260451400463352900
        TabOrder = 3
      end
      object edtValorMensal: TEdit
        Left = 16
        Top = 128
        Width = 186
        Height = 23
        TabOrder = 4
      end
      object mObservacoes: TMemo
        Left = 17
        Top = 176
        Width = 401
        Height = 89
        Lines.Strings = (
          '')
        TabOrder = 5
      end
      object dblIDStatus: TDBLookupComboBox
        Left = 17
        Top = 288
        Width = 145
        Height = 23
        DataField = 'ID_STATUS'
        DataSource = DM.DSContratos
        KeyField = 'ID_STATUS'
        ListField = 'STATUS'
        ListSource = DM.DSStatus
        TabOrder = 6
      end
      object edtDescricao: TEdit
        Left = 17
        Top = 333
        Width = 408
        Height = 23
        TabOrder = 7
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Listagem'
      ImageIndex = 1
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 736
        Height = 41
        Align = alTop
        TabOrder = 0
        object lblPesquisar: TLabel
          Left = 16
          Top = 13
          Width = 92
          Height = 15
          Caption = 'Numero contrato'
        end
        object edtNumeroContrato: TEdit
          Left = 116
          Top = 8
          Width = 257
          Height = 23
          TabOrder = 0
        end
        object btnPesquisar: TButton
          Left = 379
          Top = 7
          Width = 75
          Height = 25
          Caption = 'Pesquisar'
          TabOrder = 1
          OnClick = btnPesquisarClick
        end
      end
      object dbgContratosPesquisa: TDBGrid
        Left = 0
        Top = 41
        Width = 736
        Height = 370
        Align = alClient
        DataSource = DM.DSContratos
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
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
