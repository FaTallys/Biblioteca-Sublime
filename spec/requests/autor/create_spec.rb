require 'rails_helper'

RSpec.describe "create autor", type: :request do
  subject(:create_autor) do
    post autors_path, params: { autor: autor }
  end

  let(:autor) do
    attributes_for(:autor).merge(
      livros_attributes: [
        attributes_for(:livro)
        ]
    )
  end
  let!(:pessoa) { create(:pessoa) }

  before do
    sign_in(pessoa)
  end

  context "quando quiser criar um autor e um livor" do
    it "entao cria o autor e o livro" do
      create_autor
      expect(response).to have_http_status(:created)
    end
  end
end
