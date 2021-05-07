class ThaiPlaneGo < ActiveHash::Base
  self.data = [
    { id: 1, name: '飛行機A', price: 15_000 },
    { id: 2, name: '飛行機B', price: 20_000 },
    { id: 3, name: '飛行機C', price: 30_000 }
  ]

  include ActiveHash::Associations
  has_many :plane_gos
end
