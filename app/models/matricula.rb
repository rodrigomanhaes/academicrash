class Matricula < ActiveRecord::Base
  belongs_to :turma
  belongs_to :plano_de_estudos
end
