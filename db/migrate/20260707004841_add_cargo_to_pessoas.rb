class AddCargoToPessoas < ActiveRecord::Migration[8.1]
  def change
    add_reference :pessoas, :cargo, null: true, foreign_key: true
  end
end
