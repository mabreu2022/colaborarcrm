object FrmBuscaDeUsuarios: TFrmBuscaDeUsuarios
  Left = 0
  Top = 0
  Caption = 'Controle de Usu'#225'rios'
  ClientHeight = 676
  ClientWidth = 999
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  TextHeight = 15
  object lblNomeUsuario: TLabel
    Left = 32
    Top = 16
    Width = 43
    Height = 15
    Caption = ' Usuario'
  end
  object lblSenhaUsuario: TLabel
    Left = 163
    Top = 8
    Width = 32
    Height = 15
    Caption = 'Senha'
  end
  object lblEmailUsuario: TLabel
    Left = 304
    Top = 8
    Width = 34
    Height = 15
    Caption = 'E-mail'
  end
  object lblPerfilUsuario: TLabel
    Left = 608
    Top = 8
    Width = 86
    Height = 15
    Caption = 'Perfil do usuario'
  end
  object edtNomeUsuario: TEdit
    Left = 16
    Top = 24
    Width = 121
    Height = 23
    TabOrder = 0
  end
  object edtSenhaUsuario: TEdit
    Left = 160
    Top = 24
    Width = 121
    Height = 23
    TabOrder = 1
  end
  object edtEmailUsuario: TEdit
    Left = 303
    Top = 24
    Width = 282
    Height = 23
    TabOrder = 2
  end
  object cbPerfilUsuario: TDBLookupComboBox
    Left = 608
    Top = 24
    Width = 145
    Height = 23
    DataField = 'ID_PERFIL'
    DataSource = DM.DSUsuarios
    KeyField = 'ID_PERFIL'
    ListField = 'NOME'
    ListSource = DM.DSPerfis
    TabOrder = 3
  end
  object grdBusca: TDBGrid
    Left = -8
    Top = 73
    Width = 999
    Height = 429
    DataSource = DM.DSUsuarios
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'NOME'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMAIL'
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SENHA'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_PERFIL'
        Visible = True
      end>
  end
  object Panel5: TPanel
    Left = -8
    Top = 514
    Width = 999
    Height = 41
    TabOrder = 5
    object lblPesquisarUsuario: TLabel
      Left = 8
      Top = 13
      Width = 40
      Height = 15
      Caption = 'Usu'#225'rio'
    end
    object edtPesquisarUsuario: TEdit
      Left = 54
      Top = 10
      Width = 352
      Height = 23
      TabOrder = 0
    end
    object btnPesquisarUsuario: TButton
      Left = 416
      Top = 10
      Width = 89
      Height = 25
      Caption = 'Pesquisar'
      TabOrder = 1
    end
  end
  object Panel3: TPanel
    Left = -8
    Top = 562
    Width = 999
    Height = 41
    TabOrder = 6
    object btnNovoUsuario: TButton
      Left = 16
      Top = 10
      Width = 75
      Height = 25
      Caption = 'Novo'
      TabOrder = 0
      OnClick = btnNovoUsuarioClick
    end
    object btnEditarUsuario: TButton
      Left = 104
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Editar'
      TabOrder = 1
      OnClick = btnEditarUsuarioClick
    end
    object btnSalvarUsuario: TButton
      Left = 193
      Top = 10
      Width = 75
      Height = 25
      Caption = 'Salvar'
      TabOrder = 2
      OnClick = btnSalvarUsuarioClick
    end
    object btnExcluirUsuario: TButton
      Left = 279
      Top = 10
      Width = 75
      Height = 25
      Caption = 'Excluir'
      TabOrder = 3
      OnClick = btnExcluirUsuarioClick
    end
    object btnCancelarUsuario: TButton
      Left = 365
      Top = 10
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 4
    end
    object btnFechar: TButton
      Left = 912
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Fechar'
      TabOrder = 5
      OnClick = btnFecharClick
    end
  end
end
