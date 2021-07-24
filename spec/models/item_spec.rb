require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  
  describe '新規商品出品' do
    
    context '出品できる時' do
      it 'item_image, item_name, description, category_id, status_id, shipping_charges_id, shipping_area_id, shipping_date_id, item_price があれば登録できる' do
        expect(@item).to be_valid
      end
      it 'item_price が 半角英数字 であれば登録できる' do
        @item.item_price = 1111
        expect(@item).to be_valid
      end
      it 'item_price が 300~9999999 の間であれば登録できる' do
        @item.item_price = 300
        expect(@item).to be_valid
        @item.item_price = 9999999
        expect(@item).to be_valid
      end
    end

    context '出品できない時' do
      it 'item_image が空では登録できない' do
        @item.item_image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item image can't be blank")
      end
      it 'item_name が空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'description が空では登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'category_id が空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'status_id が空では登録できない' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it 'shipping_charges_id が空では登録できない' do
        @item.shipping_charges_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charges can't be blank")
      end
      it 'shipping_area_id が空では登録できない' do
        @item.shipping_area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area can't be blank")
      end
      it 'shipping_date_id が空では登録できない' do
        @item.shipping_date_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date can't be blank")
      end
      it 'item_price が空では登録できない' do
        @item.item_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price can't be blank")
      end
      it 'item_price が 300~9999999 の範囲外だと登録できない' do
        @item.item_price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price is out of setting range")
        @item.item_price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price is out of setting range")
      end
      it 'item_price が全角数字では登録できない' do
        @item.item_price = '１１１１'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price is not a number")
      end
      it 'ユーザー情報が紐づいていなければ登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end

  end
end
