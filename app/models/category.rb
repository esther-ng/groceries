class Category < ActiveRecord::Base
  has_many :products
  validates :name, :uniqueness => true
end
