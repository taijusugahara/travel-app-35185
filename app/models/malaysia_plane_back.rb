class MalaysiaPlaneBack < ActiveHash::Base
  self.data = [
    { id: 1, name: '飛行機J', price: 13_000 },
    { id: 2, name: '飛行機K', price: 22_000 },
    { id: 3, name: '飛行機L', price: 30_000 }
  ]

  include ActiveHash::Associations
  has_many :plane_backs
end
