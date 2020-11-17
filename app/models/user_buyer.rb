class UserBuyer
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefectures_id, :municipality, :address, :building_name, :phone_number, :token

  with_options presence: true do
    validates :postal_code
    validates :prefectures_id
    validates :municipality
    validates :address
    validates :phone_number
    validates :token
  end

  with_options numericality: { other_than: 1 } do
    validates :prefectures_id
  end

  validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :phone_number, format: {with: /\A\d{11}\z/, message: "please write within 11 digits without hyphens"}

  def save
    buyer = Buyer.create(user_id: user_id, item_id: item_id)
    Buyer.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(postal_code: postal_code, prefectures_id: prefectures_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, buyer_id: buyer.id)
  end

end