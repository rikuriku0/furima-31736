FactoryBot.define do
  factory :item do 
    name {"あああ"}
    explain {"あああ"}
    category_id {1}
    sale_status_id {1}
    shipping_fee_status_id {1}
    prefecture_id {1}
    scheduled_delivery_id {1}
    price {"400"}
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/item-sample.png'), filename: 'item-sample.png')
    end
  end
end
