class SingaporePlaneGo < ActiveHash::Base
  self.data = [
    { id: 1, name: '飛行機M', price: 19_000 },
    { id: 2, name: '飛行機N', price: 35_000 },
    { id: 3, name: '飛行機O', price: 50_000 }
  ]

  include ActiveHash::Associations
  has_many :plane_gos
end
