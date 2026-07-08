require 'rails_helper'

RSpec.describe "get/index livros", type: :request do
  subject(:get_livros) do
    get livros_path
  end

  let! (:livro) { create(:livro) }
  let! (:livro2) { create(:livro2) }

    let (:resposta_esperada) do
      [
        {
          'nome' => livro.nome,
          'tipo_literario' => livro.tipo_literario,
          'copias' => livro.copias,
          'autor' => livro.autor
        },
        {
          'nome' => livro2.nome,
          'tipo_literario' => livro2.tipo_literario,
          'copias' => livro2.copias,
          'autor' => livro2.autor
        }
      ]
  end
  let(:resposta_json) { response.parsed_body }

  context "quando quiser listar livros" do
    it "entao retorna a lista de livros" do
      get_livros
      expect(response).to have_http_status(:success)
      expect(resposta_json).to eq(resposta_esperada)
    end
  end
end
