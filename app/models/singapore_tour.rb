class SingaporeTour < ActiveHash::Base
  self.data = [
    { id: 1, name: 'ツアーM', price: 170_000, span: 5 },
    { id: 2, name: 'ツアーN', price: 185_000, span: 7 },
    { id: 3, name: 'ツアーO', price: 290_000, span: 10 }
  ]

  include ActiveHash::Associations
  has_many :tours
end
