class Pessoa < ApplicationRecord
    has_many :emprestimos
    has_many :livros, through: :emprestimos


    validates :nome, presence: true
    validates :idade, numericality: { greater_than: 10 }


    def pegar_livro(livro_p)
        return "livro nao existe" unless livro_existe?(livro_p)
        return "nao existe copia" unless tem_livro?(livro_p)

        criar_emprestimo(livro)
    end


    def devolver_livro(emprestimo_id)
        return false unless Emprestimo.existe_emprestimo?(emprestimo_id)
        Emprestimo.devolver_livro_db(emprestimo_id)
    end
end
