class Emprestimo < ApplicationRecord
    belongs_to :pessoa
    belongs_to :livro

    enum :status_devolucao, { ativo: 0, devolvido: 1 }
end
