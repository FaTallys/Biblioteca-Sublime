class Livro < ApplicationRecord
    has_many :emprestimos
    has_many :pessoas, through: :emprestimos

    validates :copias, numericality: { greater_than: 0 }
    validates :nome, length: { maximum: 30 }

    def self.ransackable_attributes(auth_object = nil)
      [ "nome", "tipo_literario", "autor" ]
    end

    def self.ransackable_associations(auth_object = nil)
      [ "pessoas", "emprestimos" ]
    end
end
