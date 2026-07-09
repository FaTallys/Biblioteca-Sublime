require 'rails_helper'

RSpec.describe "patch/put pessoa", type: :request do
  subject(:update_pessoa) do
    patch pessoa_path(pessoa2.id), params: { pessoa: pessoa_nova }
  end

  let(:resposta_esperada) do
    {
      'id' => pessoa2.id,
      'nome' => pessoa_nova[:nome],
      'idade' => pessoa_nova[:idade],
      'email' => pessoa_nova[:email]
    }
    end

  let!(:pessoa) { create(:pessoa) }
  let!(:pessoa2) { create(:pessoa2) }
  let!(:cargo) { create(:cargo) }
  let(:pessoa_nova) do
    {
    nome: "eduardo",
    idade: 17,
    cargo_id: cargo.id,
    email: 'pessoanova@gmail.com',
    password: 'senha123',
    password_confirmation: 'senha123'
    }
  end

  let(:resposta_json) { response.parsed_body }

    before do
      sign_in(pessoa)
    end

  context "quando alterar uma pessoa" do
    it "entao altera a pessoa" do
      update_pessoa

      expect(response).to have_http_status(:success)
      expect(resposta_json).to eq(resposta_esperada)
    end
  end
end
