class LivroPolicy < ApplicationPolicy
attr_reader :pessoa, :livro

  def initialize(pessoa, livro)
    @pessoa = pessoa
    @livro = livro
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    pessoa&.admin? || pessoa&.bibliotecario?
  end

  def update?
    pessoa&.admin? || pessoa&.bibliotecario?
  end

  def destroy?
    pessoa&.admin? || pessoa&.bibliotecario?
  end

  class Scope < ApplicationPolicy::Scope
    def pessoa
      user
    end

    def resolve
      if pessoa.admin? || pessoa.bibliotecario?
        scope.all
      else
        scope.where(status_devolucao: [ :devolvido, nil ])
      end
    end
  end
end
