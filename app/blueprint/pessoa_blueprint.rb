class PessoaBlueprint < Blueprinter::Base
  identifier :id
  view :para_controller do
    association :emprestimos, blueprint: EmprestimoBlueprint, view: :para_livro_ou_pessoa
  end
  view :normal do
    fields :nome, :idade, :email
  end
end
