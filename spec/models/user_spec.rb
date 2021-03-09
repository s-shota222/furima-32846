require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録/ユーザー情報' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it '既に登録しているemailは登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it '@を含んでいないemailは登録できない' do
      @user.email = 'testtest.co.jp'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが６文字未満では登録できない' do
      @user.password = 'test1'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordが半角英数字混合で入力されない場合は登録できない' do
      @user.password = 'testtest'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
    end
    it 'passwaordとpassword(確認用)が一致しないと登録できない' do
      @user.password_confirmation = 'test222'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  end

  describe '新規登録/本人情報確認' do
    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'last_nameが空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'first_nameが全角(漢字・ひらがな・カタカナ)で入力されない場合は登録できない' do
      @user.first_name = 'test'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name は全角（漢字・ひらがな・カタカナ）で設定してください')
    end
    it 'last_nameが全角(漢字・ひらがな・カタカナ)で入力されない場合は登録できない' do
      @user.last_name = '1111'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name は全角（漢字・ひらがな・カタカナ）で設定してください')
    end
    it 'first_name_rubyが空では登録できない' do
      @user.first_name_ruby = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name ruby can't be blank")
    end
    it 'last_name_rubyが空では登録できない' do
      @user.last_name_ruby = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name ruby can't be blank")
    end
    it 'first_name_rubyが全角(カタカナ)で入力されない場合は登録できない' do
      @user.first_name_ruby = 'ふりがな'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name ruby は全角（カタカナ）で設定してください')
    end
    it 'last_name_rubyが全角(カタカナ)で入力されない場合は登録できない' do
      @user.last_name_ruby = 'ﾌﾘｶﾞﾅ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name ruby は全角（カタカナ）で設定してください')
    end
    it 'birthdayが空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
