class ChangeStatusDefaultInEmprestimos < ActiveRecord::Migration[8.1]
  def change
    change_column_default :emprestimos, :status_devolucao, from: nil, to: 0
  end
end
