require 'rails_helper'

RSpec.describe "get/show livro", type: :request do
  subject(:get_livro) do
   get livro_path(livro.id)
  end

  let!(:livro) { create(:livro) }
  let!(:pessoa) { create(:pessoa) }

  let (:resposta_esperada) do {
    'id' => livro.id,
    'nome'=> livro.nome,
    'tipo_literario' => livro.tipo_literario,
    'copias' => livro.copias,
    'emprestimos' => [],
    'pessoas' => [],
    'editora' => {
      'id' => livro.editora.id,
      'nome' => livro.editora.nome,
      'data_fundacao' => livro.editora.data_fundacao.to_s
      },
      'autor' => {
        'id' => livro.autor.id,
        'nome' => livro.autor.nome
      }

    }
  end
  let(:resposta_json) { response.parsed_body }

  before do
    sign_in(pessoa)
  end

  context "quando quiser listar um unico livro" do
    it "entao retorna o livro" do
      get_livro
      expect(response).to have_http_status(:success)
      expect(resposta_json).to eq(resposta_esperada)
    end
  end
end
