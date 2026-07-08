require 'rails_helper'

RSpec.describe "get/show pessoa", type: :request do
  subject(:get_pessoa) do
    get pessoa_path(pessoa.id)
  end

  let!(:pessoa) { create(:pessoa) }
    let(:resposta_esperada) do
      {
        'nome' => pessoa.nome,
        'idade' => pessoa.idade,
        'cargo' => pessoa.cargo
      }
  end
    let(:resposta_json) { response.parsed_body }

  context "quando quiser mostrar apenas uma pessoa" do
    it "entao mostra a pessoa" do
      get_pessoa

      expect(response).to have_http_status(:success)
      expect(resposta_json).to eq(resposta_esperada)
    end
  end
end
