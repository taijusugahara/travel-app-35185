class CamboPlaneGo < ActiveHash::Base
  self.data = [
    { id: 1, name: '飛行機D', price: 17_000 },
    { id: 2, name: '飛行機E', price: 25_000 },
    { id: 3, name: '飛行機F', price: 40_000 }
  ]

  include ActiveHash::Associations
  has_many :plane_gos
end
