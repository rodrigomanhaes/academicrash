class Turma < ActiveRecord::Base
  belongs_to :professor
  belongs_to :disciplina
  has_and_belongs_to_many :horarios

  def to_s
    '%s (%s, prof. %s, %s)' % [
      nome, disciplina.nome, professor.nome,
      horarios.map(&:to_s).to_sentence]
  end
end
