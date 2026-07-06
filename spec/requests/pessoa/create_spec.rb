require 'rails_helper'

RSpec.describe "create pessoa", type: :request do
  context "quando quiser criar pessoa" do
    it "cria uma pessoa no db" do
    pessoa = attributes_for(:pessoa)

      post pessoas_path, params: { pessoa: pessoa }

      expect(response).to have_http_status(:created)
    end
  end
end
