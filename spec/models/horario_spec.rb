require 'spec_helper'

describe Horario do
  it '#to_s' do
    expect(Horario.new(dia: 2, hora: '10:30').to_s).to \
      eql 'Segunda, 10:30'
  end
end
