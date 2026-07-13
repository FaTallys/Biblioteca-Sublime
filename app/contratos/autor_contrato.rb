class AutorContrato < Dry::Validation::Contract
  params do
    required(:nome).filled(:string)
    optional(:livros_attributes).array(:hash)
  end
  rule(:livros_attributes) do
    value.each do |livro|
      LivroContrato.new.call(livro)
    end
  end
end
