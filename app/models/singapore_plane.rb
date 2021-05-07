class SingaporePlane < ActiveHash::Base
  self.data = [
    { id: 1, name: '飛行機M', price: 25_000 },
    { id: 2, name: '飛行機N', price: 42_000 },
    { id: 3, name: '飛行機O', price: 91_000 }
  ]

  include ActiveHash::Associations
  has_many :planes
end
