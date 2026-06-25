class Emprestimo < ApplicationRecord
    belongs_to :pessoa
    belongs_to :livro

    def self.devolver_livro_db(emprestimo_id)
        emprestimo = Emprestimo.find(emprestimo_id)
        livro = emprestimo.livro
        livro.copias += 1
        livro.save
        emprestimo.destroy
        puts "Livro devolvido com sucesso."
    end

    def self.existe_emprestimo?(emprestimo_id)
        emprestimo = Emprestimo.find(emprestimo_id)
        if emprestimo.nil?
            puts "Não exitste livro a ser devolvido."
            false
        else
            true
        end
    end
end
