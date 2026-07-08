require 'rails_helper'

RSpec.describe "delete emprestimo", type: :request do
  subject(:delete_emprestimo) do
    delete emprestimo_path(emprestimo.id)
  end
  let! (:livro) { create(:livro) }
  let! (:pessoa) { create(:pessoa) }
  let!(:emprestimo) { Emprestimo.create(livro: livro, pessoa: pessoa) }

  context "quando deletar emprestimo" do
    it "entao deleta o emprestimo" do
      emprestimo
      delete_emprestimo
      expect(response).to have_http_status(:no_content)
    end
  end
end
