class PessoaPolicy < ApplicationPolicy
  attr_reader :emprestimo, :registro

  def initialize(emprestimo, registro)
    @emprestimo = emprestimo
    @registro = registro
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
      if pessoa.admin?
        scope.all
      elsif pessoa.bibliotecario?
        scope.where(status_devolucao: [ :ativo, :emprestado ])
      else
        scope.join(pessoa).where(pessoa_id: pessoa.id, status_devolucao: [ :ativo, :emprestado ])
      end
    end
  end
end
