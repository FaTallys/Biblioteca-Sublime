class CreatePessoas < ActiveRecord::Migration[8.1]
  def change
    create_table :pessoas do |t|
      t.string :nome
      t.integer :idade
      t.string :livroPego

      t.timestamps
    end
  end
end
