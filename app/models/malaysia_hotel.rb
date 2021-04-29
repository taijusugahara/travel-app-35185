class MalaysiaHotel < ActiveHash::Base
  self.data = [
    { id: 1, name: 'ホテルアイウエオ', price: 1200 },
    { id: 2, name: 'ホテルカキクケコ', price: 3300},
    { id: 3, name: 'ホテルサシスセソ', price: 7500 },
  ]

  include ActiveHash::Associations
   has_many :hotels


end