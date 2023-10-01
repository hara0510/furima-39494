require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user:)
  end

  describe '商品新規登録' do
    context '新規登録できる場合' do
      it 'item_name,description,category_id,condition_id,shippingfee_id,prefecture_id,deliveryday_id,price,userが存在すれば登録できる' do
        image_path = Rails.root.join('app/assets/images/item-sample.png')
        @item.image.attach(io: File.open(image_path), filename: 'item-sample.png', content_type: 'image/png')
        expect(@item).to be_valid
      end
    end

    context '新規登録できない場合' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'item_nameが空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it 'item_nameが40文字より長いと登録できない' do
        @item.item_name = Faker::Lorem.characters(number: rand(41..42))
        @item.valid?
        expect(@item.errors.full_messages).to include('Item name is too long (maximum is 40 characters)')
      end

      it 'descriptionが空では登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'descriptionが1000文字より長いと登録できない' do
        @item.description = Faker::Lorem.characters(number: rand(1001..1002))
        @item.valid?
        expect(@item.errors.full_messages).to include('Description is too long (maximum is 1000 characters)')
      end

      it 'category_idが空では登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'condition_idが空では登録できない' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it 'shippingfee_idが空では登録できない' do
        @item.shippingfee_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shippingfee can't be blank")
      end

      it 'prefecture_idが空では登録できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'deliveryday_idが空では登録できない' do
        @item.deliveryday_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Deliveryday can't be blank")
      end

      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが300より小さいと登録できない' do
        @item.price = '100'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end

      it 'priceが9,999,999より大きいと登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end

      it 'userが紐付いていなければ登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
