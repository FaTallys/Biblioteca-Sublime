require 'rails_helper'

RSpec.describe "delete autor", type: :request do
  subject(:delete_autor) do
    delete autor_path(autor.id)
  end

  let!(:autor) { create(:autor) }
  let!(:pessoa) { create(:pessoa) }

  before do
    sign_in(pessoa)
  end

  context "quando quiser deletar um autor" do
    it "entao deleta o autor" do
      delete_autor
      expect(response).to have_http_status(:no_content)
    end
  end
end
