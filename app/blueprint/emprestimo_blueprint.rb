class EmprestimoBlueprint < Blueprinter::Base
  identifier :id
  fields :criado_em

  view :normal do
    association :livro, blueprint: LivroBlueprint
    association :pessoa, blueprint: PessoaBlueprint
  end

  view :para_livro_ou_pessoa do
   fields :id
  end
end
