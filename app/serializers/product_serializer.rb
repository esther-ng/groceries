class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :sale_price, :reg_price, :conditions, :valid_from, :valid_til, :img_url, :description, :store_id

end
