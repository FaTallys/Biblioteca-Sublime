class Autor < ApplicationRecord
  has_many :livros

  accepts_nested_attributes_for :livros

  def self.ransackable_attributes
    [ "nome" ]
  end
  def self.ransackable_associations
    [ "livros" ]
  end
end
