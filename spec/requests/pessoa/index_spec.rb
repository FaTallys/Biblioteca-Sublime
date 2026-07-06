require 'rails_helper'

RSpec.describe "get/index", type: :request do
  let! (:pessoa) { create(:pessoa) }
  context "quando quiser listar pessoas" do
    it "entao retorna a lista de pessoas" do
      get pessoas_path
      expect(response).to have_http_status(:success)
      expect(response.body).to include(pessoa.nome)
      expect(response.body).to include(pessoa.idade.to_s)
    end
  end
end
