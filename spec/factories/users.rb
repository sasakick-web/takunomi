FactoryBot.define do
  factory :user do
    trait :a do
    id { "1" }
    email                 {"test@gmail.com"}
    password              {"user1pass"}
  end

    trait :b do
    email                 { nil }
    password              {"user1pass"}
  end

    trait :c do
    email                 {"test@gmail.com"}
    password              { nil }
  end
 end
end
