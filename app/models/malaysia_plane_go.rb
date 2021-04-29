class MalaysiaPlaneGo < ActiveHash::Base
  self.data = [
    { id: 1, name: '飛行機J', price: 16000},
    { id: 2, name: '飛行機K', price: 28000},
    { id: 3, name: '飛行機L', price: 40000},
  ]

  include ActiveHash::Associations
   has_many :plane_gos


end