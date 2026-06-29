class AddTipoLiterarioToLivros < ActiveRecord::Migration[8.1]
  def change
    add_column :livros, :tipo_literario, :string
  end
end
