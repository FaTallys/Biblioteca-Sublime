require 'rails_helper'

RSpec.describe "get/show livro", type: :request do
  let! (:livro) { create(:livro) }
  context "quando quiser deletar um livro" do
    it "entao deleta o livro" do
      delete livro_path(livro.id)
      expect(response).to have_http_status(:no_content)
    end
  end
end
