FactoryBot.define do
  factory :user_buyer do
    postal_code  {'123-4567'}
    municipality {'小樽市小樽区'}
    address      {'テスト1-2-3'}
    phone_number {'09012345678'}

    association :user
    association :buyer
    association :item
    association :image
    association :shipping_address
  end
end
