require 'rails_helper'

RSpec.describe "create pessoa", type: :request do
  subject(:create_pessoa) do
    post pessoas_path, params: { pessoa: pessoa }
  end

  let(:pessoa) { attributes_for(:pessoa) }
  context "quando quiser criar pessoa" do
    it "cria uma pessoa no db" do
      create_pessoa
      expect(response).to have_http_status(:created)
    end
  end
end
