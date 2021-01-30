FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    name                  { person.first.kanji }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    phone_number          { '09012345678' }
    occupation_id         { Faker::Number.between(from: 2, to: 6) }
    position_id           { Faker::Number.between(from: 2, to: 6) }
  end
end
