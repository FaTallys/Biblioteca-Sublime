class LivroContrato < Dry::Validation::Contract
  required(:nome).filled(String)
  required(:autor).filled(String)
  required(:tipo_literario).filled(String)
  required(:copias).filed(Integer)

  rule (:copias) do
    if value.size < 0
      key.failure("Numero de copias tem que ser maior ou igual a zero")
    end
  end
end
