require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  
  describe '出品商品の登録' do
    context '商品の登録がうまくいくとき' do
      it '必要な情報を適切に入力すると、商品の登録ができる' do
        expect(@item).to be_valid
      end
    end

    context '商品登録がうまくいかないとき' do
      it '商品画像が無い場合は登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空では登録できない' do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が空では登録できない' do
        @item.information = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Information can't be blank")
      end
      it 'カテゴリーについて --- が選択された場合は登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it '商品の状態について --- が選択された場合は登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end
      it '配送料の負担について --- が選択された場合は登録できない' do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee must be other than 1")
      end
      it '発送元の地域について --- が選択された場合は登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it '発送までの日数について --- が選択された場合は登録できない' do
        @item.days_to_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship must be other than 1")
      end
      it '価格が空では登録できない' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が￥300未満では登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it '価格が￥10,000,000以上では登録できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it '価格が半角数字以外で入力された場合登録できない' do
        @item.price = "１００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

    end
  end

end
