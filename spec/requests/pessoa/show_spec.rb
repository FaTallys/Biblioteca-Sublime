require 'rails_helper'

RSpec.describe "show pessoa", type: :request do
  context "quando quiser mostrar apenas uma pessoa" do
    let! (:pessoa) { create(:pessoa) }
    it "entao mostra a pessoa" do
      get pessoa_path(pessoa.id)

      expect(response).to have_http_status(:success)
      expect(response.body).to include(pessoa.nome)
      expect(response.body).to include(pessoa.idade.to_s)
    end
  end
end
