class Livro < ApplicationRecord
    has_many :emprestimos
    has_many :pessoas, through: :emprestimos
    belongs_to :editora, optional: true

    def self.ransackable_attributes(auth_object = nil)
      [ "nome", "tipo_literario", "autor" ]
    end

    def self.ransackable_associations(auth_object = nil)
      [ "pessoas", "emprestimos", "editora" ]
    end
end
