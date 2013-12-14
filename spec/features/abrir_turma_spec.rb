require 'spec_helper'

feature 'abrir turma' do
  scenario 'turma aberta' do
    create(:professor, nome: 'Astolfinho')
    create(:disciplina, nome: 'Gastronomia do Mediterrâneo')
    create(:horario, dia: 2, hora: '10:00')
    create(:horario, dia: 3, hora: '08:00')
    create(:horario, dia: 4, hora: '16:00')
    create(:horario, dia: 5, hora: '10:00')
    create(:horario, dia: 5, hora: '16:00')

    visit new_turma_path
    fill_in 'Nome', with: 'A'
    select 'Astolfinho', from: 'Professor'
    select 'Gastronomia do Mediterrâneo', from: 'Disciplina'
    check 'Quarta, 16:00'
    check 'Quinta, 10:00'
    click_button 'Salvar'

    expect(page).to have_content 'Nome: A'
    expect(page).to have_content 'Professor: Astolfinho'
    expect(page).to have_content 'Disciplina: Gastronomia do Mediterrâneo'
    expect(page).to have_content \
      'Horários: Quarta, 16:00 e Quinta, 10:00'
  end
end