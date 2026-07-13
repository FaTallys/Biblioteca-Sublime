class LivroBlueprint < Blueprinter::Base
  identifier :id
  fields :nome, :tipo_literario, :copias
  association :editora, blueprint: EditoraBlueprint
  association :autor, blueprint: AutorBlueprint
  view :para_controller do
    association :emprestimos, blueprint: EmprestimoBlueprint, view: :para_livro_ou_pessoa
    association :pessoas, blueprint: PessoaBlueprint, view: :normal
  end
end
