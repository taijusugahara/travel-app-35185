class ThaiPlaneBack < ActiveHash::Base
  self.data = [
    { id: 1, name: '飛行機A', price: 18000 },
    { id: 2, name: '飛行機B', price: 22000 },
    { id: 3, name: '飛行機C', price: 33000 },
  ]

  include ActiveHash::Associations
   has_many :plane_backs


end