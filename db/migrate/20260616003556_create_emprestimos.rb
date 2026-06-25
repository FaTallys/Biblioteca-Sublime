class CreateEmprestimos < ActiveRecord::Migration[8.1]
  def change
    create_table :emprestimos do |t|
     
      t.timestamps
    end
  end
end
