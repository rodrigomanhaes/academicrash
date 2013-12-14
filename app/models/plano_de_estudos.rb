class PlanoDeEstudos < ActiveRecord::Base
  belongs_to :aluno
  has_many :matriculas
  has_many :turmas, through: :matriculas
  accepts_nested_attributes_for :matriculas
end
