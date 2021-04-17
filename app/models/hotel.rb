class Hotel < ApplicationRecord
  belongs_to :user
  belongs_to :country 
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :thai_hotel ||:cambo_hotel ||:vet_hotel

  with_options presence: true do
    validates :name, :price, :go_date, :back_date
     with_options numericality: { greater_than_or_equal_to: 1} do
      validates :day
     end
  end
  
     

    validate :date_before_start
    validate :date_before_finish
    validate :date_relate_day
    validate :name_price
    def date_before_start
      return if go_date.blank?
      errors.add(:go_date, "は今日以降のものを選択してください") if go_date < Date.today
    end

    def date_before_finish
      return if go_date.blank? || back_date.blank?
      errors.add(:back_date, "は到着日以降のものを選択してください") if back_date < go_date
    end

    def date_relate_day
      return if go_date.blank? || back_date.blank?
      errors.add(:day,"宿泊日数が選択した日程と合致しません") if back_date - go_date != day
    end

    def name_price
      errors.add(:price,"料金が選択したホテルと合致しません") unless 
      name=='ホテルあいうえお'&& price== 3000 ||name=='ホテルかきくけこ'&& price==5000 || name=='ホテルさしすせそ'&&price==12000||
      name=='ホテルたちつてと'&& price== 4200 ||name=='ホテルなにぬねの'&& price==7500 || name=='ホテルはひふへほ'&&price==15000||
      name=='ホテルまみむめも'&& price== 500 ||name=='ホテルやゐゆゑよ'&& price==1200 || name=='ホテルわゐうゑを'&&price==9800
     
    end
end
