require 'rails_helper'

RSpec.describe "get/show emprestimo", type: :request do
  subject(:emprestimo) { Emprestimo.create(livro: livro, pessoa: pessoa) }
  let! (:livro) { create(:livro) }
  let! (:pessoa) { create(:pessoa) }
  context "quando quiser listar um emprestimo" do
    it "entao retorna o emprestimo" do
      emprestimo
      get emprestimo_path(emprestimo.id)
      expect(response).to have_http_status(:success)
      expect(response.body).to include(emprestimo.livro.nome)
      expect(response.body).to include(emprestimo.pessoa.nome)
    end
  end
end
