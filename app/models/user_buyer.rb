class UserBuyer
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefectures_id, :municipality, :address, :building_name, :phone_number

  with_options presence: true do
    validates :postal_code
    validates :prefectures_id
    validates :municipality
    validates :address
    validates :phone_number, 
  end
    validates :postal_code, format: {with: /\A\d{11}\z/, message: "write within 11 characters"}
    validates :phone_number, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}

  def save
    Buyer.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(postal_code: postal_code, prefectures_id: prefectures_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number)
  end
end