require 'rails_helper'

RSpec.describe Livro, type: :model do
  it "adicionou livro" do
    livro = create(:livro)
    livro.adicionar_livro(1)

    expect(livro.reload.copias).to eq(4)
  end
end
