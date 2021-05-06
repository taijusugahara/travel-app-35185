require 'rails_helper'

RSpec.describe OrderInfo, type: :model do
  describe '購入' do
    before do
      user = FactoryBot.create(:user)
      country = FactoryBot.create(:country)
      plane = FactoryBot.create(:plane)
      plane_go = FactoryBot.create(:plane_go)
      plane_back = FactoryBot.create(:plane_back)
      hotel = FactoryBot.create(:hotel)
      tour = FactoryBot.create(:tour)
      @order_info = FactoryBot.build(:order_info, user_id: user.id, country_id: country.id, plane_id: plane.id, plane_go_id: plane_go.id, plane_back_id: plane_back.id, hotel_id: hotel.id, tour_id: tour.id)
    end
    # planeとhotelはassosiation(validation)を掛けていないのでnilにしても通ってしまうが、その場合戻るアクションを設定しているので問題ない
    context '購入ができる時' do
      it '購入ページの全ての情報が入力されていれば購入できる' do
        expect(@order_info).to be_valid
      end

    end

    context '購入できない時' do
      it 'passport_numberが空の場合は購入できない' do
        @order_info.passport_number = ''
        @order_info.valid?
        expect(@order_info.errors.full_messages).to include("Passport number can't be blank")
      end

      it 'passport_numberが全角を含む場合は購入できない' do
        @order_info.passport_number = '１２３４５６ABC'
        @order_info.valid?
        expect(@order_info.errors.full_messages).to include("Passport number is invalid")
      end

      it 'passport_numberが数字だけの場合は購入できない' do
        @order_info.passport_number = '123456'
        @order_info.valid?
        expect(@order_info.errors.full_messages).to include("Passport number is invalid")
      end

      it 'passport_numberが半角英語大文字だけの場合は購入できない' do
        @order_info.passport_number = 'ABCDEFG'
        @order_info.valid?
        expect(@order_info.errors.full_messages).to include("Passport number is invalid")
      end

      it 'passport_numberが半角英語小文字だけの場合は購入できない' do
        @order_info.passport_number = 'abcdef'
        @order_info.valid?
        expect(@order_info.errors.full_messages).to include("Passport number is invalid")
      end

      it 'passport_numberが半角英語小文字と数字の場合は購入できない' do
        @order_info.passport_number = 'abcde12345'
        @order_info.valid?
        expect(@order_info.errors.full_messages).to include("Passport number is invalid")
      end

      it 'first_nameが空の場合は購入できない' do
        @order_info.first_name = ''
        @order_info.valid?
        expect(@order_info.errors.full_messages).to include("First name can't be blank")
      end

      it 'first_namerが全角の場合は購入できない' do
        @order_info.first_name = '山田'
        @order_info.valid?
        expect(@order_info.errors.full_messages).to include("First name is invalid")
      end

      it 'first_namerが半角英語小文字の場合は購入できない' do
        @order_info.first_name = 'yamada'
        @order_info.valid?
        expect(@order_info.errors.full_messages).to include("First name is invalid")
      end

      it 'last_nameが空の場合は購入できない' do
        @order_info.last_name = ''
        @order_info.valid?
        expect(@order_info.errors.full_messages).to include("Last name can't be blank")
      end

      it 'last_namerが全角の場合は購入できない' do
        @order_info.last_name = '太郎'
        @order_info.valid?
        expect(@order_info.errors.full_messages).to include("Last name is invalid")
      end

      it 'last_namerが半角英語小文字の場合は購入できない' do
        @order_info.last_name = 'tarou'
        @order_info.valid?
        expect(@order_info.errors.full_messages).to include("Last name is invalid")
      end

     

      it 'userが空の場合は購入できない' do
        @order_info.user_id = nil
        @order_info.valid?
        expect(@order_info.errors.full_messages).to include("User can't be blank")
      end

      it 'countryが空の場合は購入できない' do
        @order_info.country_id = nil
        @order_info.valid?
        expect(@order_info.errors.full_messages).to include("Country can't be blank")
      end

    end

  end
end