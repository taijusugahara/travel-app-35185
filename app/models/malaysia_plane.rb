class MalaysiaPlane < ActiveHash::Base
  self.data = [
    { id: 1, name: '飛行機J', price: 33000},
    { id: 2, name: '飛行機K', price: 58000},
    { id: 3, name: '飛行機L', price: 78000},
  ]

  include ActiveHash::Associations
   has_many :planes


end