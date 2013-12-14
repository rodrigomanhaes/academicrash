class CreatePlanosDeEstudos < ActiveRecord::Migration
  def change
    create_table :planos_de_estudos do |t|
      t.string :periodo
      t.references :aluno, index: true

      t.timestamps
    end
  end
end
