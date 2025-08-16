object FrmPermissoesDeUsuarios: TFrmPermissoesDeUsuarios
  Left = 0
  Top = 0
  Caption = 'Controle de Usu'#225'rios'
  ClientHeight = 517
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
  object Panel7: TPanel
    Left = 0
    Top = 0
    Width = 999
    Height = 41
    Align = alTop
    TabOrder = 0
    ExplicitLeft = 8
    ExplicitTop = 8
    ExplicitWidth = 991
    object Label1: TLabel
      Left = 9
      Top = 13
      Width = 27
      Height = 15
      Caption = 'Perfil'
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 42
      Top = 12
      Width = 208
      Height = 23
      KeyField = 'ID_PERFIL'
      ListField = 'NOME'
      ListSource = DM.DSPerfis
      TabOrder = 0
      OnCloseUp = cbPerfilCloseUp
    end
  end
  object Panel8: TPanel
    Left = 0
    Top = 476
    Width = 999
    Height = 41
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 542
    ExplicitWidth = 991
    object Button1: TButton
      Left = 24
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Novo'
      TabOrder = 0
    end
    object Button2: TButton
      Left = 195
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Editar'
      TabOrder = 1
    end
    object Button3: TButton
      Left = 281
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Excluir'
      TabOrder = 2
    end
    object Button4: TButton
      Left = 367
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 3
    end
    object Button5: TButton
      Left = 108
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Salvar'
      TabOrder = 4
    end
  end
  object CheckListBoxItens: TCheckListBox
    Left = 0
    Top = 41
    Width = 999
    Height = 435
    Align = alClient
    ItemHeight = 17
    TabOrder = 2
    ExplicitHeight = 416
  end
  object cbAgendamentos: TCheckBox
    Left = 24
    Top = 72
    Width = 97
    Height = 17
    Caption = 'Agendamentos'
    TabOrder = 3
  end
  object cbPerfis: TCheckBox
    Left = 24
    Top = 104
    Width = 97
    Height = 17
    Caption = 'Perfis'
    TabOrder = 4
  end
  object cbPermissoes: TCheckBox
    Left = 160
    Top = 104
    Width = 97
    Height = 17
    Caption = 'Permiss'#245'es'
    TabOrder = 5
  end
  object cbRelatorios: TCheckBox
    Left = 290
    Top = 104
    Width = 97
    Height = 17
    Caption = 'Relat'#243'rios'
    TabOrder = 6
  end
  object cbUsuarios: TCheckBox
    Left = 424
    Top = 104
    Width = 97
    Height = 17
    Caption = 'Usuarios'
    TabOrder = 7
  end
  object cbFormas: TCheckBox
    Left = 544
    Top = 72
    Width = 161
    Height = 17
    Caption = 'Formas de Pagamentos'
    TabOrder = 8
  end
  object cbAtivos: TCheckBox
    Left = 160
    Top = 72
    Width = 97
    Height = 17
    Caption = 'Ativos'
    TabOrder = 9
  end
  object cbClientes: TCheckBox
    Left = 290
    Top = 72
    Width = 97
    Height = 17
    Caption = 'Clientes'
    TabOrder = 10
  end
  object cbContratos: TCheckBox
    Left = 424
    Top = 72
    Width = 97
    Height = 17
    Caption = 'Contratos'
    TabOrder = 11
  end
  object cbNovo: TCheckBox
    Left = 24
    Top = 168
    Width = 97
    Height = 17
    Caption = 'Bot'#227'o novo'
    TabOrder = 12
  end
  object cbSalvar: TCheckBox
    Left = 160
    Top = 168
    Width = 97
    Height = 17
    Caption = 'Bot'#227'o Salvar'
    TabOrder = 13
  end
  object cbEditar: TCheckBox
    Left = 290
    Top = 168
    Width = 97
    Height = 17
    Caption = 'Bot'#227'o Editar'
    TabOrder = 14
  end
  object cbExcluir: TCheckBox
    Left = 424
    Top = 168
    Width = 97
    Height = 17
    Caption = 'Bot'#227'o Excluir'
    TabOrder = 15
  end
  object cbCancelar: TCheckBox
    Left = 544
    Top = 168
    Width = 97
    Height = 17
    Caption = 'Bot'#227'o Cancelar'
    TabOrder = 16
  end
end
