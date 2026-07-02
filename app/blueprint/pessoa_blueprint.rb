class PessoaBlueprint < Blueprinter::Base
  identifier :id
  fields :nome, :idade
  view :para_controller do
    association :emprestimos, blueprint: EmprestimoBlueprint, view: :para_pessoa
  end
  view :para_livro do
    field :nome
  end
end
