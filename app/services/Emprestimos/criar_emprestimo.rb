module Emprestimos
  class CriarEmprestimo
    def initialize(livro_id, pessoa_id)
      @livro_id = livro_id
      @pessoa_id = pessoa_id
    end

    def call
      livro.decrement!(:copias, 1)
      emprestimo = Emprestimo.create!(
        pessoa: pessoa,
        livro: livro,
        status_devolucao: :ativo)

        emprestimo
    end

    private
    attr_reader :livro_id, :pessoa_id

    def livro
      @livro ||= Livro.find(livro_id)
    end
    def pessoa
      @pessoa ||= Pessoa.find(pessoa_id)
    end
  end
end
