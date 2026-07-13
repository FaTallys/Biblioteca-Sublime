class AddNomeAndDataFundacaoToEditoras < ActiveRecord::Migration[8.1]
  def change
    add_column :editoras, :nome, :string
    add_column :editoras, :data_fundacao, :date
  end
end
