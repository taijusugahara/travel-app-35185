class Order < ApplicationRecord
  belongs_to :user
  belongs_to :country
  # belongs_to :plane || :hotel
  # belongs_to :hotel || :plane
  has_one :info
end
