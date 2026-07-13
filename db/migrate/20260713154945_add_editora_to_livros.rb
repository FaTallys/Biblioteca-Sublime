class AddEditoraToLivros < ActiveRecord::Migration[8.1]
  def change
    add_reference :livros, :editora, null: true, foreign_key: true
  end
end
