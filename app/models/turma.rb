class Turma < ActiveRecord::Base
  belongs_to :professor
  belongs_to :disciplina
  has_and_belongs_to_many :horarios
end
