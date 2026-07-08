require 'rails_helper'

RSpec.describe "get/index pessoas", type: :request do
  subject(:get_pessoas) do
    get pessoas_path
  end

  let(:resposta_esperada) do
    [
      {
        'nome' => pessoa.nome,
        'idade' => pessoa.idade,
        'cargo' => pessoa.cargo
      }
    ]
  end
    let(:resposta_json) { response.parsed_body }
  let! (:pessoa) { create(:pessoa) }
  context "quando quiser listar pessoas" do
    it "entao retorna a lista de pessoas" do
      get_pessoas
      expect(response).to have_http_status(:success)
      expect(resposta_json).to eq(resposta_esperada)
    end
  end
end
