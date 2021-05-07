class VetPlaneBack < ActiveHash::Base
  self.data = [
    { id: 1, name: '飛行機G', price: 11_000 },
    { id: 2, name: '飛行機H', price: 27_000 },
    { id: 3, name: '飛行機I', price: 40_000 }
  ]

  include ActiveHash::Associations
  has_many :plane_backs
end
