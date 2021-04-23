class ShippingAddress < ApplicationRecord
  belongs_to :order

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :address
    validates :phone_number, numericality: { with: /\A\d{11}\z/, message: '11桁で以内で入力してください(ハイフン不要)' }
  end
end
