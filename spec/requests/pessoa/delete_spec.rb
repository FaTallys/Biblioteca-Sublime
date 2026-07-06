require 'rails_helper'

RSpec.describe "delete pessoa", type: :request do
  let! (:pessoa) { create(:pessoa) }
  context "quando quiser deletar pessoa" do
    it "entao deleta pessoa" do
      delete pessoa_path(pessoa.id)
      expect(response).to have_http_status(:no_content)
    end
  end
end
