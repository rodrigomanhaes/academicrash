# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :curso do
    nome 'Agricultura Celeste'
    codigo 'AGC-1234'
    semestres 11
  end
end
