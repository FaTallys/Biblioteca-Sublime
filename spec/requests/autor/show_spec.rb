require 'rails_helper'

RSpec.describe "get/show autor", type: :request do
  subject(:show_autor) do
    get autor_path(autor.id)
  end

  let!(:autor) { create(:autor) }
  let!(:pessoa) { create(:pessoa) }

  let (:resposta_esperada) do {
    'id' => autor.id,
    'nome' => autor.nome
  }
  end

  let(:resposta_json) { response.parsed_body }

  before do
    sign_in(pessoa)
  end

  context "quando quiser listar um autor" do
    it "entao mostra o autor" do
      show_autor
      expect(response).to have_http_status(:success)
      expect(resposta_json).to eq(resposta_esperada)
    end
  end
end
