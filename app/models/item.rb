class Item < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :condition, :prefecture, :delivery_fee, :days_to_ship

  validates :category_id, :condition_id, :prefecture_id, :delivery_fee_id, :days_to_ship_id, numericality: { other_than: 1 }
end
