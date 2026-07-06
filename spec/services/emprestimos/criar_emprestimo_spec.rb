require 'rails_helper'

RSpec.describe Emprestimos::CriarEmprestimo do
  subject(:criar_emprestimo) { described_class.new(livro.id, pessoa.id).call }

  let! (:livro) { create(:livro) }
  let! (:pessoa) { create(:pessoa) }

  context "quando quiser criar um emprestimo" do
    it "entao cria o emprestimo" do
      expect { criar_emprestimo }.to change(Emprestimo, :count).by(1)
    end
  end
end
