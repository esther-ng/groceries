class Store < ActiveRecord::Base
  has_many :products
  validates :address, :uniqueness => true
end
