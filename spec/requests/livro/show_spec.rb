require 'rails_helper'

RSpec.describe "get/show livro", type: :request do
  subject(:get_livro) do
   get livro_path(livro.id)
  end

  let! (:livro) { create(:livro) }
  let (:resposta_esperada) do {
    'nome'=> livro.nome,
    'tipo_literario' => livro.tipo_literario,
    'copias' => livro.copias,
    'autor' => livro.autor
    }
  end
  let(:resposta_json) { response.parsed_body }

  context "quando quiser listar um unico livro" do
    it "entao retorna o livro" do
      get_livro
      expect(response).to have_http_status(:success)
      expect(resposta_json).to eq(resposta_esperada)
    end
  end
end
