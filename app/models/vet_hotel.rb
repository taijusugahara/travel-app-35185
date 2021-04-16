class VetHotel < ActiveHash::Base
  self.data = [
    { id: 7, name: 'ホテルまみむめも', price: 500 },
    { id: 8, name: 'ホテルやゐゆゑよ', price: 1200},
    { id: 9, name: 'ホテルわゐうゑを', price: 9800 },
  ]

  include ActiveHash::Associations
   has_many :hotels


end