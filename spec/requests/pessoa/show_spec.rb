require 'rails_helper'

RSpec.describe "get/show pessoa", type: :request do
  subject(:get_pessoa) do
    get pessoa_path(pessoa2.id)
  end

    let(:resposta_esperada) do
      {
        'id' => pessoa2.id,
        'nome' => pessoa2.nome,
        'idade' => pessoa2.idade,
        'email' => pessoa2.email
      }
  end
    let(:resposta_json) { response.parsed_body }
    let!(:pessoa) { create(:pessoa) }
    let!(:pessoa2) { create(:pessoa2) }

    before do
      sign_in(pessoa)
    end

  context "quando quiser mostrar apenas uma pessoa" do
    it "entao mostra a pessoa" do
      get_pessoa

      expect(response).to have_http_status(:success)
      expect(resposta_json).to eq(resposta_esperada)
    end
  end
end
