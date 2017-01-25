class ChangeIntegerLimit < ActiveRecord::Migration
  def change
    change_column :products, :offer_item, :integer, limit: 8
  end
end
