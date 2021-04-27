require 'rails_helper'

RSpec.describe Tour, type: :model do
  before do
    @tour = FactoryBot.build(:tour)
  end

  describe 'ツアー' do
    context 'ツアー情報を登録できる時' do
      it '正しく記入されていれば登録できる' do
        expect(@tour).to be_valid
      end
    end

    context 'ツアー情報を登録できない時' do
      
      it 'nameが空の時登録できない' do
        @tour.name = ''
        @tour.valid?
        expect(@tour.errors.full_messages).to include ("Name can't be blank")
      end

      it 'priceが空の時登録できない' do
        @tour.price = ''
        @tour.valid?
        expect(@tour.errors.full_messages).to include ("Price can't be blank")
      end

      it 'spanが空の時登録できない' do
        @tour.span = ''
        @tour.valid?
        expect(@tour.errors.full_messages).to include ("Span can't be blank")
      end

      it 'howmanyが空の時登録できない' do
        @tour.howmany = ''
        @tour.valid?
        expect(@tour.errors.full_messages).to include ("Howmany can't be blank")
      end

      it 'howmanyが全角の時登録できない' do
        @tour.howmany = '１２'
        @tour.valid?
        expect(@tour.errors.full_messages).to include ("Howmany is not a number")
      end

      it 'howmanyが半角英語の時登録できない' do
        @tour.howmany = 'abc'
        @tour.valid?
        expect(@tour.errors.full_messages).to include ("Howmany is not a number")
      end

      it 'howmanyが0以下の時登録できない' do
        @tour.howmany = 0
        @tour.valid?
        expect(@tour.errors.full_messages).to include ("Howmany must be greater than or equal to 1")
      end



      it 'go_dateが空の時登録できない' do
        @tour.go_date = ''
        @tour.valid?
        expect(@tour.errors.full_messages).to include ("Go date can't be blank")
      end

      

      it 'go_dateが今日より前の日である時登録できない' do
        @tour.go_date = '2021/4/1'
        @tour.valid?
        expect(@tour.errors.full_messages).to include ("Go date は今日以降のものを選択してください")
      end


      it 'userが空の時登録できない' do
        @tour.user = nil
        @tour.valid?
        expect(@tour.errors.full_messages).to include ("User must exist")
      end

      it 'countryが空の時登録できない' do
        @tour.country = nil
        @tour.valid?
        expect(@tour.errors.full_messages).to include ("Country must exist")
      end
    end
  end
end
