require 'spec_helper'

describe Turma do
  it '#to_s' do
    turma = Turma.new(nome: 'A',
      disciplina: stub_model(Disciplina, nome: 'Cálculo'),
      professor: stub_model(Professor, nome: 'Zé'),
      horarios: [stub_model(Horario, dia: 3, hora: '10:00')])
    expect(turma.to_s).to eql \
      'A (Cálculo, prof. Zé, Terça, 10:00)'
  end
end
