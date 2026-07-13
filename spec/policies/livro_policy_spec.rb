require 'rails_helper'

RSpec.describe LivroPolicy, type: :policy do
  let(:livro) { create(:livro) }
  let(:livro2) { create(:livro2) }

  let(:admin) { create(:pessoa) }
  let(:bibliotecario) { create(:pessoa3) }
  let(:leitor) { create(:pessoa2) }

  subject { described_class }

  permissions :index?, :show? do
    it "permite que qualquer usuário veja os livros" do
      expect(subject).to permit(admin, livro)
      expect(subject).to permit(leitor, livro)
      expect(subject).to permit(bibliotecario, livro)
    end
  end

  permissions :create?, :new?, :update?, :edit? do
    it "permite o acesso para administrador e bibliotecario" do
      expect(subject).to permit(admin, livro)
      expect(subject).to permit(bibliotecario, livro)
    end

    it "nega o acesso para leitor" do
      expect(subject).not_to permit(leitor, livro)
    end
  end

  permissions :destroy? do
    it "permite que apenas o administrador e bibliotecaro delete um livro" do
      expect(subject).to permit(admin, livro)
      expect(subject).to permit(bibliotecario, livro2)
    end

    it "nega a exclusão para leitor" do
      expect(subject).not_to permit(leitor, livro)
    end
  end
end
