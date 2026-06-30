class Pessoa < ApplicationRecord
    has_many :emprestimos
    has_many :livros, through: :emprestimos


    validates :nome, presence: true
    validates :idade, numericality: { greater_than: 10 }
end
