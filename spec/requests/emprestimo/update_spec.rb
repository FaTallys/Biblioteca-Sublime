require 'rails_helper'

RSpec.describe "patch/put emprestimo", type: :request do
  subject(:update_emprestimo) do
    patch emprestimo_path(emprestimo.id), params: {
      emprestimo: {
         livro_id: livro2.id,
          pessoa_id: pessoa2.id
        }
      }
  end

  let! (:livro) { create(:livro) }
  let! (:pessoa) { create(:pessoa) }
  let! (:livro2) { create(:livro2) }
  let! (:pessoa2) { create(:pessoa2) }
  let!(:emprestimo) { Emprestimo.create(livro: livro, pessoa: pessoa) }

  let(:resposta_esperada) do
    {
      'id' => emprestimo.id,
      'livro' => hash_including('id' => livro2.id),
      'pessoa' => hash_including('id' => livro2.id)
    }
  end
  let(:resposta_json) { response.parsed_body }
  before do
    sign_in(pessoa)
  end

  context "quando quiser alterar um emprestimo" do
    it "entao altera o emprestimo" do
      update_emprestimo
      expect(response).to have_http_status(:success)
      expect(resposta_json).to match(hash_including(resposta_esperada))
    end
  end
end
