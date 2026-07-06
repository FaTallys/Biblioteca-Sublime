require 'rails_helper'

RSpec.describe "create emprestimo", type: :request do
  let! (:pessoa) { create(:pessoa) }
  let! (:livro) { create(:livro) }
  context "quando quiser criar emprestimo" do
    it "entao cria o emprestimo" do
      dados_emprestimo = {
      livro_id: livro.id,
      pessoa_id: pessoa.id }
      post emprestimos_path, params: { emprestimo: dados_emprestimo }

      expect(response).to have_http_status(:created)
    end
  end
end
