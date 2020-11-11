FactoryBot.define do
  factory :item do
    title            { 'test' }
    explanation      { 'test' }
    selling_price    { 10000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
