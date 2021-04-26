class Timehour < ActiveHash::Base
  self.data = [
    { id: 1, name: '00:00' },
    { id: 2, name: '03:00' },
    { id: 3, name: '06:00' },
    { id: 4, name: '09:00' },
    { id: 5, name: '12:00' },
    { id: 6, name: '15:00' },
    { id: 7, name: '18:00' },
    { id: 8, name: '21:00' },
  ]

  include ActiveHash::Associations
   has_many :planes


end