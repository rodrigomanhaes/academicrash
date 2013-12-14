require 'spec_helper'

feature 'Montar plano de estudo' do
  before :each do
    create(:turma, nome: 'A',
      disciplina: create(:disciplina, nome: 'Cálculo'),
      professor: create(:professor, nome: 'Zé'),
      horarios: [create(:horario, dia: 3, hora: '10:00')])
    create(:turma, nome: 'B',
      disciplina: create(:disciplina, nome: 'Programação II'),
      professor: create(:professor, nome: 'Jão'),
      horarios: [create(:horario, dia: 4, hora: '08:00')])
    create(:turma, nome: 'C',
      disciplina: create(:disciplina, nome: 'Álgebra Linear'),
      professor: create(:professor, nome: 'Manel'),
      horarios: [create(:horario, dia: 5, hora: '16:00'),
                 create(:horario, dia: 4, hora: '14:00')])
  end

  let(:aluno) { create(:aluno, nome: 'Zezin') }

  scenario 'com sucesso' do
    visit new_aluno_plano_de_estudos_path(aluno)
    fill_in 'Período', with: '2014/01'
    check 'A (Cálculo, prof. Zé, Terça, 10:00)'
    check 'B (Programação II, prof. Jão, Quarta, 08:00)'
    click_button 'Salvar'

    expect(page).to have_content 'Plano de estudos'
    expect(page).to have_content 'Aluno: Zezin'
    expect(page).to have_content 'Período: 2014/01'
    expect(page).to have_content 'A (Cálculo, prof. Zé, Terça, 10:00)'
    expect(page).to have_content 'B (Programação II, prof. Jão, Quarta, 08:00)'
  end

  scenario 'monta tabela enquanto seleciona', js: true do
    visit new_aluno_plano_de_estudos_path(aluno)
    check 'A (Cálculo, prof. Zé, Terça, 10:00)'
    turma_a = 'Cálculo (Zé)'
    turma_c = 'Álgebra Linear (Manel)'
    expect(page).to include_table '#plano',
       ['',     'Seg', 'Ter',  'Qua', 'Qui', 'Sex' ],
      [['08:00', '',   '',      '',   '',     ''   ],
       ['10:00', '',   turma_a, '',   '',     ''   ],
       ['14:00', '',   '',      '',   '',     ''   ],
       ['16:00', '',   '',      '',   '',     ''   ]]
    check 'C (Álgebra Linear, prof. Manel'
    expect(page).to include_table '#plano',
       ['',     'Seg', 'Ter',  'Qua',   'Qui',   'Sex' ],
      [['08:00', '',   '',      '',      '',      ''   ],
       ['10:00', '',   turma_a, '',      '',      ''   ],
       ['14:00', '',   '',      turma_c, '',      ''   ],
       ['16:00', '',   '',      '',      turma_c, ''   ]]
    uncheck 'A (Cálculo, prof. Zé, Terça, 10:00)'
    expect(page).to include_table '#plano',
       ['',     'Seg', 'Ter',  'Qua',   'Qui',   'Sex' ],
      [['08:00', '',   '',      '',      '',      ''   ],
       ['10:00', '',   '',      '',      '',      ''   ],
       ['14:00', '',   '',      turma_c, '',      ''   ],
       ['16:00', '',   '',      '',      turma_c, ''   ]]
  end
end