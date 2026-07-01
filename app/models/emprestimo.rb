class Emprestimo < ApplicationRecord
    belongs_to :pessoa
    belongs_to :livro

    enum :status_devolucao, { ativo: 0, devolvido: 1 }

    alias_attribute :criado_em, :created_at

    def self.ransackable_attributes(auth_object = nil)
      [ "id", "status_devolucao", "livro_id", "pessoa_id" ]
    end
    def self.ransackable_associations(auth_object = nil)
      [ "pessoa", "livro" ]
    end
end
