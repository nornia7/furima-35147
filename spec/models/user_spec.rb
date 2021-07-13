require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる時' do
      it 'nickname, email, password, password_confirmation, last_name, first_name, last_name_kana, first_name_kana, birthday が存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'password と password_confirmation が 6文字以上 かつ 英数字混合 であれば登録できる' do
        @user.password = 'aaa111'
        @user.password_confirmation = 'aaa111'
        expect(@user).to be_valid
      end
      it 'last_name が 漢字 であれば登録できる' do
        @user.last_name = '田中'
        expect(@user).to be_valid
      end
      it 'last_name が ひらがな であれば登録できる' do
        @user.last_name = 'たなか'
        expect(@user).to be_valid
      end
      it 'last_name が カタカナ であれば登録できる' do
        @user.last_name = 'タナカ'
        expect(@user).to be_valid
      end
      it 'first_name が 漢字 であれば登録できる' do
        @user.first_name = '次郎'
        expect(@user).to be_valid
      end
      it 'first_name が ひらがな であれば登録できる' do
        @user.first_name = 'じろう'
        expect(@user).to be_valid
      end
      it 'first_name が カタカナ であれば登録できる' do
        @user.first_name = 'ジロウ'
        expect(@user).to be_valid
      end
      it 'last_name_kana が カタカナ であれば登録できる' do
        @user.last_name_kana = 'タナカ'
        expect(@user).to be_valid
      end
      it 'first_name_kana が カタカナ であれば登録できる' do
        @user.last_name_kana = 'ジロウ'
        expect(@user).to be_valid
      end
    end

    context '新規登録できない時' do
      it 'nickname が空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'email が空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'email に @ が含まれていないと登録できない' do
        @user.email = 'testgmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'すでに存在する email では登録できない' do
        @user.save
        user2 = FactoryBot.build(:user)
        user2.email = @user.email
        user2.valid?
        expect(user2.errors.full_messages).to include('Email has already been taken')
      end
      it 'password が空では登録できない' do
        @user.password = ''
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'password が存在しても password_confirmation が空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'password が 5文字以下 では登録できない' do
        @user.password = 'abc12'
        @user.password_confirmation = 'abc12'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'password が 英字 のみでは登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
      end
      it 'password が 数字 のみでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
      end
      it 'last_name が 英字 では登録できない' do
        @user.last_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid. Input full-width characters')
      end
      it 'first_name が 英字 では登録できない' do
        @user.first_name = 'taro'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid. Input full-width characters')
      end
      it 'last_name_kana が 英字 では登録できない' do
        @user.last_name_kana = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid. Input full-width katakana characters')
      end
      it 'last_name_kana が 漢字 では登録できない' do
        @user.last_name_kana = '山田'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid. Input full-width katakana characters')
      end
      it 'last_name_kana が ひらがな では登録できない' do
        @user.last_name_kana = 'やまだ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid. Input full-width katakana characters')
      end
      it 'first_name_kana が 英字 では登録できない' do
        @user.first_name_kana = 'taro'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid. Input full-width katakana characters')
      end
      it 'first_name_kana が 漢字 では登録できない' do
        @user.first_name_kana = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid. Input full-width katakana characters')
      end
      it 'first_name_kana が ひらがな では登録できない' do
        @user.first_name_kana = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid. Input full-width katakana characters')
      end
      it 'birthday が空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
