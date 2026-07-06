require 'rails_helper'

RSpec.describe "get/show livro", type: :request do
  let! (:livro) { create(:livro) }
  context "quando quiser listar um unico livro" do
    it "entao retorna o livro" do
      get livro_path(livro.id)
      expect(response).to have_http_status(:success)
      expect(response.body).to include(livro.nome)
      expect(response.body).to include(livro.tipo_literario)
      expect(response.body).to include(livro.copias.to_s)
      expect(response.body).to include(livro.autor)
    end
  end
end
