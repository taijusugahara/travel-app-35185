class CamboTour < ActiveHash::Base
  self.data = [
    { id: 1, name: 'ツアーD', price: 130_000, span: 5 },
    { id: 2, name: 'ツアーE', price: 170_000, span: 7 },
    { id: 3, name: 'ツアーF', price: 200_000, span: 10 }
  ]

  include ActiveHash::Associations
  has_many :tours
end
