require 'rails_helper'

RSpec.describe "get/index livros", type: :request do
  subject(:get_livros) do
    get livros_path
  end

  let!(:livro) { create(:livro) }
  let!(:livro2) { create(:livro2) }
  let!(:pessoa) { create(:pessoa) }

    let (:resposta_esperada) do
      [
        {
          'id' => livro.id,
          'nome' => livro.nome,
          'tipo_literario' => livro.tipo_literario,
          'copias' => livro.copias,
          'autor' => livro.autor,
          'editora' => {
            'id' => livro.editora.id,
            'nome' => livro.editora.nome,
            'data_fundacao' => livro.editora.data_fundacao.to_s
          }
        },
        {
          'id' => livro2.id,
          'nome' => livro2.nome,
          'tipo_literario' => livro2.tipo_literario,
          'copias' => livro2.copias,
          'autor' => livro2.autor,
          'editora' => nil
        }
      ]
  end
  let(:resposta_json) { response.parsed_body }

  before do
    sign_in(pessoa)
  end


  context "quando quiser listar livros" do
    it "entao retorna a lista de livros" do
      get_livros
      expect(response).to have_http_status(:success)
      expect(resposta_json).to match_array(resposta_esperada)
    end
  end
end
