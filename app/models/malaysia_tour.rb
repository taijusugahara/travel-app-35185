class MalaysiaTour < ActiveHash::Base
  self.data = [
    { id: 1, name: 'ツアーJ', price: 140_000, span: 5 },
    { id: 2, name: 'ツアーK', price: 175_000, span: 7 },
    { id: 3, name: 'ツアーL', price: 235_000, span: 10 }
  ]

  include ActiveHash::Associations
  has_many :tours
end
