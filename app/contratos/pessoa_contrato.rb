class PessoaContrato < Dry::Validation::Contract
  params do
    required(:nome).filled(:string)
    required(:idade).filled(:integer)
    required(:email).filled(:string)
    required(:password).filled(:string)
    required(:password_confirmation).filled(:string)
    required(:cargo_id).filled(:integer)
  end
  rule(:idade) do
    if value < 12
      key.failure("Não tem idade suficiente")
    end
  end
end
