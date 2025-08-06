object FrmAgendamento: TFrmAgendamento
  Left = 0
  Top = 0
  Caption = 'Agendamento'
  ClientHeight = 384
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
    Height = 384
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Agendamento'
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
      object lblObservacoes: TLabel
        Left = 3
        Top = 117
        Width = 67
        Height = 15
        Caption = 'Observa'#231#245'es'
      end
      object Panel1: TPanel
        Left = 0
        Top = 313
        Width = 903
        Height = 41
        Align = alBottom
        TabOrder = 0
        ExplicitLeft = 8
        ExplicitTop = 392
        ExplicitWidth = 185
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
        TabOrder = 1
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
        TabOrder = 2
      end
      object dblContrato: TDBLookupComboBox
        Left = 528
        Top = 24
        Width = 202
        Height = 23
        DataField = 'ID_CONTRATO'
        DataSource = DM.DSAgenda
        ListField = 'DESCRICAO'
        ListSource = DM.DSContratos
        TabOrder = 3
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
        TabOrder = 4
      end
      object dtpDataRetirada: TDateTimePicker
        Left = 16
        Top = 80
        Width = 186
        Height = 23
        Date = 45875.000000000000000000
        Time = 0.545078194445523000
        TabOrder = 5
      end
      object dtpDataPrevistaDevolucao: TDateTimePicker
        Left = 208
        Top = 80
        Width = 186
        Height = 23
        Date = 45875.000000000000000000
        Time = 0.545094768516719300
        TabOrder = 6
      end
      object memoObservacao: TMemo
        Left = 0
        Top = 138
        Width = 903
        Height = 175
        Align = alBottom
        Lines.Strings = (
          '')
        TabOrder = 7
        ExplicitLeft = 3
        ExplicitTop = 248
        ExplicitWidth = 909
      end
      object dtpDataDaDevolucao: TDateTimePicker
        Left = 400
        Top = 80
        Width = 186
        Height = 23
        Date = 45875.000000000000000000
        Time = 0.545094768516719300
        TabOrder = 8
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
        TabOrder = 9
      end
    end
    object Listagem: TTabSheet
      Caption = 'DashBoard'
      ImageIndex = 1
    end
  end
end
