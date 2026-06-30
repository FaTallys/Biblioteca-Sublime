# require 'rails_helper'
#
#
# RSpec.describe Pessoa, type: :model do
#  it "encontra o livro pelo id" do
#    livro = create(:livro)
#    pessoa = create(:pessoa)
#
#    resultado = pessoa.nome_ou_id(livro.id)
#    expect(resultado).to eq(livro)
#  end
#
#  it "livro existe" do
#    livro = Livro.create(nome: "O Doce e O Amargo", copias: 3)
#    pessoa = Pessoa.create(nome: "teste", idade: 20)
#    expect(pessoa.livro_existe?(livro)).to eq(true)
#  end
# end
