object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Controle de contratos v1.0 - By Connect Solutions 2025'
  ClientHeight = 464
  ClientWidth = 771
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OnActivate = FormActivate
  TextHeight = 14
  object StatusBar1: TStatusBar
    Left = 0
    Top = 445
    Width = 771
    Height = 19
    Panels = <>
  end
  object MainMenu1: TMainMenu
    Left = 32
    Top = 16
    object Module11: TMenuItem
      Caption = 'Cadastros'
      OnClick = Module11Click
      object Cliente1: TMenuItem
        Caption = 'Clientes'
        OnClick = Cliente1Click
      end
      object Ativos1: TMenuItem
        Caption = 'Ativos'
        OnClick = Ativos1Click
      end
      object Contratos1: TMenuItem
        Caption = 'Contratos'
        object Contratos2: TMenuItem
          Caption = 'Contratos'
          OnClick = Contratos2Click
        end
        object AtivosdoContrato1: TMenuItem
          Caption = 'Ativos do Contrato'
        end
      end
      object FormasdePagamento1: TMenuItem
        Caption = 'Formas de Pagamento'
      end
      object Agendamendo1: TMenuItem
        Caption = 'Agendamentos'
        OnClick = Agendamendo1Click
      end
      object Usuarios1: TMenuItem
        Caption = 'Usu'#225'rios'
        OnClick = Usuarios1Click
      end
      object Perfis1: TMenuItem
        Caption = 'Perfis'
        OnClick = Perfis1Click
      end
      object Permisses1: TMenuItem
        Caption = 'Permiss'#245'es'
        OnClick = Permisses1Click
      end
    end
    object AppModule21: TMenuItem
      Caption = 'Relat'#243'rios'
      object Clientes2: TMenuItem
        Caption = 'Clientes'
        object odosContratosdoCliente1: TMenuItem
          Caption = 'Todos Contratos por Cliente'
        end
        object ContratoporID1: TMenuItem
          Caption = 'Contrato por ID'
        end
        object ListagemdeClientes1: TMenuItem
          Caption = 'Listagem de Clientes'
          OnClick = ListagemdeClientes1Click
        end
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Contratos3: TMenuItem
        Caption = 'Contratos'
        object Listagemcontratosativos1: TMenuItem
          Caption = 'Listagem ativos'
        end
        object Listagemcontratosinativos1: TMenuItem
          Caption = 'Listagem inativos'
        end
        object ListagememAberto1: TMenuItem
          Caption = 'Listagem em Aberto'
        end
      end
    end
    object LogOff1: TMenuItem
      Caption = 'Sair'
      OnClick = LogOff1Click
    end
  end
end
