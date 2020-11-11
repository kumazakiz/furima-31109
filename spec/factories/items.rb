FactoryBot.define do
  factory :item do
    title            { 'test' }
    explanation      { 'test' }
    category_id      { 2 }
    item_status_id   { 2 }
    shipping_cost_id { 2 }
    shipping_area_id { 2 }
    days_to_ship_id  { 2 }
    selling_price    { 10_000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
