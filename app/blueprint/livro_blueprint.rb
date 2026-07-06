class LivroBlueprint < Blueprinter::Base
  identifier :id
  fields :nome, :tipo_literario, :autor, :copias
  view :para_controller do
    association :emprestimos, blueprint: EmprestimoBlueprint, view: :para_livro_ou_pessoa
    association :pessoas, blueprint: PessoaBlueprint, view: :normal
  end
end
