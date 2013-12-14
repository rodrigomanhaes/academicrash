class CreateDisciplinas < ActiveRecord::Migration
  def change
    create_table :disciplinas do |t|
      t.string :nome
      t.string :codigo
      t.references :curso, index: true

      t.timestamps
    end
  end
end
