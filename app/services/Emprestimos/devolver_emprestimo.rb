module Emprestimos
  class DevolverEmprestimo
    def initialize (emprestimo_id)
      @emprestimo_id = emprestimo_id
    end
    def call
      livro.increment!(:copias, 1)
      emprestimo.destroy!
    end

    private
    attr_reader :emprestimo_id

    def emprestimo
     @emprestimo ||= Emprestimo.find(emprestimo_id)
    end
    def livro
      emprestimo.livro
    end
  end
end
