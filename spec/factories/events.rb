FactoryBot.define do
  factory :event do
    transient do
      person { Gimei.name }
    end
    last_name        { person.last.kanji }
    first_name       { person.first.kanji }
    last_name_kana   { person.last.hiragana }
    first_name_kana  { person.first.hiragana }
    gender_id        { Faker::Number.within(range: 2..3) }
    anniversary_date { Faker::Date.birthday(max_age: 150) }
    category_id      { Faker::Number.within(range: 2..5) }
    anniversary_name { Faker::Name.initials }
    user_id          { FactoryBot.create(:user).id }
  end
end