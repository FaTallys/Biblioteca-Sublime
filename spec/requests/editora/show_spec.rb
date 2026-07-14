require 'rails_helper'

RSpec.describe "get/show editora", type: :request do
  subject(:show_editora) do
    get editora_path(editora.id)
  end

  let!(:editora) { create(:editora) }
  let!(:pessoa) { create(:pessoa) }

  let (:resposta_esperada) do {
    'id' => editora.id,
    'nome' => editora.nome,
    'data_fundacao' => editora.data_fundacao.to_s
  }
  end

  let(:resposta_json) { response.parsed_body }

  before do
    sign_in(pessoa)
  end

  context "quando quiser listar uma editora" do
    it "entao mostra a editora" do
      show_editora
      expect(response).to have_http_status(:success)
      expect(resposta_json).to eq(resposta_esperada)
    end
  end
end
