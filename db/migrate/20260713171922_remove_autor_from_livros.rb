class RemoveAutorFromLivros < ActiveRecord::Migration[8.1]
  def change
    remove_column :livros, :autor, :string
  end
end
