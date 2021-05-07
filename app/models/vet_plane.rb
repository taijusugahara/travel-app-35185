class VetPlane < ActiveHash::Base
  self.data = [
    { id: 1, name: '飛行機G', price: 15_000 },
    { id: 2, name: '飛行機H', price: 55_000 },
    { id: 3, name: '飛行機I', price: 88_000 }
  ]

  include ActiveHash::Associations
  has_many :planes
end
