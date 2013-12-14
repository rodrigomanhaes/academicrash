class CreateTurmas < ActiveRecord::Migration
  def change
    create_table :turmas do |t|
      t.references :professor, index: true
      t.references :disciplina, index: true
      t.string :nome

      t.timestamps
    end
  end
end
