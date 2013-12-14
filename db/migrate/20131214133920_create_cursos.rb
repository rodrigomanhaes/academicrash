class CreateCursos < ActiveRecord::Migration
  def change
    create_table :cursos do |t|
      t.string :nome
      t.string :codigo
      t.integer :semestres

      t.timestamps
    end
  end
end
