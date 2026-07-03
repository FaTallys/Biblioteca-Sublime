class EmprestimoContrato < Dry::Validation::Contract
  params do
    required(:id_livro).filled(Integer)
    required(:id_pessoa).filled(Integer)
  end
end
