class EditoraPolicy < ApplicationPolicy
  attr_reader :pessoa, :editora

  def initialize(pessoa, editora)
    @pessoa = pessoa
    @editora = editora
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
