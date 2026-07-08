class AddDeviseFieldsToPessoas < ActiveRecord::Migration[8.1]
  def change
    add_column :pessoas, :encrypted_password, :string, null: false, default: ""
  end
end
