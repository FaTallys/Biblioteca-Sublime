require 'rails_helper'

RSpec.describe "create pessoa", type: :request do
  subject(:create_pessoa) do
    post pessoas_path, params: { pessoa: pessoa_nova }
  end

  let!(:pessoa) { create(:pessoa) }
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

  before do
    sign_in(pessoa)
  end
  context "quando quiser criar pessoa", :aggregate_failures do
    it "cria uma pessoa no db" do
      create_pessoa

      expect(response).to have_http_status(:created)
    end
  end
end
