# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :matricula do
    turma nil
    plano_de_estudos nil
    nota 1.5
    faltas 1
  end
end
