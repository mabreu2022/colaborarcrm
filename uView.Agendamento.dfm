object FrmAgendamento: TFrmAgendamento
  Left = 0
  Top = 0
  Caption = 'Agendamento'
  ClientHeight = 467
  ClientWidth = 911
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 15
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 911
    Height = 467
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    ExplicitHeight = 384
    object TabSheet1: TTabSheet
      Caption = 'Agendamento'
      object Panel1: TPanel
        Left = 0
        Top = 396
        Width = 903
        Height = 41
        Align = alBottom
        TabOrder = 0
        ExplicitTop = 138
        object btnNovoAgendamento: TButton
          Left = 6
          Top = 9
          Width = 75
          Height = 25
          Caption = 'Novo'
          TabOrder = 0
        end
        object btnEditarAgendamento: TButton
          Left = 87
          Top = 9
          Width = 75
          Height = 25
          Caption = 'Editar'
          TabOrder = 1
        end
        object btnSalvarAgendamento: TButton
          Left = 171
          Top = 9
          Width = 75
          Height = 25
          Caption = 'Salvar'
          TabOrder = 2
        end
        object btnExcluirAgendamento: TButton
          Left = 253
          Top = 9
          Width = 75
          Height = 25
          Caption = 'Excluir'
          TabOrder = 3
        end
        object btnCancelarAgendamento: TButton
          Left = 336
          Top = 9
          Width = 75
          Height = 25
          Caption = 'Cancelar'
          TabOrder = 4
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 903
        Height = 209
        Align = alTop
        TabOrder = 1
        object lblCliente: TLabel
          Left = 16
          Top = 8
          Width = 37
          Height = 15
          Caption = 'Cliente'
        end
        object lblContato: TLabel
          Left = 272
          Top = 3
          Width = 43
          Height = 15
          Caption = 'Contato'
        end
        object lblContrato: TLabel
          Left = 528
          Top = 4
          Width = 47
          Height = 15
          Caption = 'Contrato'
        end
        object lblAtivo: TLabel
          Left = 739
          Top = 8
          Width = 28
          Height = 15
          Caption = 'Ativo'
        end
        object lblDataRetirada: TLabel
          Left = 16
          Top = 59
          Width = 83
          Height = 15
          Caption = 'Data da retirada'
        end
        object lblObservacoes: TLabel
          Left = 3
          Top = 117
          Width = 67
          Height = 15
          Caption = 'Observa'#231#245'es'
        end
        object lblDataPrevistaDeDevolucao: TLabel
          Left = 208
          Top = 59
          Width = 142
          Height = 15
          Caption = 'Data prevista de devolu'#231#227'o'
        end
        object lblDataDevolucao: TLabel
          Left = 400
          Top = 59
          Width = 98
          Height = 15
          Caption = 'Data da devolu'#231#227'o'
        end
        object lblMotivoStatus: TLabel
          Left = 592
          Top = 59
          Width = 73
          Height = 15
          Caption = 'Motivo Status'
        end
        object dblCliente: TDBLookupComboBox
          Left = 16
          Top = 24
          Width = 250
          Height = 23
          DataField = 'ID_CLIENTE'
          DataSource = DM.DSAgenda
          KeyField = 'ID_CLIENTE'
          ListField = 'NOME_RAZAO'
          ListSource = DM.DSCliente
          TabOrder = 0
          OnCloseUp = dblClienteCloseUp
        end
        object dblContato: TDBLookupComboBox
          Left = 272
          Top = 24
          Width = 250
          Height = 23
          DataField = 'ID_CONTATO'
          DataSource = DM.DSAgenda
          KeyField = 'ID_CONTATO'
          ListField = 'NOME_CONTATO'
          ListSource = DM.DScontatos
          TabOrder = 1
        end
        object dblContrato: TDBLookupComboBox
          Left = 528
          Top = 24
          Width = 202
          Height = 23
          DataField = 'ID_CONTRATO'
          DataSource = DM.DSAgenda
          KeyField = 'ID_CONTRATO'
          ListField = 'ID_CONTRATO'
          ListSource = DM.DSContratos
          TabOrder = 2
          OnCloseUp = dblContratoCloseUp
        end
        object dblAtivo: TDBLookupComboBox
          Left = 736
          Top = 24
          Width = 145
          Height = 23
          DataField = 'ID_ATIVO'
          DataSource = DM.DSAgenda
          KeyField = 'ID_ATIVO'
          ListField = 'NUMERO_SERIE'
          ListSource = DM.DSAtivos
          TabOrder = 3
        end
        object dtpDataRetirada: TDateTimePicker
          Left = 16
          Top = 80
          Width = 186
          Height = 23
          Date = 45875.000000000000000000
          Time = 0.545078194445523000
          TabOrder = 4
        end
        object dtpDataPrevistaDevolucao: TDateTimePicker
          Left = 208
          Top = 80
          Width = 186
          Height = 23
          Date = 45875.000000000000000000
          Time = 0.545094768516719300
          TabOrder = 5
        end
        object dtpDataDaDevolucao: TDateTimePicker
          Left = 400
          Top = 80
          Width = 186
          Height = 23
          Date = 45875.000000000000000000
          Time = 0.545094768516719300
          TabOrder = 6
        end
        object dblMotivoStatus: TDBLookupComboBox
          Left = 592
          Top = 80
          Width = 289
          Height = 23
          DataField = 'ID_STATUS'
          DataSource = DM.DSAgenda
          KeyField = 'ID_STATUS'
          ListField = 'STATUS'
          ListSource = DM.DSStatus
          TabOrder = 7
        end
        object memoObservacao: TMemo
          Left = 1
          Top = 138
          Width = 901
          Height = 70
          Align = alBottom
          Lines.Strings = (
            '')
          TabOrder = 8
          ExplicitTop = 137
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 209
        Width = 903
        Height = 187
        Align = alClient
        TabOrder = 2
        ExplicitLeft = 80
        ExplicitTop = 232
        ExplicitWidth = 185
        ExplicitHeight = 41
        object dbgListaEquipamentosLocados: TDBGrid
          Left = 1
          Top = 42
          Width = 901
          Height = 144
          Align = alClient
          DataSource = DM.DSEquipamentosLocados
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'ID_CONTRATO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_ATIVO'
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
              FieldName = 'NUMERO_SERIE'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'QUANTIDADE'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATA_ENTREGA'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATA_DEVOLUCAO'
              Width = 150
              Visible = True
            end>
        end
        object Panel4: TPanel
          Left = 1
          Top = 1
          Width = 901
          Height = 41
          Align = alTop
          TabOrder = 1
          ExplicitLeft = 40
          ExplicitTop = 24
          ExplicitWidth = 185
          object lblListaDeEquipamentos: TLabel
            Left = 1
            Top = 1
            Width = 899
            Height = 39
            Align = alClient
            Caption = 'Lista dos  equipamentos locados no cliente'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
            ExplicitLeft = 50
          end
        end
      end
    end
    object Listagem: TTabSheet
      Caption = 'DashBoard'
      ImageIndex = 1
    end
  end
end
