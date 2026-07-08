class Pessoa < ApplicationRecord
  has_many :emprestimos
  has_many :livros, through: :emprestimos
  belongs_to :cargo

  devise :database_authenticatable

  include PessoaRoles

  def self.ransackable_attributes (auth_object = nil)
    [ "nome", "idade" ]
  end
  def self.ransackable_associations (auth_object = nil)
    [ "emprestimos", "livros" ]
  end
end
