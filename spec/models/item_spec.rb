require 'rails_helper'

RSpec.describe Item, type: :model do  
  
  before do
     @item = FactoryBot.build(:item)
    end
  
    describe '商品出品機能' do
      context '出品登録ができる場合' do
        it '商品の画像、名前、説明、カテゴリー、状態、送料負担、発送元、発送日数、価格があれば商品は保存される' do
          expect(@item).to be_valid
      end
    
    end
     context '出品登録ができない場合' do
       it '画像がないと商品は保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    
      
      it '商品名がないと商品は保存できない' do
        @item.product_name= ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end
      
      it '商品説明がないと商品は保存できない' do
        @item.product_explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product explanation can't be blank")
      end
      
      it '商品カテゴリーを選択しないと商品は保存できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 0")
      end
      
      it '商品カテゴリーが空の場合商品は保存できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is not a number")
      end
      
      it '商品状態を選択しないと商品は保存できない' do
        @item.product_state_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Product state must be other than 0")
      end
      
      it '商品状態が空の場合商品は保存できない' do
        @item.product_state_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Product state is not a number")
      end
      
      it '送料負担を選択しないと商品は保存できない' do
        @item.delivery_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery must be other than 0")
      end
      
      it '送料負担が空の場合商品は保存できない' do
        @item.delivery_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery is not a number")
      end
      
      it '発送元を選択しないと商品は保存できない' do
        @item.prefecture_id= 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 0")
      end
      
      it '発送元が空の場合商品は保存できない' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture is not a number")
      end
      
      it '発送日数を選択しないと商品は保存できない' do
        @item.shipping_number_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping number must be other than 0")
      end
      
      it '発送日数が空だと商品は保存できない' do
        @item.shipping_number_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping number is not a number")
      end
      
      it '価格がないと商品は保存できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      
      it '価格が入力されていても300円未満では商品は保存できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      
      it '価格が入力されていても9999999円以上では商品は保存できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      
      it '価格を半角数字で入力しなければ商品は保存できない' do
        @item.price = 500
        @item.valid?
        expect(@item.errors.full_messages).to include()
      end
      
      it 'ユーザーが紐付いていないと商品は保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end
  

