require 'rails_helper'

RSpec.describe "get/show emprestimo", type: :request do
  subject(:get_emprestimo) do
    get emprestimo_path(emprestimo.id)
  end
  let! (:livro) { create(:livro) }
  let! (:pessoa) { create(:pessoa) }
  let!(:emprestimo) { Emprestimo.create(livro: livro, pessoa: pessoa) }

  let(:resposta_esperada) do
    {
      'livro_id' => livro.id,
      'pessoa_id' => pessoa.id
    }
  end

  let(:resposta_json) { response.parsed_body }

  context "quando quiser listar um emprestimo" do
    it "entao retorna o emprestimo" do
      get_emprestimo
      expect(response).to have_http_status(:success)
      expect(resposta_json).to eq(resposta_esperada)
    end
  end
end
