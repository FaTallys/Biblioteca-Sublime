class Pessoa_Contract::Base::Contract
  params do
    required(:nome).filled(String)
    required(:idade).filled(Integer)
  end
  rule(:idade) do
    if value < 12
      puts key.failure ("Não tem idade suficiente")
    end
  end
end
