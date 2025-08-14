object DM: TDM
  Height = 374
  Width = 718
  object Conn: TFDConnection
    Params.Strings = (
      'Database=C:\FONTES\Colaborar\DataBase\BANCOCOLABORAR.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Protocol=TCPIP'
      'Server=127.0.0.1'
      'Port=3050'
      'DriverID=FB'
      'CharacterSet=UTF8')
    Connected = True
    LoginPrompt = False
    Left = 40
    Top = 24
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    VendorLib = 'C:\Program Files (x86)\Firebird\Firebird_5_0\fbclient.dll'
    Left = 128
    Top = 24
  end
  object qryCliente: TFDQuery
    Active = True
    Connection = Conn
    SQL.Strings = (
      'select * from clientes')
    Left = 40
    Top = 96
    object qryClienteID_CLIENTE: TIntegerField
      AutoGenerateValue = arAutoInc
      DisplayWidth = 10
      FieldName = 'ID_CLIENTE'
      Origin = 'ID_CLIENTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryClienteTIPO_PESSOA: TWideStringField
      DisplayWidth = 12
      FieldName = 'TIPO_PESSOA'
      Origin = 'TIPO_PESSOA'
      FixedChar = True
      Size = 1
    end
    object qryClienteNOME_RAZAO: TWideStringField
      DisplayWidth = 38
      FieldName = 'NOME_RAZAO'
      Origin = 'NOME_RAZAO'
      Required = True
      Size = 100
    end
    object qryClienteNOME_FANTASIA: TWideStringField
      DisplayWidth = 100
      FieldName = 'NOME_FANTASIA'
      Origin = 'NOME_FANTASIA'
      Size = 100
    end
    object qryClienteCPF_CNPJ: TWideStringField
      DisplayWidth = 20
      FieldName = 'CPF_CNPJ'
      Origin = 'CPF_CNPJ'
      Required = True
    end
    object qryClienteIE: TWideStringField
      DisplayWidth = 20
      FieldName = 'IE'
      Origin = 'IE'
    end
    object qryClienteRG: TWideStringField
      DisplayWidth = 20
      FieldName = 'RG'
      Origin = 'RG'
    end
    object qryClienteDATA_NASCIMENTO: TDateField
      DisplayWidth = 18
      FieldName = 'DATA_NASCIMENTO'
      Origin = 'DATA_NASCIMENTO'
    end
    object qryClienteTELEFONE: TWideStringField
      DisplayWidth = 20
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
    end
    object qryClienteEMAIL: TWideStringField
      DisplayWidth = 100
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 100
    end
    object qryClienteENDERECO: TWideStringField
      DisplayWidth = 100
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Size = 100
    end
    object qryClienteNUMERO: TWideStringField
      DisplayWidth = 10
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      Size = 10
    end
    object qryClienteCOMPLEMENTO: TWideStringField
      DisplayWidth = 50
      FieldName = 'COMPLEMENTO'
      Origin = 'COMPLEMENTO'
      Size = 50
    end
    object qryClienteBAIRRO: TWideStringField
      DisplayWidth = 60
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Size = 60
    end
    object qryClienteCEP: TWideStringField
      DisplayWidth = 10
      FieldName = 'CEP'
      Origin = 'CEP'
      Size = 10
    end
    object qryClienteMUNICIPIO: TWideStringField
      DisplayWidth = 60
      FieldName = 'MUNICIPIO'
      Origin = 'MUNICIPIO'
      Size = 60
    end
    object qryClienteUF: TWideStringField
      DisplayWidth = 2
      FieldName = 'UF'
      Origin = 'UF'
      FixedChar = True
      Size = 2
    end
    object qryClienteCODIGO_MUNICIPIO: TIntegerField
      DisplayWidth = 18
      FieldName = 'CODIGO_MUNICIPIO'
      Origin = 'CODIGO_MUNICIPIO'
    end
    object qryClientePAIS: TWideStringField
      DisplayWidth = 60
      FieldName = 'PAIS'
      Origin = 'PAIS'
      Size = 60
    end
    object qryClienteCODIGO_PAIS: TIntegerField
      DisplayWidth = 12
      FieldName = 'CODIGO_PAIS'
      Origin = 'CODIGO_PAIS'
    end
    object qryClienteATIVO: TWideStringField
      FieldName = 'ATIVO'
      Origin = 'ATIVO'
      Size = 1
    end
  end
  object DSCliente: TDataSource
    DataSet = qryCliente
    Left = 128
    Top = 96
  end
  object qryContatos: TFDQuery
    Connection = Conn
    SQL.Strings = (
      'SELECT c.*, cli.NOME_RAZAO'
      'FROM CONTATOS c'
      'INNER JOIN CLIENTES cli ON cli.ID_CLIENTE = c.ID_CLIENTE')
    Left = 40
    Top = 168
    object qryContatosID_CONTATO: TIntegerField
      FieldName = 'ID_CONTATO'
      Origin = 'ID_CONTATO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryContatosID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
      Origin = 'ID_CLIENTE'
      Required = True
    end
    object qryContatosNOME_CONTATO: TWideStringField
      FieldName = 'NOME_CONTATO'
      Origin = 'NOME_CONTATO'
      Required = True
      Size = 100
    end
    object qryContatosTELEFONE_CONTATO: TWideStringField
      FieldName = 'TELEFONE_CONTATO'
      Origin = 'TELEFONE_CONTATO'
    end
    object qryContatosEMAIL_CONTATO: TWideStringField
      FieldName = 'EMAIL_CONTATO'
      Origin = 'EMAIL_CONTATO'
      Size = 100
    end
    object qryContatosCARGO: TWideStringField
      FieldName = 'CARGO'
      Origin = 'CARGO'
      Size = 50
    end
    object qryContatosOBSERVACAO: TWideStringField
      FieldName = 'OBSERVACAO'
      Origin = 'OBSERVACAO'
      Size = 255
    end
    object qryContatosTIPO_CONTATO: TWideStringField
      FieldName = 'TIPO_CONTATO'
      Origin = 'TIPO_CONTATO'
    end
    object qryContatosDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
      Origin = 'DATA_CADASTRO'
    end
    object qryContatosATIVO: TWideStringField
      FieldName = 'ATIVO'
      Origin = 'ATIVO'
      Size = 1
    end
    object qryContatosNOME_RAZAO: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_RAZAO'
      Origin = 'NOME_RAZAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
  end
  object DScontatos: TDataSource
    DataSet = qryContatos
    Left = 128
    Top = 168
  end
  object qryUsuarios: TFDQuery
    Connection = Conn
    SQL.Strings = (
      'select * from usuarios')
    Left = 272
    Top = 32
    object qryUsuariosID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
      Origin = 'ID_USUARIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryUsuariosNOME: TWideStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 100
    end
    object qryUsuariosEMAIL: TWideStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Required = True
      Size = 100
    end
    object qryUsuariosSENHA: TWideStringField
      FieldName = 'SENHA'
      Origin = 'SENHA'
      Required = True
      Size = 100
    end
    object qryUsuariosID_PERFIL: TIntegerField
      FieldName = 'ID_PERFIL'
      Origin = 'ID_PERFIL'
      Required = True
    end
  end
  object qryPerfis: TFDQuery
    Active = True
    Connection = Conn
    SQL.Strings = (
      'select * from perfis')
    Left = 264
    Top = 88
  end
  object qryPermissoes: TFDQuery
    Connection = Conn
    SQL.Strings = (
      'select * from permissoes')
    Left = 264
    Top = 144
  end
  object DSUsuarios: TDataSource
    DataSet = qryUsuarios
    Left = 368
    Top = 32
  end
  object DSPerfis: TDataSource
    DataSet = qryPerfis
    Left = 368
    Top = 88
  end
  object DSPermissoes: TDataSource
    DataSet = qryPermissoes
    Left = 368
    Top = 144
  end
  object qryAtivos: TFDQuery
    CachedUpdates = True
    Connection = Conn
    SQL.Strings = (
      'SELECT a.ID_ATIVO,'
      '       a.NUMERO_SERIE,'
      '       a.DESCRICAO,'
      '       a.ID_CLIENTE_PROPRIETARIO,'
      '       a.ID_STATUS,'
      '       s.STATUS AS NOME_STATUS'
      'FROM ATIVOS a'
      'INNER JOIN STATUS s ON s.ID_STATUS = a.ID_STATUS')
    Left = 264
    Top = 216
  end
  object DSAtivos: TDataSource
    DataSet = qryAtivos
    Left = 368
    Top = 216
  end
  object qryStatus: TFDQuery
    Connection = Conn
    SQL.Strings = (
      'SELECT * FROM STATUS')
    Left = 264
    Top = 288
    object qryStatusID_STATUS: TIntegerField
      FieldName = 'ID_STATUS'
      Origin = 'ID_STATUS'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryStatusSTATUS: TWideStringField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Size = 100
    end
  end
  object DSStatus: TDataSource
    DataSet = qryStatus
    Left = 368
    Top = 288
  end
  object qryAgenda: TFDQuery
    Connection = Conn
    SQL.Strings = (
      'SELECT'
      '    A.ID_AGENDA,'
      '    A.ID_CLIENTE,'
      '    C.NOME_RAZAO AS CLIENTE,'
      '    A.ID_CONTATO,'
      '    CT.NOME_CONTATO AS CONTATO,'
      '    CT.TELEFONE_CONTATO,'
      '    CT.EMAIL_CONTATO,'
      '    CT.CARGO,'
      '    A.ID_ATIVO,'
      '    ATI.DESCRICAO AS ATIVO_DESCRICAO,'
      '    ATI.NUMERO_SERIE,'
      '    A.ID_CONTRATO,'
      '    CO.DESCRICAO AS CONTRATO_DESCRICAO,'
      '    CO.VALOR_MENSAL,'
      '    A.DATA_RETIRADA,'
      '    A.DATA_DEVOLUCAO_PREVISTA,'
      '    A.DATA_DEVOLUCAO,'
      '    A.OBSERVACAO,'
      '    A.ID_STATUS'
      'FROM'
      '    AGENDA A'
      '    LEFT JOIN CLIENTES C ON C.ID_CLIENTE = A.ID_CLIENTE'
      '    LEFT JOIN CONTATOS CT ON CT.ID_CONTATO = A.ID_CONTATO'
      '    LEFT JOIN ATIVOS ATI ON ATI.ID_ATIVO = A.ID_ATIVO'
      '    LEFT JOIN CONTRATOS CO ON CO.ID_CONTRATO = A.ID_CONTRATO'
      'ORDER BY'
      '    A.DATA_RETIRADA DESC;')
    Left = 464
    Top = 32
    object qryAgendaID_AGENDA: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID_AGENDA'
      Origin = 'ID_AGENDA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryAgendaID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
      Origin = 'ID_CLIENTE'
      Required = True
    end
    object qryAgendaID_CONTATO: TIntegerField
      FieldName = 'ID_CONTATO'
      Origin = 'ID_CONTATO'
      Required = True
    end
    object qryAgendaID_CONTRATO: TIntegerField
      FieldName = 'ID_CONTRATO'
      Origin = 'ID_CONTRATO'
      Required = True
    end
    object qryAgendaID_ATIVO: TIntegerField
      FieldName = 'ID_ATIVO'
      Origin = 'ID_ATIVO'
      Required = True
    end
    object qryAgendaDATA_RETIRADA: TDateField
      FieldName = 'DATA_RETIRADA'
      Origin = 'DATA_RETIRADA'
    end
    object qryAgendaDATA_DEVOLUCAO_PREVISTA: TDateField
      FieldName = 'DATA_DEVOLUCAO_PREVISTA'
      Origin = 'DATA_DEVOLUCAO_PREVISTA'
    end
    object qryAgendaDATA_DEVOLUCAO: TDateField
      FieldName = 'DATA_DEVOLUCAO'
      Origin = 'DATA_DEVOLUCAO'
    end
    object qryAgendaOBSERVACAO: TWideStringField
      FieldName = 'OBSERVACAO'
      Origin = 'OBSERVACAO'
      Size = 5000
    end
    object qryAgendaID_STATUS: TIntegerField
      FieldName = 'ID_STATUS'
      Origin = 'ID_STATUS'
    end
  end
  object DSAgenda: TDataSource
    DataSet = qryAgenda
    Left = 584
    Top = 32
  end
  object qryAgenda_Detalhe: TFDQuery
    Connection = Conn
    SQL.Strings = (
      'SELECT'
      '    D.ID_DETALHE,'
      '    D.ID_AGENDA,'
      '    D.HORARIO_INICIO,'
      '    D.HORARIO_FIM,'
      '    D.DESCRICAO,'
      '    D.ID_USUARIO,'
      '    U.NOME AS NOME_USUARIO,'
      '    U.EMAIL AS EMAIL_USUARIO,'
      '    D.ID_STATUS,'
      '    S.STATUS AS STATUS_DESCRICAO'
      'FROM'
      '    AGENDA_DETALHE D'
      '    LEFT JOIN USUARIOS U ON U.ID_USUARIO = D.ID_USUARIO'
      '    LEFT JOIN STATUS S ON S.ID_STATUS = D.ID_STATUS'
      'WHERE'
      '    D.ID_AGENDA = :ID_AGENDA'
      'ORDER BY'
      '    D.HORARIO_INICIO;')
    Left = 464
    Top = 120
    ParamData = <
      item
        Name = 'ID_AGENDA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object DSAgenda_Detalhe: TDataSource
    DataSet = qryAgenda_Detalhe
    Left = 584
    Top = 120
  end
  object qryContratos: TFDQuery
    Connection = Conn
    SQL.Strings = (
      'SELECT * FROM CONTRATOS')
    Left = 32
    Top = 240
    object qryContratosID_CONTRATO: TIntegerField
      FieldName = 'ID_CONTRATO'
      Origin = 'ID_CONTRATO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryContratosID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
      Origin = 'ID_CLIENTE'
      Required = True
    end
    object qryContratosDATA_INICIO: TDateField
      FieldName = 'DATA_INICIO'
      Origin = 'DATA_INICIO'
      Required = True
    end
    object qryContratosDATA_FIM: TDateField
      FieldName = 'DATA_FIM'
      Origin = 'DATA_FIM'
    end
    object qryContratosVALOR_MENSAL: TFMTBCDField
      FieldName = 'VALOR_MENSAL'
      Origin = 'VALOR_MENSAL'
      Precision = 18
      Size = 2
    end
    object qryContratosOBSERVACOES: TWideMemoField
      FieldName = 'OBSERVACOES'
      Origin = 'OBSERVACOES'
      BlobType = ftWideMemo
    end
    object qryContratosID_STATUS: TIntegerField
      FieldName = 'ID_STATUS'
      Origin = 'ID_STATUS'
    end
    object qryContratosDESCRICAO: TWideStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 100
    end
  end
  object DSContratos: TDataSource
    DataSet = qryContratos
    Left = 128
    Top = 240
  end
  object qryEquipamentosLocados: TFDQuery
    Connection = Conn
    SQL.Strings = (
      'SELECT AC.*, A.DESCRICAO, A.NUMERO_SERIE'
      '    FROM ATIVOS_CONTRATOS AC '
      '    JOIN ATIVOS A ON AC.ID_ATIVO = A.ID_ATIVO '
      '    WHERE AC.ID_CONTRATO = :ID_CONTRATO')
    Left = 472
    Top = 216
    ParamData = <
      item
        Name = 'ID_CONTRATO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryEquipamentosLocadosID_CONTRATO: TIntegerField
      FieldName = 'ID_CONTRATO'
      Origin = 'ID_CONTRATO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryEquipamentosLocadosID_ATIVO: TIntegerField
      FieldName = 'ID_ATIVO'
      Origin = 'ID_ATIVO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryEquipamentosLocadosDESCRICAO: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qryEquipamentosLocadosNUMERO_SERIE: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'NUMERO_SERIE'
      Origin = 'NUMERO_SERIE'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qryEquipamentosLocadosQUANTIDADE: TIntegerField
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
    end
    object qryEquipamentosLocadosDATA_ENTREGA: TDateField
      FieldName = 'DATA_ENTREGA'
      Origin = 'DATA_ENTREGA'
    end
    object qryEquipamentosLocadosDATA_DEVOLUCAO: TDateField
      FieldName = 'DATA_DEVOLUCAO'
      Origin = 'DATA_DEVOLUCAO'
    end
  end
  object DSEquipamentosLocados: TDataSource
    DataSet = qryEquipamentosLocados
    Left = 624
    Top = 216
  end
end
