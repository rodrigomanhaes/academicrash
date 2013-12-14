class Aluno < ActiveRecord::Base
  belongs_to :curso

  before_create :gerar_matricula

  private

  def gerar_matricula
    ultimo_aluno = Aluno.order(:matricula).last
    matr = ultimo_aluno.nil? ?  '00000/00' :
      ultimo_aluno.matricula
    ultimo_numero = matr.split('/').first.to_i
    self.matricula = "%s/%s" % [
      (ultimo_numero + 1).to_s.rjust(5, '0'),
      Date.current.year - 2000]
  end
end
