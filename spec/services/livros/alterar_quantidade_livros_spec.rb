require 'rails_helper'

RSpec.describe Livros::AlterarQuantidadeLivros do
  subject(:alterar_quantidade_livros) { described_class.new(livro, qtd).call }

  let!(:livro) { create(:livro) }
  let(:qtd) { 1 }

  context "quando eu quiser aumentar o numero de livros" do
    it "entao aumenta a quantidade de livros" do
      alterar_quantidade_livros
      expect(livro.reload.copias).to eq(4)
    end
  end
  context "quando eu quiser diminuir o numero de livros" do
    let(:qtd) { -1 }
    it "entao diminui a quantidade de livros" do
      alterar_quantidade_livros
      expect(livro.reload.copias).to eq(2)
    end
  end
end
