class CreateLivros < ActiveRecord::Migration[8.1]
  def change
    create_table :livros do |t|
      t.string :autor
      t.string :nome
      t.integer :copias

      t.timestamps
    end
  end
end
