require 'rails_helper'

RSpec.describe "create livro", type: :request do
  context "quando quiser criar livro" do
    it "entao cria o livro no db" do
      livro = attributes_for(:livro)
      post livros_path, params: { livro: livro }

      expect(response).to have_http_status(:created)
    end
  end
end
