class StoreSerializer < ActiveModel::Serializer
  attributes :address, :city, :phone, :state, :zip, :id, :name

end
