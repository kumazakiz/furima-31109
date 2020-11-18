FactoryBot.define do
  factory :user_buyer do
    postal_code    { '123-4567' }
    prefectures_id { 2 }
    municipality   { '小樽市小樽区' }
    address        { 'テスト1-2-3' }
    building_name  { '横浜ビル' }
    phone_number   { '09012345678' }
    token          { 'tok_abcdefghijk00000000000000000' }
  end
end
