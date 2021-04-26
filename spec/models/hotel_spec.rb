require 'rails_helper'

RSpec.describe Hotel, type: :model do
  before do
    @hotel = FactoryBot.build(:hotel)
  end
  describe 'ホテル' do
    context 'ホテル情報を登録できる時' do
      it '正しく記入されていれば登録できる' do
        expect(@hotel).to be_valid
      end
    end

    context 'ホテル情報を登録できない時' do
      it 'nameが空の時登録できない' do
        @hotel.name=''
        @hotel.valid?
        expect(@hotel.errors.full_messages).to include("Name can't be blank")
      end

      it 'priceが空の時登録できない' do
        @hotel.price=''
        @hotel.valid?
        expect(@hotel.errors.full_messages).to include("Price can't be blank")
      end

      it 'nameとpriceの情報が合致していなければ登録できない' do
        @hotel.name='ホテルあいうえお'
        @hotel.price= 5000
        @hotel.valid?
        expect(@hotel.errors.full_messages).to include("Price 料金が選択したホテルと合致しません")
      end

      it 'howmanyが空の時登録できない' do
        @hotel.howmany=''
        @hotel.valid?
        expect(@hotel.errors.full_messages).to include("Howmany can't be blank")
      end

      it 'howmanyが全角の時登録できない' do
        @hotel.howmany='１０'
        @hotel.valid?
        expect(@hotel.errors.full_messages).to include("Howmany is not a number")
      end

      it 'howmanyが半角英語の時登録できない' do
        @hotel.howmany='abc'
        @hotel.valid?
        expect(@hotel.errors.full_messages).to include("Howmany is not a number")
      end

      it 'howmanyが0以下の時登録できない' do
        @hotel.howmany= 0
        @hotel.valid?
        expect(@hotel.errors.full_messages).to include("Howmany must be greater than or equal to 1")
      end


      it 'dayが空の時登録できない' do
        @hotel.day=''
        @hotel.valid?
        expect(@hotel.errors.full_messages).to include("Day can't be blank")
      end

      it 'dayが全角の時登録できない' do
        @hotel.day='１０'
        @hotel.valid?
        expect(@hotel.errors.full_messages).to include("Day is not a number", "Day 宿泊日数が選択した日程と合致しません")
      end

      it 'dayが半角英語の時登録できない' do
        @hotel.day='abc'
        @hotel.valid?
        expect(@hotel.errors.full_messages).to include("Day is not a number", "Day 宿泊日数が選択した日程と合致しません")
      end

      it 'dayが0以下の時登録できない' do
        @hotel.day= 0
        @hotel.valid?
        expect(@hotel.errors.full_messages).to include("Day must be greater than or equal to 1", "Day 宿泊日数が選択した日程と合致しません")
      end

      it 'go_dateが空の時登録できない' do
        @hotel.go_date = ''
        @hotel.valid?
        expect(@hotel.errors.full_messages).to include ("Go date can't be blank")
      end

      it 'back_dateが空の時登録できない' do
        @hotel.back_date = ''
        @hotel.valid?
        expect(@hotel.errors.full_messages).to include ("Back date can't be blank")
      end

      it 'go_dateが今日より前の日である時登録できない' do
        @hotel.go_date = '2021/4/1'
        @hotel.valid?
        expect(@hotel.errors.full_messages).to include ("Go date は今日以降のものを選択してください")
      end

      it 'back_dateが今日より前の日である時登録できない' do
        @hotel.back_date = '2021/4/1'
        @hotel.valid?
        
        expect(@hotel.errors.full_messages).to include ("Back date は到着日以降のものを選択してください")
      end

      it 'back_dateがgo_dateより前の日である時登録できない' do
        @hotel.go_date = '2021/6/1'
        @hotel.back_date = '2021/5/1'
        @hotel.valid?
        expect(@hotel.errors.full_messages).to include ("Back date は到着日以降のものを選択してください")
      end

      it 'dayの日数ががgo_dateとbacl_dateの日程と合致しない時登録できない' do
        @hotel.day = 3
        @hotel.go_date = '2021/6/1'
        @hotel.back_date = '2021/6/2'
        @hotel.valid?
        expect(@hotel.errors.full_messages).to include ("Day 宿泊日数が選択した日程と合致しません")
      end

      it 'userが空の時登録できない' do
        @hotel.user = nil
        @hotel.valid?
        expect(@hotel.errors.full_messages).to include ("User must exist")
      end

      it 'countryが空の時登録できない' do
        @hotel.country = nil
        @hotel.valid?
        expect(@hotel.errors.full_messages).to include ("Country must exist")
      end


    end

  end
end
