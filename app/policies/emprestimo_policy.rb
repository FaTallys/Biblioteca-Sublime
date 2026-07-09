class EmprestimoPolicy < ApplicationPolicy
  attr_reader :pessoa, :emprestimo

  def initialize(pessoa, emprestimo)
    @pessoa = pessoa
    @emprestimo = emprestimo
  end

  def index?
    return true if pessoa.admin? || pessoa.bibliotecario?

    if pessoa.leitor
      @emprestimo
    end
  end

  def show?
    return true if pessoa.admin? || pessoa.bibliotecario?

    if pessoa.leitor
      @emprestimo
    end
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
        scope.where(pessoa_id: pessoa.id, status_devolucao: [ :ativo, :emprestado ])
      end
    end
  end
end
