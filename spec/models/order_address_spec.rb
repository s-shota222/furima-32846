require 'rails_helper'
RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end

  describe '住所情報の保存' do
    context '住所の保存が上手くいくとき' do
      it '必要な情報を適切に入力すると、住所の保存ができる' do
        expect(@order_address).to be_valid
      end
      it '建物情報は空でも登録できる' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end

    context '住所情報の保存がうまくいかないとき' do
      it '郵便番号が無い場合は保存できない' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it '都道府県が無い場合は保存できない' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it '市区町村が無い場合は保存できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地が無い場合は保存出来ない' do
        @order_address.address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が無い場合は保存できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it '郵便番号にハイフンが入っていない場合は保存できない' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it '郵便番号が数字以外の場合保存できない' do
        @order_address.postal_code = 'sss-ssss'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it '電話番号にハイフンが入っている場合は保存できない' do
        @order_address.phone_number = '-'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number 11桁で以内で入力してください(ハイフン不要)')
      end
      it '電話番号が数字以外の場合保存できない' do
        @order_address.phone_number = 'sssssssssss'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number 11桁で以内で入力してください(ハイフン不要)')
      end
      it 'tokenが空では登録できないこと' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
