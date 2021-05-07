require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録できる時' do
      it '全て記述されていれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できない時' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '同じemailは登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに@が記述されていないと登録できない' do
        @user.email = '111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが6文字未満だと登録できない' do
        @user.password = '1a111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordが数字だけでは登録できない' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'passwordが英語だけでは登録できない' do
        @user.password = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'passwordが半角英数以外の文字を含んでいたら登録できない' do
        @user.password = '1aアイウエ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'passwordを２回入力しないと登録できない' do
        @user.password = '1a1111'
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordとpassword_confirmationが一致しないと登録できない' do
        @user.password = '1a1111'
        @user.password_confirmation = '2b2222'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'last_nameが記述されていないと登録できない' do
        @user.last_name = ''
        @user.first_name = '太郎'
        @user.valid?

        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it 'first_nameが記述されていないと登録できない' do
        @user.last_name = '山田'
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'last_nameは、全角（漢字・ひらがな・カタカナ）で記述されていないと登録できない' do
        @user.last_name = 'abc'
        @user.first_name = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end

      it 'first_nameは、全角（漢字・ひらがな・カタカナ）で記述されていないと登録できない' do
        @user.last_name = '山田'
        @user.first_name = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end

      it 'last_name_kanaが記述されていないと登録できない' do
        @user.last_name_kana = ''
        @user.first_name_kana = 'タロウ'
        @user.valid?

        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end

      it 'first_name_kanaが記述されていないと登録できない' do
        @user.last_name_kana = 'ヤマダ'
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it 'last_name_kanaがカタカナで記述されていないと登録できない' do
        @user.last_name_kana = '山田'
        @user.first_name_kana = 'タロウ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid')
      end

      it 'first_name_kanaがカタカナで記述されていないと登録できない' do
        @user.last_name_kana = 'ヤマダ'
        @user.first_name_kana = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end

      it 'birthdayが空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
