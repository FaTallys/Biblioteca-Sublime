class AddAutorToLivros < ActiveRecord::Migration[8.1]
  def change
    add_reference :livros, :autor, null: true, foreign_key: true
  end
end
