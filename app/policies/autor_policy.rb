class AutorPolicy < ApplicationPolicy
  attr_reader :pessoa, :autor

  def initialize(pessoa, autor)
    @pessoa = pessoa
    @autor = autor
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
end
