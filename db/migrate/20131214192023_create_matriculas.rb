class CreateMatriculas < ActiveRecord::Migration
  def change
    create_table :matriculas do |t|
      t.references :turma, index: true
      t.references :plano_de_estudos, index: true
      t.float :nota
      t.integer :faltas

      t.timestamps
    end
  end
end
