require 'rails_helper'

RSpec.describe "patch/put pessoa", type: :request do
  subject(:update_pessoa) do
    put pessoa_path(pessoa.id), params: { pessoa: pessoa2.attributes }
  end

    let!(:pessoa) { create(:pessoa) }
    let(:pessoa2) { build(:pessoa2) }

    let(:resposta_esperada) do
      {
        'nome' => pessoa2.nome,
        'idade' => pessoa2.idade,
        'cargo' => pessoa2.cargo
      }
  end
    let(:resposta_json) { response.parsed_body }
  context "quando alterar uma pessoa" do
    it "entao altera a pessoa" do
      update_pessoa
      expect(response).to have_http_status(:success)
      expect(resposta_json).to eq(resposta_esperada)
    end
  end
end
