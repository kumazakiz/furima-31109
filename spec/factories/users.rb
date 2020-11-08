FactoryBot.define do
  factory :user do
    nickname              { Faker::Internet.username }
    email                 { Faker::Internet.free_email }
    password              { '9mazak1' }
    password_confirmation { password }
    family_name           { '田中' }
    first_name            { '太郎' }
    family_name_kana      { 'タナカ' }
    first_name_kana       { 'タロウ' }
    birthday              { '2000-01-01' }
  end
end
