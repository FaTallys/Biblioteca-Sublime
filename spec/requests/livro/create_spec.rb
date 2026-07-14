require 'rails_helper'

RSpec.describe "create livro", type: :request do
  subject(:create_livro) do
  post livros_path, params: { livro: livro }
  end

  let(:livro) { attributes_for(:livro) }
  let!(:pessoa) { create(:pessoa) }

  before do
    sign_in(pessoa)
  end

  context "quando quiser criar livro", :aggreate_failures do
    it "entao cria o livro no db" do
      create_livro
      expect(response).to have_http_status(:created)
    end
  end
end
