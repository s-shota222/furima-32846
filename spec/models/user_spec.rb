require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "新規登録/ユーザー情報" do
    it 'nicknameが空では登録できない' do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do

    end
    it '既に登録しているemailは登録できない' do

    end
    it '@を含んでいないemailは登録できない' do

    end
    it 'passwordが空では登録できない' do 

    end
    it 'password(確認用)が空では登録できない' do

    end
    it 'passwordが６文字未満では登録できない' do

    end
    it 'passwordが半角英数字混合で入力されない場合は登録できない' do

    end
    it 'passwaordとpassword(確認用)が一致しないと登録できない' do

    end    
  end
end
  



