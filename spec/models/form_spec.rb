require 'rails_helper'

RSpec.describe Form, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @form = FactoryBot.build(:form, item_id: @item.id, user_id: @user.id)
      sleep(1)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@form).to be_valid
    end
    it 'postal_codeが空だと保存できないこと' do
      @form.postal_code = nil
      @form.valid?
      expect(@form.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @form.postal_code = '1234567'
      @form.valid?
      expect(@form.errors.full_messages).to include("Postal code is invalid")
    end
    it 'prefecture_idが空だと保存できないこと' do
      @form.prefecture_id = nil
      @form.valid?
      expect(@form.errors.full_messages).to include("Prefecture is not a number")
    end
    it 'prefecture_idが0だと保存できないこと' do
      @form.prefecture_id = '0'
      @form.valid?
      expect(@form.errors.full_messages).to include("Prefecture must be other than 0")
    end
    it 'cityが空だと保存できないこと' do
      @form.city = nil
      @form.valid?
      expect(@form.errors.full_messages).to include("City can't be blank")
    end
    it 'addressが空だと保存できないこと' do
      @form.address = nil
      @form.valid?
      expect(@form.errors.full_messages).to include("Address can't be blank")
    end
    it 'buildingは空でも保存できること' do
      @form.building = nil
      @form.valid?
      expect(@form).to be_valid
    end
    it 'phone_numberが空だと保存できないこと' do
      @form.phone_number = nil
      @form.valid?
      expect(@form.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid")
    end
    it 'phone_numberが11桁以内でないと保存できないこと' do
      @form.phone_number = '090000000000'
      @form.valid?
      expect(@form.errors.full_messages).to include("Phone number is invalid")
    end
    it 'phone_numberがハイフンがあると保存できないこと' do
      @form.phone_number = '090-0000-0000'
      @form.valid?
      expect(@form.errors.full_messages).to include("Phone number is invalid")
    end 
    it "tokenが空では登録できないこと" do
      @form.token = nil
      @form.valid?
      expect(@form.errors.full_messages).to include("Token can't be blank")
    end   
  end
end

