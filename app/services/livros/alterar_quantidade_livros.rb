module Livros
  class AlterarQuantidadeLivros
    def initialize(livro, quantidade)
      @livro = livro
      @quantidade = quantidade
    end

    def call
      livro.increment!(:copias, quantidade)
      livro
    end

    private
    attr_reader :livro, :quantidade
  end
end
