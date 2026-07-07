require 'rails_helper'

RSpec.describe "patch/put pessoa", type: :request do
  context "quando alterar uma pessoa" do
    let! (:pessoa) { create(:pessoa) }
    it "entao altera a pessoa" do
      novas_informacoes = {
        nome: "carlos",
        idade: 17
      }
      patch pessoa_path(pessoa.id), params: { pessoa: novas_informacoes }

      expect(response).to have_http_status(:success)
      expect(response.body).to include("carlos")
      expect(response.body).to include("17")
    end
  end
end
