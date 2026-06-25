class AddPessoaAndLivroToEmprestimo < ActiveRecord::Migration[8.1]
  def change
    add_reference :emprestimos, :pessoa, null: false, foreign_key: true
    add_reference :emprestimos, :livro, null: false, foreign_key: true
  end
end
