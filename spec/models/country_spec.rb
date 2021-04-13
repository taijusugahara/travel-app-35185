require 'rails_helper'

RSpec.describe Country, type: :model do
  before do
    @country = FactoryBot.build(:country)
  end
  describe '国情報' do
    context '国情報を登録できる時' do
      it '国が記入されていれば登録できる' do
        expect(@country).to be_valid
      end
    end

    context '国情報を登録できない時' do
      it 'nameが空であれば登録できない' do
        @country.name = ''
        @country.valid?
        expect(@country.errors.full_messages).to include("Name can't be blank")
      end

      it 'userが紐付いていなければ登録できない' do
        @country.user = nil
        @country.valid?
        expect(@country.errors.full_messages).to include("User must exist")
      end
    end


  end
end