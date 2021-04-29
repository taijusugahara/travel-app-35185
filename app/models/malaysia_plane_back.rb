class MalaysiaPlaneBack < ActiveHash::Base
  self.data = [
    { id: 1, name: '飛行機J', price: 13000},
    { id: 2, name: '飛行機K', price: 22000},
    { id: 3, name: '飛行機L', price: 30000},
  ]

  include ActiveHash::Associations
   has_many :plane_backs


end