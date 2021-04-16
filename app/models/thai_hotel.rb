class ThaiHotel < ActiveHash::Base
  self.data = [
    { id: 1, name: 'ホテルあいうえお', price: 3000 },
    { id: 2, name: 'ホテルかきくけこ', price: 5000 },
    { id: 3, name: 'ホテルさしすせそ', price: 12000 },
  ]

  include ActiveHash::Associations
   has_many :hotels


end