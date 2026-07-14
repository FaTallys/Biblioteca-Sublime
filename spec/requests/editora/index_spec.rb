require 'rails_helper'

RSpec.describe "get/index editora", type: :request do
  subject(:index_editora) do
    get editoras_path
  end

  let!(:editora) { create(:editora) }
  let!(:editora2) { create(:editora2) }
  let!(:pessoa) { create(:pessoa) }

  let (:resposta_esperada) do
    [
      {

      'id' => editora.id,
      'nome' => editora.nome,
      'data_fundacao' => editora.data_fundacao.to_s
      },
      {
        'id' => editora2.id,
        'nome' => editora2.nome,
        'data_fundacao' => editora2.data_fundacao.to_s
      }
    ]
  end

  let(:resposta_json) { response.parsed_body }

  before do
    sign_in(pessoa)
  end

  context "quando quiser listar as editora" do
    it "entao lista as editora" do
      index_editora
      expect(response).to have_http_status(:success)
      expect(resposta_json).to eq(resposta_esperada)
    end
  end
end
