class CreateCargos < ActiveRecord::Migration[8.1]
  def change
    create_table :cargos do |t|
      t.string :nome

      t.timestamps
    end
  end
end
