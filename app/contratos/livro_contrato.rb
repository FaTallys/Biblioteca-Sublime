class LivroContrato < Dry::Validation::Contract
  params do
    required(:nome).filled(:string)
    required(:tipo_literario).filled(:string)
    required(:copias).filled(:integer)
    optional(:autor_id).maybe(:integer)
    optional(:editora_id).maybe(:integer)
  end

  rule (:copias) do
    if value < 0
      key.failure("Numero de copias tem que ser maior ou igual a zero")
    end
  end
end
