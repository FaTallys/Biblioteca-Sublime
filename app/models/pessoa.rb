class Pessoa < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
  has_many :emprestimos
  has_many :livros, through: :emprestimos
  belongs_to :cargo

  devise :database_authenticatable

  include PessoaRoles

  def self.ransackable_attributes (auth_object = nil)
    [ "nome", "idade", "email", "password", "password_confirmation" ]
  end
  def self.ransackable_associations (auth_object = nil)
    [ "emprestimos", "livros" ]
  end
end
