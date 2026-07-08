FactoryBot.define do
    factory :emprestimo do
        livro
        pessoa
        factory :emprestimo2 do
            livro2
            pessoa2
        end
    end
end
