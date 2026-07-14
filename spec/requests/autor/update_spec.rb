require 'rails_helper'

RSpec.describe "update autor", type: :request do
  subject(:update_autor) do
    patch autor_path(autor.id), params: { autor: autor2 }
  end

  let!(:autor) { create(:autor) }
  let!(:livro) { create(:livro, autor: autor) }
  let!(:livro2) { attributes_for(:livro2) }

  let(:autor2) do
    attributes_for(:autor2).merge(
      livros_attributes: [ livro2.merge(id: livro.id) ]
    )
  end
  let!(:pessoa) { create(:pessoa) }

  let(:resposta_esperada) do {
    'id' => autor.id,
    'nome' => autor.nome,
    'livros' => [
        {
          'id' => livro.id,
          'nome' => livro2[:nome],
          'autor_id' => autor.id,
          'tipo_literario' => livro2[:tipo_literario],
          'copias' => livro2[:copias],
          'editora_id' => livro2[:editora_id]
        }
      ]
    }
  end

  before do
    sign_in(pessoa)
  end

  context "quando quiser alterar um autor e um livor" do
    it "entao altera o autor e o livro" do
      update_autor
      expect(response).to have_http_status(:ok)
    end
  end
end
