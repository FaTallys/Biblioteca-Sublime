require 'rails_helper'

RSpec.describe "get/show editora", type: :request do
  subject(:delete_editora) do
    delete editora_path(editora.id)
  end

  let!(:editora) { create(:editora) }
  let!(:pessoa) { create(:pessoa) }

  before do
    sign_in(pessoa)
  end

  context "quando quiser deletar um editora" do
    it "entao deleta o editora" do
      delete_editora
      expect(response).to have_http_status(:no_content)
    end
  end
end
