require 'rails_helper'

RSpec.describe "get/show emprestimo", type: :request do
  subject(:emprestimo) { Emprestimo.create(livro: livro, pessoa: pessoa) }
  let! (:livro) { create(:livro) }
  let! (:pessoa) { create(:pessoa) }
  context "quando deletar emprestimo" do
    it "entao deleta o emprestimo" do
      emprestimo
      delete emprestimo_path(emprestimo.id)
      expect(response).to have_http_status(:no_content)
    end
  end
end
