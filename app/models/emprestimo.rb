class Emprestimo < ApplicationRecord
    belongs_to :pessoa
    belongs_to :livro
end
