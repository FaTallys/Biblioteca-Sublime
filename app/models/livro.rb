class Livro < ApplicationRecord
    has_many :emprestimos
    has_many :pessoas, through: :emprestimos

    validates :copias, numericality: { greater_than: 0 }
    validates :nome, length: { maximum: 30 }
end
