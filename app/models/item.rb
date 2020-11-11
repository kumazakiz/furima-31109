class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_status
  belongs_to :shipping_cost
  belongs_to :shipping_area
  belongs_to :days_to_ship

  with_options presence: true do
    validates :image
    validates :title
    validates :explanation
    validates :category_id
    validates :item_status_id
    validates :shipping_cost_id
    validates :shipping_area_id
    validates :days_to_ship_id
    validates :selling_price
  end
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :item_status_id
    validates :shipping_cost_id
    validates :shipping_area_id
    validates :days_to_ship_id
  end

  validates_inclusion_of :selling_price, in: 300..9_999_999, message: '300~9,999,999の間で設定してください。'
  SELLING_PRICE_REGEX = /\A[0-9]+\z/.freeze
  validates_format_of :selling_price, with: SELLING_PRICE_REGEX, message: 'には半角数字のみで設定してください'
end
