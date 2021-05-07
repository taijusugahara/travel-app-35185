class VetTour < ActiveHash::Base
  self.data = [
    { id: 1, name: 'ツアーG', price: 150_000, span: 5 },
    { id: 2, name: 'ツアーH', price: 190_000, span: 7 },
    { id: 3, name: 'ツアーI', price: 260_000, span: 10 }
  ]

  include ActiveHash::Associations
  has_many :tours
end
