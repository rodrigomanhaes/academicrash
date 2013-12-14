class CreateHorarios < ActiveRecord::Migration
  def change
    create_table :horarios do |t|
      t.integer :dia
      t.string :hora

      t.timestamps
    end
  end
end
