FactoryBot.define do
  factory :cargo do
    nome { "admin" }
  end

  trait :leitor do
    nome { "leitor" }
  end
end
