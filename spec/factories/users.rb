FactoryBot.define do
  factory :user do
    name                  { Faker::Name.initials(number: 6) }
    birth_date            { Faker::Date.birthday(min_age: 5, max_age: 100) }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
  end
end
