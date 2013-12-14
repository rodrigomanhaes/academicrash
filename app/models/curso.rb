class Curso < ActiveRecord::Base
  validates :nome, :codigo, :semestres, presence: true
end
