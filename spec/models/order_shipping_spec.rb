require 'rails_helper'

RSpec.describe OrderShipping, type: :model do

  describe '購入情報の保存' do

    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_shipping = FactoryBot.build(:order_shipping, user_id: user.id, item_id: item.id)
      sleep 0.05 # テストコード実行時の処理負荷対策
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@order_shipping).to be_valid
      end
      it '建物名は 空 でも保存できる' do
        @order_shipping.building_name = ''
        expect(@order_shipping).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'user_idが 空 では登録できない' do
        @order_shipping.user_id = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが 空 では登録できない' do
        @order_shipping.item_id = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Item can't be blank")
      end
      it 'クレジットカード情報が正しくない(tokenが含まれていない)と保存できない' do
        @order_shipping.token = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が 空 だと保存できない' do
        @order_shipping.zip_code = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Zip code can't be blank")
      end
      it '郵便番号に - が含まれていないと登録できない' do
        @order_shipping.zip_code = '1234567'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Zip code is invalid. Include hyphen(-)")
      end
      it '都道府県を 選択 していないと保存できない' do
        @order_shipping.prefectures_id = 0
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Prefectures can't be blank")
      end
      it '市区町村が 空 だと保存できない' do
        @order_shipping.municipality = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Municipality can't be blank")
      end
      it '番地が 空 だと保存できない' do
        @order_shipping.street_address = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Street address can't be blank")
      end
      it '電話番号が 空 だと保存できない' do
        @order_shipping.phone_number = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が 12桁 以上だと登録できない' do
        @order_shipping.phone_number = '090123456789'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
      it '電話番号が 9桁 以下だと登録できない' do
        @order_shipping.phone_number = '090123456'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Phone number is too short (minimum is 10 characters)")
      end
      it '電話番号が 数字 以外だと登録できない' do
        @order_shipping.phone_number = 'あいうアイウABC'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Phone number is not a number")
      end
      it '電話番号が 全角数字 では登録できない' do
        @order_shipping.phone_number = '０９０１２３４５６７８'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Phone number is not a number")
      end
    end

  end
end