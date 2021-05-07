class ThaiPlane < ActiveHash::Base
  self.data = [
    { id: 1, name: '飛行機A', price: 20_000 },
    { id: 2, name: '飛行機B', price: 50_000 },
    { id: 3, name: '飛行機C', price: 80_000 }
  ]

  include ActiveHash::Associations
  has_many :planes
end
