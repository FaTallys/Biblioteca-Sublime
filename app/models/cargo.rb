class Cargo < ApplicationRecord
  has_many :pessoas

  def admin?
    nome == "admin"
  end

  def bibliotecario?
    nome == "bibliotecario"
  end

  def leitor?
    nome == "leitor"
  end
end
