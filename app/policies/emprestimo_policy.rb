class PessoaPolicy < ApplicationPolicy
  attr_reader :pessoa, :emprestimo

  def initialize(pessoa, emprestimo)
    @pessoa = pessoa
    @remprestimo = emprestimo
  end

  def create?
    pessoa.admin? || pessoa.bibliotecario?
  end

  def update?
    pessoa.admin? || pessoa.bibliotecario?
  end

  def destroy?
    pessoa.admin? || pessoa.bibliotecario?
  end

  class Scope < ApplicationPolicy::Scope
    def resolve
      if pessoa.admin? || pessoa.bibliotecario?
        scope.all
      else
        scope.where(pessoa_id: pessoa.id, status_devolucao: [ :ativo, :emprestado ])
      end
    end
  end
end
