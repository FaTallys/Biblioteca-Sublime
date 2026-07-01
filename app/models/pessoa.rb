class Pessoa < ApplicationRecord
    has_many :emprestimos
    has_many :livros, through: :emprestimos

    validates :nome, presence: true
    validates :idade, numericality: { greater_than: 10 }

    def self.ransackable_attributes (auth_object = nil)
      [ "nome", "idade" ]
    end
    def self.ransackable_associations (auth_object = nil)
      [ "emprestimos", "livros" ]
    end
end
