FactoryBot.define do
    factory :pessoa do
        nome { "jose" }
        idade { 20 }
        association :cargo, factory: :cargo, nome: "admin"

        factory :pessoa2 do
            nome { "miguel" }
            idade { 17 }
            association :cargo, factory: :cargo, nome: "leitor"
        end
    end
end
