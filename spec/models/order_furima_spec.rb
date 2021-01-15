require 'rails_helper'

RSpec.describe OrderFurima, type: :model do
  before do
    sleep(0.15.second)
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_furima = FactoryBot.build(:order_furima,user_id: @user.id, item_id: @item.id)
  end
  
  describe '購入記録情報の保存' do
    context "商品購入ができる時" do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_furima).to be_valid
      end
      it '建物名は空でも保存できること' do
        @order_furima.building = nil
        expect(@order_furima).to be_valid
      end
    end
    
    context "商品購入ができない時" do
    it '郵便番号が空だと保存できないこと' do
      @order_furima.postal_code = nil
      @order_furima.valid?
      expect(@order_furima.errors.full_messages).to include("Postal code can't be blank")
    end
    it '郵便番号が半角数字かつハイフンがないと保存できないこと' do
      @order_furima.postal_code = "あいうえお"
      @order_furima.valid?
      expect(@order_furima.errors.full_messages).to include("Postal code はハイフンを挟んだ半角数字で入力してください")
    end
    it '都道府県を選択しないと保存できない' do
      @order_furima.product_state_id = 0
      @order_furima.valid?
      expect(@order_furima.errors.full_messages).to include("Product state を選択してください")
    end
    it '市区町村が空だと保存できないこと' do
      @order_furima.city = nil
      @order_furima.valid?
      expect(@order_furima.errors.full_messages).to include("City can't be blank")
    end
    it '番地が空だと保存できないこと' do
      @order_furima.block = nil
      @order_furima.valid?
      expect(@order_furima.errors.full_messages).to include("Block can't be blank")
    end
    it '電話番号が空だと保存できないこと' do
      @order_furima.phone_number = nil
      @order_furima.valid?
      expect(@order_furima.errors.full_messages).to include("Phone number can't be blank")
    end
    it '電話番号は半角数字以外では保存できないこと' do
      @order_furima.phone_number = "あいうえお"
      @order_furima.valid?
      expect(@order_furima.errors.full_messages).to include("Phone number は半角数字で入力してください")
    end
    it '電話番号は半角英数字混合では保存できないこと' do
      @order_furima.phone_number = '1234567abc'
      @order_furima.valid?
      expect(@order_furima.errors.full_messages).to include("Phone number は半角数字で入力してください")
    end
    it '電話番号は12桁以上では保存できないこと' do
      @order_furima.phone_number = '1234567890123'
      @order_furima.valid?
      expect(@order_furima.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
    end
    it 'ユーザーIDは空では保存できないこと' do
      @order_furima.user_id = nil
      @order_furima.valid?
      expect(@order_furima.errors.full_messages).to include("User can't be blank")
    end
    it 'アイテムIDは空では保存できないこと' do
      @order_furima.item_id = nil
      @order_furima.valid?
      expect(@order_furima.errors.full_messages).to include("Item can't be blank")
    end
   end
  end
end