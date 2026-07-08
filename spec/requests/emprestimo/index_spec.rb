require 'rails_helper'

RSpec.describe "get/index emprestimos", type: :request do
  subject(:get_emprestimos) do
    get emprestimos_path
  end
  let! (:livro) { create(:livro) }
  let! (:pessoa) { create(:pessoa) }
  let! (:livro2) { create(:livro2) }
  let! (:pessoa2) { create(:pessoa2) }
  let!(:emprestimo) { Emprestimo.create(livro: livro, pessoa: pessoa) }
  let!(:emprestimo2) { Emprestimo.create(livro: livro2, pessoa: pessoa2) }

      let (:resposta_esperada) do
      [
        {
          'livro_id' => livro.id,
          'pessoa_id' => pessoa.id
        },
        {
          'livro_id' => livro2.id,
          'pessoa_id' => pessoa2.id
        }
      ]
  end
  let(:resposta_json) { response.parsed_body }
  context "quando quiser listar emprestimos" do
    it "entao retorna a lista dos emprestimos" do
      get_emprestimos
      expect(response).to have_http_status(:success)
      expect(resposta_json).to eq(resposta_esperada)
    end
  end
end
