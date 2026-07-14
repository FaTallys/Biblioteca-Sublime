require 'rails_helper'

RSpec.describe "get/index autors", type: :request do
  subject(:index_autors) do
    get autors_path
  end

  let!(:autor) { create(:autor) }
  let!(:autor2) { create(:autor2) }
  let!(:pessoa) { create(:pessoa) }

  let (:resposta_esperada) do
    [
      {

      'id' => autor.id,
      'nome' => autor.nome
      },
      {
        'id' => autor2.id,
        'nome' => autor2.nome
      }
    ]
  end

  let(:resposta_json) { response.parsed_body }

  before do
    sign_in(pessoa)
  end

  context "quando quiser listar os autores" do
    it "entao lista os autores" do
      index_autors
      expect(response).to have_http_status(:success)
      expect(resposta_json).to eq(resposta_esperada)
    end
  end
end
