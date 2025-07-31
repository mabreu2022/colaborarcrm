object FrmControleDeUsuarios: TFrmControleDeUsuarios
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
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 999
    Height = 613
    ActivePage = TabSheet3
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Cadastro'
      object lblNomeUsuario: TLabel
        Left = 24
        Top = 8
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
      object Panel3: TPanel
        Left = 0
        Top = 542
        Width = 991
        Height = 41
        Align = alBottom
        TabOrder = 0
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
      end
      object edtNomeUsuario: TEdit
        Left = 16
        Top = 24
        Width = 121
        Height = 23
        TabOrder = 1
      end
      object edtSenhaUsuario: TEdit
        Left = 160
        Top = 24
        Width = 121
        Height = 23
        TabOrder = 2
      end
      object edtEmailUsuario: TEdit
        Left = 303
        Top = 24
        Width = 282
        Height = 23
        TabOrder = 3
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
        TabOrder = 4
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 72
        Width = 991
        Height = 429
        Align = alBottom
        DataSource = DM.DSUsuarios
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 5
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
        Left = 0
        Top = 501
        Width = 991
        Height = 41
        Align = alBottom
        TabOrder = 6
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
    end
    object TabSheet2: TTabSheet
      Caption = 'Perfis'
      ImageIndex = 1
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
      object Panel4: TPanel
        Left = 0
        Top = 542
        Width = 991
        Height = 41
        Align = alBottom
        TabOrder = 0
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
      object edtNomePerfil: TEdit
        Left = 16
        Top = 32
        Width = 121
        Height = 23
        TabOrder = 1
      end
      object edtDescricaoPerfil: TEdit
        Left = 152
        Top = 32
        Width = 521
        Height = 23
        TabOrder = 2
      end
      object Panel6: TPanel
        Left = 0
        Top = 501
        Width = 991
        Height = 41
        Align = alBottom
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
      object DBGrid_Perfil: TDBGrid
        Left = 0
        Top = 80
        Width = 991
        Height = 421
        Align = alBottom
        DataSource = DM.DSPerfis
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
    end
    object TabSheet3: TTabSheet
      Caption = 'Permiss'#245'es'
      ImageIndex = 2
      object CheckListBoxItens: TCheckListBox
        Left = 0
        Top = 41
        Width = 991
        Height = 501
        Align = alClient
        ItemHeight = 17
        TabOrder = 0
      end
      object Panel1: TPanel
        Left = 0
        Top = 542
        Width = 991
        Height = 41
        Align = alBottom
        TabOrder = 1
        object btnNovoPermissoes: TButton
          Left = 24
          Top = 8
          Width = 75
          Height = 25
          Caption = 'Novo'
          TabOrder = 0
        end
        object btnEditarPermissoes: TButton
          Left = 195
          Top = 8
          Width = 75
          Height = 25
          Caption = 'Editar'
          TabOrder = 1
        end
        object btnExcluirPermissoes: TButton
          Left = 281
          Top = 8
          Width = 75
          Height = 25
          Caption = 'Excluir'
          TabOrder = 2
        end
        object btnCancelarPermissoes: TButton
          Left = 367
          Top = 8
          Width = 75
          Height = 25
          Caption = 'Cancelar'
          TabOrder = 3
        end
        object btnSalvarPermissoes: TButton
          Left = 108
          Top = 8
          Width = 75
          Height = 25
          Caption = 'Salvar'
          TabOrder = 4
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 991
        Height = 41
        Align = alTop
        TabOrder = 2
        object lblPerfil: TLabel
          Left = 9
          Top = 13
          Width = 27
          Height = 15
          Caption = 'Perfil'
        end
        object cbPerfil: TDBLookupComboBox
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
  end
end
