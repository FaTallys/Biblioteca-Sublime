require 'rails_helper'

RSpec.describe Emprestimos::DevolverEmprestimo do
  subject(:devolver_emprestimo) { described_class.new(emprestimo.id).call }

  let!(:emprestimo) { create(:emprestimo) }
  let(:livro) { emprestimo.livro }

  context "quando quiser devolver o emprestimo" do
    it "entao devolve o emprestimo" do
      expect { devolver_emprestimo }.to change(Emprestimo, :count).by(-1)
      .and change { livro.reload.copias }.by(1)
    end
  end
end
