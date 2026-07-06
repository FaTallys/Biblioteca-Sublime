class PessoaContrato < Dry::Validation::Contract
  params do
    required(:nome).filled(:string)
    required(:idade).filled(:integer)
  end
  rule(:idade) do
    if value < 12
      key.failure("Não tem idade suficiente")
    end
  end
end
