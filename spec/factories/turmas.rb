# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :turma do
    professor nil
    discipina nil
    nome "MyString"
  end
end
