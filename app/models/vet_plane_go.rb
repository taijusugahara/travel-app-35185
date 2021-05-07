class VetPlaneGo < ActiveHash::Base
  self.data = [
    { id: 1, name: '飛行機G', price: 10_000 },
    { id: 2, name: '飛行機H', price: 35_000 },
    { id: 3, name: '飛行機I', price: 60_000 }
  ]

  include ActiveHash::Associations
  has_many :plane_gos
end
