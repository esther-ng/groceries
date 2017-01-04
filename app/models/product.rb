class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :store

  def self.search(query, store)
    Product.where('name LIKE ? AND store_id = ?', "%#{query}%", store)
  end
end
