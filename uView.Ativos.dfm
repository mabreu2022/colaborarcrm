object FrmAtivos: TFrmAtivos
  Left = 0
  Top = 0
  Caption = 'Cadastro de ativos'
  ClientHeight = 441
  ClientWidth = 1021
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
    Width = 1021
    Height = 441
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 735
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
        DataField = 'ID_STATUS'
        DataSource = DM.DSAtivos
        KeyField = 'ID_STATUS'
        ListField = 'STATUS'
        ListSource = DM.DSStatus
        TabOrder = 2
      end
      object dblLocadoNoCliente: TDBLookupComboBox
        Left = 336
        Top = 72
        Width = 353
        Height = 23
        DataField = 'ID_CLIENTE_PROPRIETARIO'
        DataSource = DM.DSAtivos
        KeyField = 'ID_CLIENTE'
        ListField = 'NOME_RAZAO'
        ListSource = DM.DSCliente
        TabOrder = 3
      end
      object Panel1: TPanel
        Left = 0
        Top = 370
        Width = 1013
        Height = 41
        Align = alBottom
        TabOrder = 4
        ExplicitWidth = 727
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
          OnClick = btnSalvarAtivoClick
        end
        object btnExcluirAtivo: TButton
          Left = 279
          Top = 10
          Width = 75
          Height = 25
          Caption = 'Excluir'
          TabOrder = 3
          OnClick = btnExcluirAtivoClick
        end
        object btnCancelarAtivo: TButton
          Left = 365
          Top = 10
          Width = 75
          Height = 25
          Caption = 'Cancelar'
          TabOrder = 4
          OnClick = btnCancelarAtivoClick
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Listagem'
      ImageIndex = 1
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 1013
        Height = 41
        Align = alTop
        TabOrder = 0
        ExplicitWidth = 727
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
          OnClick = btnPesquisarNumeroDeserieClick
        end
      end
      object grdAtivos: TDBGrid
        Left = 0
        Top = 41
        Width = 1013
        Height = 370
        Align = alClient
        DataSource = DM.DSAtivos
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'ID_ATIVO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NUMERO_SERIE'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ID_CLIENTE_PROPRIETARIO'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ID_STATUS'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_STATUS'
            Title.Caption = 'STATUS'
            Width = 150
            Visible = True
          end>
      end
    end
  end
  object fdMemAtivos: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 300
    Top = 138
  end
end
