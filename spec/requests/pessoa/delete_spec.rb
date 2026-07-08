require 'rails_helper'

RSpec.describe "delete pessoa", type: :request do
  subject(:delete_pessoa) do
    delete pessoa_path(pessoa.id)
  end

  let! (:pessoa) { create(:pessoa) }
  context "quando quiser deletar pessoa" do
    it "entao deleta pessoa" do
      delete_pessoa
      expect(response).to have_http_status(:no_content)
    end
  end
end
