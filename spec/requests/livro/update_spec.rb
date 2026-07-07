require 'rails_helper'

RSpec.describe "patch/put livro", type: :request do
  let! (:livro) { create(:livro) }
  context "quando quiser alterar um livro" do
    it "entao altera o livro" do
      novas_informacoes = {
        nome: "dom quixote",
        tipo_literario: "aventura",
        copias: 6,
        autor: "Miguel de Cervantes"
      }

      patch livro_path(livro.id), params: { livro: novas_informacoes }

      expect(response).to have_http_status(:success)
      expect(response.body).to include("dom quixote")
      expect(response.body).to include("aventura")
      expect(response.body).to include("6")
      expect(response.body).to include("Miguel de Cervantes")
    end
  end
end
