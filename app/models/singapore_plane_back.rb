class SingaporePlaneBack < ActiveHash::Base
  self.data = [
    { id: 1, name: '飛行機M', price: 21000},
    { id: 2, name: '飛行機N', price: 28000},
    { id: 3, name: '飛行機O', price: 48000},
  ]

  include ActiveHash::Associations
   has_many :plane_backs


end