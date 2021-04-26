class PlaneGo < ApplicationRecord
  belongs_to :user
  belongs_to :country
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :thai_plane_go ||:cambo_plane_go ||:vet_plane_go

  with_options presence: true do
    validates :name, :price, :go_date, :go_time
    with_options numericality: { greater_than_or_equal_to: 1} do
      validates :howmany
    end
  end
  
     

    validate :date_before_start
    validate  :name_price
    def date_before_start
      return if go_date.blank?
      errors.add(:go_date, "は今日以降のものを選択してください") if go_date < Date.today
    end
  
    def name_price
      errors.add(:price,"料金が選択した飛行機と合致しません") unless 
      name=='飛行機A'&& price== 15000 ||name=='飛行機B'&& price==20000 || name=='飛行機C'&&price==30000||
      name=='飛行機D'&& price== 17000 ||name=='飛行機E'&& price==25000 || name=='飛行機F'&&price==40000||
      name=='飛行機G'&& price== 10000 ||name=='飛行機H'&& price==35000 || name=='飛行機I'&&price==60000
    end


end
