class LivroPolicy < ApplicationPolicy
attr_reader :pessoa, :livro

  def initialize(pessoa, livro)
    @pessoa = pessoa
    @livro = livro
  end

  def create?
    pessoa.admin? || pessoa.bibliotecario?
  end

  def update?
    pessoa.admin? || pessoa.bibliotecario?
  end

  def destroy?
    pessoa.admin?
  end

  class Scope < ApplicationPolicy::Scope
    def resolve
      if pessoa.admin? || pessoa.bibliotecario?
        scope.all
      else
        scope.where(status_devolucao: [ :devolvido, nil ])
      end
    end
  end
end
