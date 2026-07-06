class EmprestimoBlueprint < Blueprinter::Base
  identifier :id
  field :criado_em

  view :normal do
    association :livro, blueprint: LivroBlueprint
    association :pessoa, blueprint: PessoaBlueprint, view: :normal
  end

  view :para_livro_ou_pessoa do
   field :id
  end
end
