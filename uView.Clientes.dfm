object FrmClientes: TFrmClientes
  Left = 0
  Top = 0
  Caption = 'FrmClientes'
  ClientHeight = 563
  ClientWidth = 958
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 15
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 958
    Height = 563
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 878
    object Cadastro: TTabSheet
      Caption = 'Cadastro'
      object lblRazao: TLabel
        Left = 3
        Top = 11
        Width = 64
        Height = 15
        Caption = 'Razao social'
      end
      object lblFantasia: TLabel
        Left = 455
        Top = 11
        Width = 43
        Height = 15
        Caption = 'Fantasia'
      end
      object lblCPFCNPJ: TLabel
        Left = 219
        Top = 45
        Width = 27
        Height = 15
        Caption = 'CNPJ'
      end
      object lblIE: TLabel
        Left = 455
        Top = 45
        Width = 15
        Height = 15
        Caption = 'I.E.'
      end
      object lblTipoPessoa: TLabel
        Left = 3
        Top = 45
        Width = 24
        Height = 15
        Caption = 'Tipo'
      end
      object lblTelefone: TLabel
        Left = 3
        Top = 78
        Width = 45
        Height = 15
        Caption = 'Telefone'
      end
      object lblEndereco: TLabel
        Left = 3
        Top = 111
        Width = 49
        Height = 15
        Caption = 'Endere'#231'o'
      end
      object lblComplemento: TLabel
        Left = 0
        Top = 144
        Width = 77
        Height = 15
        Caption = 'Complemento'
      end
      object lblCEP: TLabel
        Left = 0
        Top = 177
        Width = 21
        Height = 15
        Caption = 'CEP'
      end
      object lblMunicipio: TLabel
        Left = 455
        Top = 177
        Width = 54
        Height = 15
        Caption = 'Municipio'
      end
      object lblUF: TLabel
        Left = 0
        Top = 211
        Width = 14
        Height = 15
        Caption = 'UF'
      end
      object lblEmail: TLabel
        Left = 219
        Top = 78
        Width = 29
        Height = 15
        Caption = 'Email'
      end
      object lblNumero: TLabel
        Left = 452
        Top = 112
        Width = 44
        Height = 15
        Caption = 'N'#250'mero'
      end
      object lblBairro: TLabel
        Left = 455
        Top = 144
        Width = 31
        Height = 15
        Caption = 'Bairro'
      end
      object edtRazao_Nome: TEdit
        Left = 84
        Top = 8
        Width = 353
        Height = 23
        TabOrder = 0
      end
      object edtFantasia: TEdit
        Left = 513
        Top = 8
        Width = 353
        Height = 23
        TabOrder = 1
      end
      object edtCPFCNPJ: TEdit
        Left = 252
        Top = 42
        Width = 185
        Height = 23
        TabOrder = 2
      end
      object edtIE: TEdit
        Left = 513
        Top = 42
        Width = 353
        Height = 23
        TabOrder = 3
      end
      object edtTelefone: TEdit
        Left = 84
        Top = 75
        Width = 121
        Height = 23
        TabOrder = 4
      end
      object edtEmail: TEdit
        Left = 254
        Top = 75
        Width = 612
        Height = 23
        TabOrder = 5
      end
      object edtEndereco: TEdit
        Left = 84
        Top = 108
        Width = 353
        Height = 23
        TabOrder = 6
      end
      object edtNumero: TEdit
        Left = 513
        Top = 108
        Width = 353
        Height = 23
        TabOrder = 7
      end
      object edtComplemento: TEdit
        Left = 83
        Top = 141
        Width = 354
        Height = 23
        TabOrder = 8
      end
      object edtBairro: TEdit
        Left = 513
        Top = 140
        Width = 353
        Height = 23
        TabOrder = 9
      end
      object edtCEP: TEdit
        Left = 84
        Top = 174
        Width = 353
        Height = 23
        TabOrder = 10
      end
      object edtMunicipio: TEdit
        Left = 515
        Top = 174
        Width = 352
        Height = 23
        TabOrder = 11
      end
      object ComboBox1: TComboBox
        Left = 84
        Top = 42
        Width = 121
        Height = 23
        ItemIndex = 0
        TabOrder = 12
        Text = 'Pessoal F'#237'sica'
        Items.Strings = (
          'Pessoal F'#237'sica'
          'Pessoal Jur'#237'dica')
      end
      object cmbUF: TComboBox
        Left = 84
        Top = 208
        Width = 353
        Height = 23
        ItemIndex = 23
        TabOrder = 13
        Text = 'S'#227'o Paulo'
        Items.Strings = (
          'Acre'
          'Alagoas'
          'Amap'#225
          'Amazonas'
          'Bahia'
          'Cear'#225
          'Esp'#237'rito Santo'
          'Goi'#225's'
          'Maranh'#227'o'
          'Mato Grosso'
          'Mato Grosso do Sul'
          'Minas Gerais'
          'Par'#225
          'Para'#237'ba'
          'Paran'#225
          'Pernambuco'
          'Piau'#237
          'Rio de Janeiro'
          'Rio Grande do Norte'
          'Rio Grande do Sul'
          'Rond'#244'nia'
          'Roraima'
          'Santa Catarina'
          'S'#227'o Paulo'
          'Sergipe'
          'Tocantins'
          'Distrito Federal')
      end
      object Panel3: TPanel
        Left = 0
        Top = 492
        Width = 950
        Height = 41
        Align = alBottom
        TabOrder = 14
        ExplicitWidth = 870
        object btnInserir: TButton
          Left = 3
          Top = 8
          Width = 75
          Height = 25
          Caption = 'Novo'
          TabOrder = 0
          OnClick = btnInserirClick
        end
        object btnEditar: TButton
          Left = 87
          Top = 9
          Width = 75
          Height = 25
          Caption = 'Editar'
          TabOrder = 1
          OnClick = btnEditarClick
        end
        object btnExcluir: TButton
          Left = 171
          Top = 9
          Width = 75
          Height = 25
          Caption = 'Excluir'
          TabOrder = 2
          OnClick = btnExcluirClick
        end
      end
    end
    object Listagem: TTabSheet
      Caption = 'Listagem'
      ImageIndex = 1
      object DBGrid1: TDBGrid
        Left = 0
        Top = 41
        Width = 950
        Height = 451
        Align = alClient
        DataSource = DM.DSCliente
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        OnCellClick = DBGrid1CellClick
        Columns = <
          item
            Expanded = False
            FieldName = 'ID_CLIENTE'
            Width = 79
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO_PESSOA'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_RAZAO'
            Width = 373
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_FANTASIA'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CPF_CNPJ'
            Width = 147
            Visible = True
          end>
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 950
        Height = 41
        Align = alTop
        TabOrder = 1
        ExplicitWidth = 870
        object lblLocalizar: TLabel
          Left = 8
          Top = 11
          Width = 33
          Height = 15
          Caption = 'Nome'
        end
        object EdtPesquisar: TEdit
          Left = 47
          Top = 8
          Width = 211
          Height = 23
          TabOrder = 0
        end
        object btnPesquisar: TButton
          Left = 264
          Top = 7
          Width = 75
          Height = 25
          Caption = 'Pesquisar'
          TabOrder = 1
          OnClick = btnPesquisarClick
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 492
        Width = 950
        Height = 41
        Align = alBottom
        TabOrder = 2
        ExplicitWidth = 870
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Contatos'
      ImageIndex = 2
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 950
        Height = 41
        Align = alTop
        TabOrder = 0
        ExplicitWidth = 870
        object lblLocalizar2: TLabel
          Left = 13
          Top = 13
          Width = 96
          Height = 15
          Caption = 'Nome do Contato'
        end
        object lblNomeCliente: TLabel
          Left = 373
          Top = 13
          Width = 90
          Height = 15
          Caption = 'Nome do Cliente'
        end
        object EdtPesquisar2: TEdit
          Left = 116
          Top = 10
          Width = 239
          Height = 23
          TabOrder = 0
        end
        object btnPesquisar2: TButton
          Left = 755
          Top = 9
          Width = 75
          Height = 25
          Caption = 'Pesquisar'
          TabOrder = 1
          OnClick = btnPesquisar2Click
        end
        object CBNomecliente: TDBLookupComboBox
          Left = 469
          Top = 10
          Width = 276
          Height = 23
          KeyField = 'ID_CLIENTE'
          ListField = 'NOME_RAZAO'
          ListSource = DM.DSCliente
          TabOrder = 2
        end
        object btnListaTodos: TBitBtn
          Left = 848
          Top = 8
          Width = 89
          Height = 25
          Caption = 'Listar Todos'
          TabOrder = 3
          OnClick = btnListaTodosClick
        end
      end
      object DBGrid2: TDBGrid
        Left = 0
        Top = 41
        Width = 950
        Height = 451
        Align = alClient
        DataSource = DM.DScontatos
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        OnDblClick = DBGrid2DblClick
        OnExit = DBGrid2Exit
      end
      object Panel5: TPanel
        Left = 0
        Top = 492
        Width = 950
        Height = 41
        Align = alBottom
        TabOrder = 2
        ExplicitWidth = 870
        object btnNovoContato: TBitBtn
          Left = 31
          Top = 6
          Width = 75
          Height = 25
          Caption = 'Novo'
          TabOrder = 0
          OnClick = btnNovoContatoClick
        end
        object btnEditarContato: TBitBtn
          Left = 112
          Top = 6
          Width = 75
          Height = 25
          Caption = 'Editar'
          TabOrder = 1
          OnClick = btnEditarContatoClick
        end
        object btnExcluirContato: TBitBtn
          Left = 194
          Top = 6
          Width = 75
          Height = 25
          Caption = 'Excluir'
          TabOrder = 2
          OnClick = btnExcluirContatoClick
        end
        object btnSalvar: TBitBtn
          Left = 275
          Top = 6
          Width = 75
          Height = 25
          Caption = 'Salvar'
          TabOrder = 3
          OnClick = btnSalvarClick
        end
        object btnCancelar: TBitBtn
          Left = 355
          Top = 6
          Width = 75
          Height = 25
          Caption = 'Cancelar'
          TabOrder = 4
          OnClick = btnCancelarClick
        end
      end
    end
  end
end
