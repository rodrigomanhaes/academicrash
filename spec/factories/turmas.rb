# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :turma do
    professor
    disciplina
    nome "MyString"
  end
end
