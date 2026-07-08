class PessoaPolicy < ApplicationPolicy
  attr_reader :pessoa, :registro

  def initialize(pessoa, registro)
    @pessoa = pessoa
    @registro = registro
  end

  def create?
    return true if pessoa.admin?

    if pessoa.bibliotecario?
      return registro.leitor?
    end

    false
  end

  def update?
    return true if pessoa.admin?

    if pessoa.bibliotecario?
      return registro.leitor?
    end

    false
  end

  def destroy?
    if pessoa.admin?
      true
    elsif pessoa.bibliotecario?
      registro.leitor?
    else
      false
    end
  end

  class Scope < ApplicationPolicy::Scope
    def resolve
      if pessoa.admin?
        scope.all
      elsif pessoa.bibliotecario?
        scope.join(:cargo).where(cargos: { nome: [ "leitor", "bibliotecario" ] })
      else
        scope.where(id: pessoa.id)
      end
    end
  end
end
