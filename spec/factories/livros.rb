FactoryBot.define do
    factory :livro do
        nome { "O Doce e O Amargo" }
        copias { 3 }
        autor { "Joao Gabriel Paulsen" }
        tipo_literario { "contos e poesia" }
        editora

        trait :sem_copias do
        copias { 0 }
        end

        factory :livro2 do
        nome { "O Pequeno Principe" }
        copias { 4 }
        autor { "Antoine" }
        tipo_literario { "infantil" }
        editora { nil }
        end
    end
end
