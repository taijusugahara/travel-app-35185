class CamboPlaneBack < ActiveHash::Base
  self.data = [
    { id: 1, name: '飛行機D', price: 27000},
    { id: 2, name: '飛行機E', price: 35000},
    { id: 3, name: '飛行機F', price: 44000},
  ]

  include ActiveHash::Associations
   has_many :plane_backs


end