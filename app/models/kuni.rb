class Kuni < ActiveHash::Base
  self.data = [
    # { id: 1, name: '--' },
    { id: 1, name: 'タイ' },
    { id: 2, name: 'カンボジア' },
    { id: 3, name: 'ベトナム' },
  ]

  include ActiveHash::Associations
   has_many :countries


end