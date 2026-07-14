require 'rails_helper'

RSpec.describe "create editora", type: :request do
  subject(:create_editora) do
    post editoras_path, params: { editora: editora }
  end

  let(:editora) { attributes_for(:editora) }
  let!(:pessoa) { create(:pessoa) }

  before do
    sign_in(pessoa)
  end

  context "quando quiser criar uma editora" do
    it "entao cria a editora" do
      create_editora
      expect(response).to have_http_status(:created)
    end
  end
end
