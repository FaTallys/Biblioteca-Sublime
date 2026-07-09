require 'rails_helper'

RSpec.describe "patch/put livro", type: :request do
  subject(:patch_livro) do
   patch livro_path(livro.id), params: { livro: livro2.attributes }
  end

  let!(:livro) { create(:livro) }
  let(:livro2) { build(:livro2) }
  let!(:pessoa) { create(:pessoa) }

  let (:resposta_esperada) do {
    'id' => livro.id,
    'nome'=> livro2.nome,
    'tipo_literario' => livro2.tipo_literario,
    'copias' => livro2.copias,
    'autor' => livro2.autor
    }
  end
  let (:resposta_json) { response.parsed_body }

  before do
    sign_in(pessoa)
  end

  context "quando quiser alterar um livro" do
    it "entao altera o livro" do
      patch_livro

      expect(response).to have_http_status(:success)
      expect(resposta_json).to eq(resposta_esperada)
    end
  end
end
