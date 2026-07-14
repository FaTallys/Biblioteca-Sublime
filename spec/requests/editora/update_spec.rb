require 'rails_helper'

RSpec.describe "update editora", type: :request do
  subject(:update_editora) do
    patch editora_path(editora.id), params: { editora: editora2.attributes }
  end

  let!(:editora) { create(:editora) }
  let(:editora2) { build(:editora2) }
  let!(:pessoa) { create(:pessoa) }

  let (:resposta_esperada) do {
      'id' => editora.id,
      'nome' => editora2.nome,
      'data_fundacao' => editora2.data_fundacao.to_s
      }
  end

  let(:resposta_json) { response.parsed_body }

  before do
    sign_in(pessoa)
  end

  context "quando quiser atualizar uma editora" do
    it "entao atualiza a editora" do
      update_editora
      expect(response).to have_http_status(:success)
      expect(resposta_json).to eq(resposta_esperada)
    end
  end
end
