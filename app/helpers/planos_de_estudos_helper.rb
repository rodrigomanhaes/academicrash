module PlanosDeEstudosHelper
  def turma_data(turma)
    {
      conteudo: conteudo(turma),
      coordenadas: coordenadas(turma)
    }.to_json
  end

  private

  LINHA_HORA = {
    '08:00' => 1,
    '10:00' => 2,
    '14:00' => 3,
    '16:00' => 4
  }

  def coordenadas(turma)
    turma.horarios.map do |h|
      { coluna: h.dia, linha: LINHA_HORA[h.hora] }
    end
  end

  def conteudo(turma)
    '%s (%s)' % [turma.disciplina.nome, turma.professor.nome]
  end
end