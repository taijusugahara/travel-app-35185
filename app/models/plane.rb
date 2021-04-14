class Plane < ApplicationRecord
  belongs_to :user
  belongs_to :country
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :thai_plane ||:cambo_plane ||:vet_plane

 
  
  with_options presence: true do
    validates :country_plane_id, :go_date, :back_date
  end
  
     

    validate :date_before_start
    validate :date_before_finish

    def date_before_start
      return if go_date.blank?
      errors.add(:go_date, "は今日以降のものを選択してください") if go_date < Date.today
    end

    def date_before_finish
      return if go_date.blank? || back_date.blank?
      errors.add(:back_date, "は出発日以降のものを選択してください") if back_date < go_date
      
    end
  
end
