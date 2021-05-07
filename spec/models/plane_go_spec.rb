require 'rails_helper'

RSpec.describe PlaneGo, type: :model do
  before do
    @plane = FactoryBot.build(:plane_go)
  end

  describe '飛行機' do
    context '飛行機情報を登録できる時' do
      it '正しく記入されていれば登録できる' do
        expect(@plane).to be_valid
      end
    end

    context '飛行機情報を登録できない時' do
      it 'nameが空の時登録できない' do
        @plane.name = ''
        @plane.valid?
        expect(@plane.errors.full_messages).to include("Name can't be blank")
      end

      it 'priceが空の時登録できない' do
        @plane.price = ''
        @plane.valid?
        expect(@plane.errors.full_messages).to include("Price can't be blank")
      end

      it 'howmanyが空の時登録できない' do
        @plane.howmany = ''
        @plane.valid?
        expect(@plane.errors.full_messages).to include("Howmany can't be blank")
      end

      it 'howmanyが全角の時登録できない' do
        @plane.howmany = '１２'
        @plane.valid?
        expect(@plane.errors.full_messages).to include('Howmany is not a number')
      end

      it 'howmanyが半角英語の時登録できない' do
        @plane.howmany = 'abc'
        @plane.valid?
        expect(@plane.errors.full_messages).to include('Howmany is not a number')
      end

      it 'howmanyが0以下の時登録できない' do
        @plane.howmany = 0
        @plane.valid?
        expect(@plane.errors.full_messages).to include('Howmany must be greater than or equal to 1')
      end

      it 'go_dateが空の時登録できない' do
        @plane.go_date = ''
        @plane.valid?
        expect(@plane.errors.full_messages).to include("Go date can't be blank")
      end

      it 'go_dateが今日より前の日である時登録できない' do
        @plane.go_date = '2021/4/1'
        @plane.valid?
        expect(@plane.errors.full_messages).to include('Go date は今日以降のものを選択してください')
      end

      it 'go_timeが空の時登録できない' do
        @plane.go_time = ''
        @plane.valid?
        expect(@plane.errors.full_messages).to include("Go time can't be blank")
      end

      it 'userが空の時登録できない' do
        @plane.user = nil
        @plane.valid?
        expect(@plane.errors.full_messages).to include('User must exist')
      end

      it 'countryが空の時登録できない' do
        @plane.country = nil
        @plane.valid?
        expect(@plane.errors.full_messages).to include('Country must exist')
      end
    end
  end
end
