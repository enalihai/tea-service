FactoryBot.define do
  factory :tea do
    title { Faker::Fantasy::Tolkien.character }
    description { Faker::Fantasy::Tolkien.poem }
    temperature { Faker::Number.between(from: 80, to: 140) }
    brew_time { Faker::Number.between(from: 3, to: 60) }
  end
end