class ThaiPlaneGo < ActiveHash::Base
  self.data = [
    { id: 1, name: '飛行機A', price: 15000 },
    { id: 2, name: '飛行機B', price: 20000 },
    { id: 3, name: '飛行機C', price: 30000 },
  ]

  include ActiveHash::Associations
   has_many :plane_gos


end