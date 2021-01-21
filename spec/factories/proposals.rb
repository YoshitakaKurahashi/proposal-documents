FactoryBot.define do
  factory :proposal do
    title         { Faker::String.random(length: 20) }
    detail        { Faker::String.random(length: 250) }
    term_start    { Faker::Date }
    term_end      { Faker::Date }
    target_group  { Faker::Lorem.sentence(word_count: 4) }
    numeric       { Faker::Lorem.sentence(word_count: 4) }
    budget        { Faker::Number.number(digits: 7) }
    payment       { Faker::Lorem.sentence(word_count: 4) }
  end
end
