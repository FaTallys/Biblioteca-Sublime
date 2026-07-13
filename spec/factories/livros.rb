FactoryBot.define do
    factory :livro do
        nome { "O Doce e O Amargo" }
        copias { 3 }
        tipo_literario { "contos e poesia" }
        autor
        editora

        trait :sem_copias do
        copias { 0 }
        end

        factory :livro2 do
        nome { "O Pequeno Principe" }
        copias { 4 }
        tipo_literario { "infantil" }
        autor
        editora
        end
    end
end
