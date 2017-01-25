class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :store

  validates :offer_item, :uniqueness => true

  def self.search(query, store)
    format_query = query.split.map(&:capitalize).join(' ')
    puts format_query
    Product.where("name LIKE ? AND store_id = ?", "%#{format_query}%", "#{store}").order('reg_price', 'sale_price')
  end
end
