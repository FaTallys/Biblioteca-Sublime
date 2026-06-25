require 'rails_helper'

RSpec.describe Emprestimos::CriarEmprestimo do
    it "consegue criar emprestimo" do
      pessoa = create(:pessoa)
      livro = create(:livro)
      emprestimo = create(emprestimo)

      service = described_class.new(livro.id, pessoa.id)

      expect { service.call }.to change { Emprestimo.count }.by(1)
    end
end
