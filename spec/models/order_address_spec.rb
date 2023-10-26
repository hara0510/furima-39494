require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item, user: @user)
    @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
  end

  describe '商品購入' do
    context '購入できる場合' do
      it 'postal_code, prefecture_id, city, address, tel, tokenが存在すれば購入できる' do
        expect(@order_address).to be_valid
      end

      it 'buildingが空でも購入できる' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end

    context '購入できない場合' do
      it 'postal_codeが空では登録できない' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank",
                                                               'Postal code is invalid. Enter it as follows (e.g. 123-4567)')
      end

      it 'postal_codeが半角数字3文字、半角ハイフン、半角数字4文字の型でないと登録できない' do
        @order_address.postal_code = '1111111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code is invalid. Enter it as follows (e.g. 123-4567)')
      end

      it 'prefecture_idが空では登録できない' do
        @order_address.prefecture_id = '1'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'cityが空では登録できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end

      it 'addressが空では登録できない' do
        @order_address.address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end

      it 'telが空では登録できない' do
        @order_address.tel = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tel can't be blank")
      end

      it 'telが10文字未満では登録できない' do
        @order_address.tel = '123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Tel is too short')
      end

      it 'telが11文字以上では登録できない' do
        @order_address.tel = '123456789012'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Tel is too long')
      end

      it 'telが半角数字でないと登録できない' do
        @order_address.tel = 'a'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Tel is invalid. Input only number')
      end

      it 'userが紐づいていないと登録できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが紐づいていないと登録できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end

      it 'tokenが空では登録できない' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
