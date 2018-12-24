FactoryBot.define do

  factory :user do
    email { "doe@s314.ru" }
    password { "woohoo" }
  end

  factory :article do
    title { "Testing article" }
    description { "Normal shortened version of article" }
    contents do
      "Looooong version. Full text.
      Of course. It is too long."
    end
  end

  factory :category do
    title { "Sample category" }
    game { false }
  end

end