require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end
    context '保存ができる時' do
      it "image、nameとexplain、category_idとsale_status_id,shipping_fee_status_idとprefecture_idとscheduled＿delivery＿id、priceが半角数字で存在すれば登録できること" do
      expect(@item).to be_valid
      end
    end

    context '保存ができない時' do
      it "imageが空では登録できないこと" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")         
      end     
    

    
      it "nameが空では登録できないこと" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")           
      end     
    

    
      it "explainが空では登録できないこと" do
        @item.explain = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Explain can't be blank")          
      end     
    

    
      it "category_idが空では登録できないこと" do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank", "Category is not a number")           
      end     
    

    
      it "sale_status_idが空では登録できないこと" do
        @item.sale_status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Sale status can't be blank", "Sale status is not a number")           
      end     
    

    
      it "shipping_fee_status_idが空では登録できないこと" do
        @item.shipping_fee_status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee status can't be blank", "Shipping fee status is not a number")           
      end     
    

    
      it "prefecture_idが空では登録できないこと" do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank", "Prefecture is not a number")           
      end     
    

    
      it "scheduled＿delivery＿idが空では登録できないこと" do
        @item.scheduled_delivery_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled delivery can't be blank", "Scheduled delivery is not a number")           
      end     
    

    
      it "priceが空では登録できないこと" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", "Price is not included in the list", "Price is not a number")          
      end

      it "priceが指定範囲外では登録できないこと" do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")          
      end
      
      it "priceが指定範囲外では登録できないこと" do
        @item.price = 1_000_000_0
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")          
      end 

      it "priceが全角数字では登録できないこと" do
        @item.price = '１２３４'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list", "Price is not a number")          
      end 

      it "priceが半角英字が混ざっていると登録できないこと" do
        @item.price = '30a0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list", "Price is not a number")          
      end 
      
      it "category_idが0では登録できないこと" do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 0")          
      end  

      it "prefecture_idが0では登録できないこと" do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 0")          
      end  

      it "sale_status_idが0では登録できないこと" do
        @item.sale_status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Sale status must be other than 0")          
      end  

      it "scheduled_delivery_idが0では登録できないこと" do
        @item.scheduled_delivery_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled delivery must be other than 0")          
      end  

      it "shipping_fee_status_idが0では登録できないこと" do
        @item.shipping_fee_status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee status must be other than 0")          
      end  
    end
  end
end


