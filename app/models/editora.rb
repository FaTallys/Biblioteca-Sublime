class Editora < ApplicationRecord
  has_many :livros

  def self.ransackable_attributes(auth_object = nil)
    [ "nome", "data_fundacao" ]
  end
  def self.ransach_associations (auth_object = nil)
    [ "livros" ]
  end
end
