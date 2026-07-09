require 'rails_helper'

RSpec.describe "get/index pessoas", type: :request do
  subject(:get_pessoas) do
    get pessoas_path
  end

  let(:resposta_esperada) do
    [
        {
          'id' => pessoa2.id,
          'nome' => pessoa2.nome,
          'idade' => pessoa2.idade,
          'email' => pessoa2.email
        },
        {
          'id' => pessoa.id,
          'nome' => pessoa.nome,
          'idade' => pessoa.idade,
          'email' => pessoa.email
        }
      ]
  end
  let!(:pessoa) { create(:pessoa) }
  let!(:pessoa2) { create(:pessoa2) }
  let(:resposta_json) { response.parsed_body }

  before do
    sign_in(pessoa)
  end

  context "quando quiser listar pessoas" do
    it "entao retorna a lista de pessoas" do
      get_pessoas
      expect(response).to have_http_status(:success)
      expect(resposta_json).to match_array(resposta_esperada)
    end
  end
end
