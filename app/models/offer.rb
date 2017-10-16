class Offer < ActiveRecord::Base
  has_many :hotels
  has_many :transports
  has_many :services
  has_many :prices
end
