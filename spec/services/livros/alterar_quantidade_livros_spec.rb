require 'rails_helper'

RSpec.describe Livros::AlterarQuantidadeLivros do
  it "alterou a quantidade de livros" do
    livro = create(:livro)

    service = described_class.new(livro, 1)
    service.call

    expect(livro.reload.copias).to eq(4)
  end
end
