FactoryBot.define do
    factory :livro do
        nome { "O Doce e O Amargo" }
        copias { 3 }

        trait :sem_copias do
        copias { 0 }
        end
    end
end
