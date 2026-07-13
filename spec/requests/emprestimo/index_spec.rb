require 'rails_helper'

RSpec.describe "get/index emprestimos", type: :request do
  subject(:get_emprestimos) do
    get emprestimos_path
  end
  let!(:livro) { create(:livro) }
  let!(:livro2) { create(:livro2) }
  let!(:pessoa) { create(:pessoa) }
  let!(:pessoa2) { create(:pessoa2) }
  let!(:pessoa3) { create(:pessoa4) }
  let!(:emprestimo) { create(:emprestimo, livro: livro, pessoa: pessoa3, status_devolucao: :ativo) }
  let!(:emprestimo2) { create(:emprestimo, livro: livro2, pessoa: pessoa2, status_devolucao: :ativo) }

    let(:resposta_esperada) do
      lista_emprestimos = [ emprestimo, emprestimo2 ]
      JSON.parse(EmprestimoBlueprint.render(lista_emprestimos, view: :normal))
  end

  let(:resposta_json) { response.parsed_body }

  before do
    sign_in(pessoa)
  end

  context "quando quiser listar emprestimos" do
    it "entao retorna a lista dos emprestimos" do
      get_emprestimos
      expect(response).to have_http_status(:success)
      expect(resposta_json).to match_array(resposta_esperada)
    end
  end
end
