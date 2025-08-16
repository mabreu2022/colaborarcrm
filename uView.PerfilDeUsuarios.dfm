object FrmPefilDeUsuarios: TFrmPefilDeUsuarios
  Left = 0
  Top = 0
  Caption = 'Controle de Usu'#225'rios'
  ClientHeight = 613
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
  object lblNomePerfil: TLabel
    Left = 16
    Top = 8
    Width = 80
    Height = 15
    Caption = 'Nome do Perfil'
  end
  object lblDescricaoPerfil: TLabel
    Left = 152
    Top = 8
    Width = 98
    Height = 15
    Caption = 'Descri'#231#227'o do Perfil'
  end
  object edtNomePerfil: TEdit
    Left = 16
    Top = 32
    Width = 121
    Height = 23
    TabOrder = 0
  end
  object edtDescricaoPerfil: TEdit
    Left = 152
    Top = 32
    Width = 521
    Height = 23
    TabOrder = 1
  end
  object DBGrid_Perfil: TDBGrid
    Left = 0
    Top = 74
    Width = 991
    Height = 391
    DataSource = DM.DSPerfis
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ID_PERFIL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRICAO'
        Width = 250
        Visible = True
      end>
  end
  object Panel6: TPanel
    Left = 0
    Top = 501
    Width = 991
    Height = 41
    TabOrder = 3
    object lblPesquisarPerfil: TLabel
      Left = 16
      Top = 10
      Width = 27
      Height = 15
      Caption = 'Perfil'
    end
    object edtPesquisarPerfil: TEdit
      Left = 58
      Top = 7
      Width = 217
      Height = 23
      TabOrder = 0
    end
    object btnPesquisarPerfil: TButton
      Left = 288
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Pesquisar'
      TabOrder = 1
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 548
    Width = 991
    Height = 41
    TabOrder = 4
    object btnSalvarPerfis: TButton
      Left = 100
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Salvar'
      TabOrder = 0
    end
    object btnNovoPerfis: TButton
      Left = 16
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Novo'
      TabOrder = 1
    end
    object btnEditarPerfis: TButton
      Left = 187
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Editar'
      TabOrder = 2
    end
    object btnExcluirPerfis: TButton
      Left = 273
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Excluir'
      TabOrder = 3
    end
    object btnCancelarPerfis: TButton
      Left = 359
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 4
    end
  end
end
