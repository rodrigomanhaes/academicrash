require 'spec_helper'

feature 'matricular aluno no curso' do
  scenario 'matrícula com sucesso' do
    create(:curso, nome: 'Culinária Ucraniana')
    visit new_aluno_path
    fill_in 'Nome', with: 'Yukihiro'
    select 'Culinária Ucraniana', from: 'Curso'
    click_button 'Salvar'

    expect(page).to have_content 'Nome: Yukihiro'
    expect(page).to have_content 'Matrícula: 00001/13'
    expect(page).to have_content 'Curso: Culinária Ucraniana'
  end
end