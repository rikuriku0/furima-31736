FactoryBot.define do
  factory :form do
    postal_code { '123-4567' }
    prefecture_id { 1 }
    city { '横浜市緑区' }
    address { '青山1-1-1' }
    building { '' }
    phone_number { '09074637273' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
