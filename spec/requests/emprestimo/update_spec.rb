require 'rails_helper'

RSpec.describe "patch/put emprestimo", type: :request do
  subject(:emprestimo) { Emprestimo.create(livro: livro, pessoa: pessoa) }
  let! (:livro) { create(:livro) }
  let! (:pessoa) { create(:pessoa) }

  let! (:livro_diferente) { create(:livro2) }
  let! (:pessoa_diferente) { create(:pessoa2) }
  context "quando quiser alterar um emprestimo" do
    it "entao altera o emprestimo" do
      novo_emprestimo = {
        livro_id: livro_diferente.id,
        pessoa_id: pessoa_diferente.id
      }
      emprestimo
      patch emprestimo_path(emprestimo.id), params: { emprestimo: novo_emprestimo }
      expect(response).to have_http_status(:success)
      expect(response.body).to include(livro_diferente.id.to_s)
      expect(response.body).to include(pessoa_diferente.id.to_s)
    end
  end
end
