FactoryBot.define do
  factory :order_address do
    postal_code      { '123-4567' }
    prefecture_id    { 2 }
    city             { '札幌' }
    address          { '1-1-1' }
    building         { 'ビルディング' }
    phone_number     { '12345678910' }
  end
end