FactoryBot.define do
  factory :item do
    name             { '出品物1個目' }
    information      { '出品物1個目の説明' }
    category_id      { 2 }
    condition_id     { 2 }
    delivery_fee_id  { 2 }
    prefecture_id    { 2 }
    days_to_ship_id  { 2 }
    price            { 8000 }
    user_id          { 4 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png' )
    end
  end
end
