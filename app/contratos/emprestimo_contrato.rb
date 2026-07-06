class EmprestimoContrato < Dry::Validation::Contract
  params do
    required(:livro_id).filled(:integer)
    required(:pessoa_id).filled(:integer)
  end
end
