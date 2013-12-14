class CreateJoinTableTurmasHorarios < ActiveRecord::Migration
  def change
    create_join_table :turmas, :horarios
  end
end
