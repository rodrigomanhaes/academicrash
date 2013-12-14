require 'spec_helper'

describe PlanosDeEstudosHelper do
  it 'gera parametros para a tabela de planos' do
    turma = stub_model(Turma,
      horarios: [
        stub_model(Horario, dia: 3, hora: '14:00'),
        stub_model(Horario, dia: 4, hora: '08:00'),
        stub_model(Horario, dia: 5, hora: '10:00'),
        stub_model(Horario, dia: 6, hora: '16:00')
      ],
      professor: stub_model(Professor, nome: 'Guido'),
      disciplina: stub_model(Disciplina, nome: 'Código Legal')
    )
    expect(helper.turma_data(turma)).to eql({
      conteudo: "Código Legal (Guido)",
      coordenadas: [{ linha: 3, coluna: 3 },
                    { linha: 1, coluna: 4 },
                    { linha: 2, coluna: 5 },
                    { linha: 4, coluna: 6 }]
    }.to_json)
  end
end