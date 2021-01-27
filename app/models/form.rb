class Form
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :purchase, :token
  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{11}\z/ }
    validates :token
  end
  validates :prefecture_id, numericality: { other_than: 0 }

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    # 住所の情報を保存
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city,  address: address, phone_number: phone_number, purchase_id: purchase.id)
    # 寄付金の情報を保存
    
  end
end
