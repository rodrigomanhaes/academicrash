require 'spec_helper'

feature 'Montar plano de estudo' do
  scenario 'com sucesso' do
    create(:turma, nome: 'A',
      disciplina: create(:disciplina, nome: 'Cálculo'),
      professor: create(:professor, nome: 'Zé'),
      horarios: [create(:horario, dia: 3, hora: '10:00')])
    create(:turma, nome: 'B',
      disciplina: create(:disciplina, nome: 'Programação II'),
      professor: create(:professor, nome: 'Jão'),
      horarios: [create(:horario, dia: 4, hora: '08:00')])
    create(:turma, nome: 'C')

    visit new_aluno_plano_de_estudos_path(create(:aluno, nome: 'Zezin'))
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
end