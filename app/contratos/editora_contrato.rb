class EditoraContrato < Dry::Validation::Contract
  params do
    required(:nome).filled(:string)
    required(:data_fundacao).filled(:date)
  end
end
