FactoryBot.define do
    factory :pessoa do
        nome { "jose" }
        idade { 20 }
        email { "pessoa@gmail.com" }
        password { "a123456" }
        password_confirmation { "a123456" }
        association :cargo, factory: :cargo

        factory :pessoa2 do
            nome { "miguel" }
            idade { 17 }
            association :cargo, factory: :cargo, nome: "leitor"
            email { "pessoa2@gmail.com" }
            password { "a1234567" }
            password_confirmation { "a1234567" }
        end
            factory :pessoa3 do
            nome { "carlos" }
            idade { 30 }
            association :cargo, factory: :cargo, nome: "bibliotecario"
            email { "pessoa3@gmail.com" }
            password { "a12345678" }
            password_confirmation { "a12345678" }
            end
        factory :pessoa4 do
            nome { "maria" }
            idade { 15 }
            association :cargo, factory: :cargo, nome: "leitor"
            email { "pessoa4@gmail.com" }
            password { "a12345678" }
            password_confirmation { "a12345678" }
        end
    end
end
