FactoryBot.define do
  factory :editora do
    nome { "record" }
    data_fundacao { "2009-03-16" }

    factory :editora2 do
      nome { "editora 34" }
      data_fundacao { "1977-08-27" }
    end
  end
end
