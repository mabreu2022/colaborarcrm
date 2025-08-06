object FrmRelatorioListagemDeClientes: TFrmRelatorioListagemDeClientes
  Left = 0
  Top = 0
  Caption = 'Relatorio listagem de Clientes'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object frxReport1: TfrxReport
    Version = '2023.3.4'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Microsoft Print to PDF'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45875.284355740700000000
    ReportOptions.LastChange = 45875.313133680600000000
    ScriptLanguage = 'PascalScript'
    ShowProgress = False
    StoreInDFM = False
    Left = 48
    Top = 32
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'Clientes'
    CloseDataSource = False
    DataSet = DM.qryCliente
    BCDToCurrency = False
    DataSetOptions = []
    Left = 48
    Top = 120
  end
  object frxPDFExport1: TfrxPDFExport
    ShowDialog = False
    UseFileCache = True
    ShowProgress = False
    OverwritePrompt = False
    DataOnly = False
    EmbedFontsIfProtected = False
    InteractiveFormsFontSubset = 'A-Z,a-z,0-9,#43-#47 '
    OpenAfterExport = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 95
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    Creator = 'FastReport'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    PdfA = False
    PDFStandard = psNone
    PDFVersion = pv17
    Left = 144
    Top = 32
  end
end
