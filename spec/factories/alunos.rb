# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :aluno do
    nome "MyString"
    matricula "MyString"
    curso nil
  end
end
