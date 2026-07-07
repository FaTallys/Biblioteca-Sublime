require 'rails_helper'

RSpec.describe "get/index emprestimos", type: :request do
  subject(:emprestimo) { Emprestimo.create(livro: livro, pessoa: pessoa) }
  let! (:livro) { create(:livro) }
  let! (:pessoa) { create(:pessoa) }
  context "quando quiser listar emprestimos" do
    it "entao retorna a lista dos emprestimos" do
      emprestimo
      get emprestimos_path
      expect(response).to have_http_status(:success)
      expect(response.body).to include(emprestimo.livro.nome)
      expect(response.body).to include(emprestimo.pessoa.nome)
    end
  end
end
