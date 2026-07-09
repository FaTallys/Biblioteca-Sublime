require 'rails_helper'

RSpec.describe "get/show livro", type: :request do
  subject(:delete_livro) do
    delete livro_path(livro.id)
  end

  let!(:livro) { create(:livro) }
  let!(:pessoa) { create(:pessoa) }

  before do
    sign_in(pessoa)
  end

  context "quando quiser deletar um livro" do
    it "entao deleta o livro" do
      delete_livro
      expect(response).to have_http_status(:no_content)
    end
  end
end
