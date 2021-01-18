class Item < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :sale_status
  belongs_to_active_hash :scheduled_delivery
  belongs_to_active_hash :shipping_fee_status
  with_options presence: true do
    validates :image
    validates :name
    validates :explain
    validates :category_id
    validates :sale_status_id
    validates :shipping_fee_status_id
    validates :prefecture_id
    validates :scheduled_delivery_id
    validates :price
  end
  validates_inclusion_of :price, in: 300..9_999_999
  validates :price, numericality: { with: /\A[0-9]+\z/}

  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :prefecture_id
    validates :sale_status_id
    validates :scheduled_delivery_id
    validates :shipping_fee_status_id
  end
end
