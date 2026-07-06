require 'rails_helper'

RSpec.describe "get/index", type: :request do
  let! (:livro) { create(:livro) }
  context "quando quiser listar livros" do
    it "entao retorna a lista de livros" do
      get livros_path
      expect(response).to have_http_status(:success)
      expect(response.body).to include(livro.nome)
      expect(response.body).to include(livro.tipo_literario)
      expect(response.body).to include(livro.copias.to_s)
      expect(response.body).to include(livro.autor)
    end
  end
end
