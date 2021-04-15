class CamboPlane < ActiveHash::Base
  self.data = [
    { id: 1, name: '飛行機D', price: 25000},
    { id: 2, name: '飛行機E', price: 45000},
    { id: 3, name: '飛行機F', price: 100000},
  ]

  include ActiveHash::Associations
   has_many :planes


end