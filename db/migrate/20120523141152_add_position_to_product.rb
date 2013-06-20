class AddPositionToProduct < ActiveRecord::Migration
  def change
    add_column Spree::Product.table_name, :position, :integer
  end
end
