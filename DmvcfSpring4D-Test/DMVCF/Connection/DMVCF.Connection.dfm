object DMVCFConnection: TDMVCFConnection
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 363
  Width = 342
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=midgard'
      'User_Name=postgres'
      'Password=123'
      'Server=127.0.0.1'
      'DriverID=PG')
    Connected = True
    LoginPrompt = False
    Left = 152
    Top = 64
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 160
    Top = 208
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    VendorHome = 'C:\Projetos\Project-Midgard\output\server\DLLs\'
    VendorLib = 'libpq.dll'
    Left = 152
    Top = 136
  end
end
