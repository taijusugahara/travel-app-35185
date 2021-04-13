class Country < ApplicationRecord
 belongs_to :user
 extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :kuni

  with_options presence: true do
    
      validates :name

    end
  
end
