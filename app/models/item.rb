class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_status
  belongs_to :shipping_cost
  belongs_to :shipping_area
  belongs_to :day_to_ship
  
  belongs_to :user
  has_one_attached :image
end
