require 'spec_helper'

describe Aluno do
  describe 'numero de matricula' do
    it 'gera sequencial ao salvar' do
      Timecop.freeze(2013, 1, 1, 00, 00, 00) do
        expect(Aluno.create!.matricula).to eql '00001/13'
        expect(Aluno.create!.matricula).to eql '00002/13'
        expect(Aluno.create!.matricula).to eql '00003/13'
        expect(Aluno.create!.matricula).to eql '00004/13'
      end
    end

    it 'gera com ano correto' do
      nova_matricula_ano = -> {
        Aluno.create!.matricula.split('/').last
      }
      Timecop.freeze(2012, 1, 1, 00, 00, 00) do
        expect(nova_matricula_ano.call).to eql '12'
      end
      Timecop.freeze(2013, 1, 1, 00, 00, 00) do
        expect(nova_matricula_ano.call).to eql '13'
      end
    end
  end
end
