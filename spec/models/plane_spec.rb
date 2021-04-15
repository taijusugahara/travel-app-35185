require 'rails_helper'

RSpec.describe Plane, type: :model do
  before do
    @plane = FactoryBot.build(:plane)
  end
  describe '飛行機' do
    context '飛行機情報を登録できる時' do
      it '正しく記入されていれば登録できる' do
        expect(@plane).to be_valid
      end
    end

    context '飛行機情報を登録できない時' do
      it 'country_plane_idが空の時登録できない' do
        @plane.country_plane_id = ''
        @plane.valid?
        expect(@plane.errors.full_messages).to include ("Country plane can't be blank")
      end

      it 'go_dateが空の時登録できない' do
        @plane.go_date = ''
        @plane.valid?
        expect(@plane.errors.full_messages).to include ("Go date can't be blank")
      end

      it 'back_dateが空の時登録できない' do
        @plane.back_date = ''
        @plane.valid?
        expect(@plane.errors.full_messages).to include ("Back date can't be blank")
      end

      it 'go_dateが今日より前の日である時登録できない' do
        @plane.go_date = '2021/4/1'
        @plane.valid?
        expect(@plane.errors.full_messages).to include ("Go date は今日以降のものを選択してください")
      end

      it 'back_dateが今日より前の日である時登録できない' do
        @plane.back_date = '2021/4/1'
        @plane.valid?
        expect(@plane.errors.full_messages).to include ("Back date は出発日以降のものを選択してください")
      end

      it 'back_dateがgo_dateより前の日である時登録できない' do
        @plane.go_date = '2021/6/1'
        @plane.back_date = '2021/5/1'
        @plane.valid?
        expect(@plane.errors.full_messages).to include ("Back date は出発日以降のものを選択してください")
      end

      it 'userが空の時登録できない' do
        @plane.user = nil
        @plane.valid?
        expect(@plane.errors.full_messages).to include ("User must exist")
      end

      it 'countryが空の時登録できない' do
        @plane.country = nil
        @plane.valid?
        expect(@plane.errors.full_messages).to include ("Country must exist")
      end
    end
  end
end
