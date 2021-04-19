class Plane < ApplicationRecord
  belongs_to :user
  belongs_to :country
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :thai_plane ||:cambo_plane ||:vet_plane
  has_one :order
 
  
  with_options presence: true do
    validates :name, :price, :go_date, :back_date
  end
  
     

    validate :date_before_start
    validate :date_before_finish
    validate  :name_price
    def date_before_start
      return if go_date.blank?
      errors.add(:go_date, "は今日以降のものを選択してください") if go_date < Date.today
    end

    def date_before_finish
      return if go_date.blank? || back_date.blank?
      errors.add(:back_date, "は出発日以降のものを選択してください") if back_date < go_date 
    end
  
    def name_price
      errors.add(:price,"料金が選択した飛行機と合致しません") unless 
      name=='飛行機A'&& price== 20000 ||name=='飛行機B'&& price==50000 || name=='飛行機C'&&price==80000||
      name=='飛行機D'&& price== 25000 ||name=='飛行機E'&& price==45000 || name=='飛行機F'&&price==100000||
      name=='飛行機G'&& price== 15000 ||name=='飛行機H'&& price==55000 || name=='飛行機I'&&price==88000
    end
end
