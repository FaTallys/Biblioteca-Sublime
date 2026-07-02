class LivroBlueprint < Blueprinter::Base
  identifier :id
  view :para_controller do
    fields :nome, :tipo_literario, :autor, :copias
    association :emprestimos, blueprint: EmprestimoBlueprint, view: :para_livro
    association :pessoas, blueprint: PessoaBlueprint, view: :para_livro
  end
end
