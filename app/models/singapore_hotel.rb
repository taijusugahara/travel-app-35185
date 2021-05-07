class SingaporeHotel < ActiveHash::Base
  self.data = [
    { id: 1, name: 'ホテルタチツテト', price: 6000 },
    { id: 2, name: 'ホテルナニヌネノ', price: 9000 },
    { id: 3, name: 'ホテルハヒフヘホ', price: 14_500 }
  ]

  include ActiveHash::Associations
  has_many :hotels
end
