class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :store

  validates :offer_item, :uniqueness => true

  def self.search(query, store)
    Product.where('name LIKE ? AND store_id = ?', "%#{query.capitalize}%", store).order('sale_price')
  end
end
