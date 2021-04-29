class SingaporePlaneGo < ActiveHash::Base
  self.data = [
    { id: 1, name: '飛行機M', price: 19000},
    { id: 2, name: '飛行機N', price: 35000},
    { id: 3, name: '飛行機O', price: 50000},
  ]

  include ActiveHash::Associations
   has_many :plane_gos


end