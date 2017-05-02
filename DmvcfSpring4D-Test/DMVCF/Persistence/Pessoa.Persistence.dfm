inherited PessoaPersistence: TPessoaPersistence
  object FDQueryPessoa: TFDQuery
    Connection = DMVCFConnection.FDConnection
    SQL.Strings = (
      'select * from pessoa')
    Left = 88
    Top = 56
    object FDQueryPessoaid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FDQueryPessoanome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 200
    end
    object FDQueryPessoacpfcnpj: TWideStringField
      FieldName = 'cpfcnpj'
      Origin = 'cpfcnpj'
    end
    object FDQueryPessoaendereco_id: TIntegerField
      FieldName = 'endereco_id'
      Origin = 'endereco_id'
    end
  end
end
