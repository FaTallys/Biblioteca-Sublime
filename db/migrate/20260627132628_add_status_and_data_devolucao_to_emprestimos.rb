class AddStatusAndDataDevolucaoToEmprestimos < ActiveRecord::Migration[8.1]
  def change
    add_column :emprestimos, :status_devolucao, :integer
    add_column :emprestimos, :data_devolucao, :datetime
  end
end
