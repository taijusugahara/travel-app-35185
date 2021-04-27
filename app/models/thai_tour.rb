class ThaiTour < ActiveHash::Base
  self.data = [
    { id: 1, name: 'ツアーA', price: 100000, span: 5},
    { id: 2, name: 'ツアーB', price: 150000, span: 7 },
    { id: 3, name: 'ツアーC', price: 120000, span: 10 },
  ]

  include ActiveHash::Associations
   has_many :tours


end