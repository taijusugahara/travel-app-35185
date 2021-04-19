class CamboHotel < ActiveHash::Base
  self.data = [
    { id: 4, name: 'ホテルたちつてと', price: 4200 },
    { id: 5, name: 'ホテルなにぬねの', price: 7500 },
    { id: 6, name: 'ホテルはひふへほ', price: 15000 },
  ]

  include ActiveHash::Associations
   has_many :hotels


end