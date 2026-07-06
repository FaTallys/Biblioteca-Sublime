FactoryBot.define do
    factory :pessoa do
        nome { "jose" }
        idade { 20 }

        factory :pessoa2 do
            nome { "miguel" }
            idade { 17 }
        end
    end
end
