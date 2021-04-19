class Country < ApplicationRecord
 belongs_to :user
 extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :kuni
 has_one :plane, dependent: :destroy
 has_one :hotel, dependent: :destroy
 has_one :order
  with_options presence: true do
    
      validates :name

    end
  
end
