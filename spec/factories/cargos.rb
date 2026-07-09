FactoryBot.define do
  factory :cargo do
    nome { "admin" }

    trait :leitor do
      nome { "leitor" }
    end
  end
end
