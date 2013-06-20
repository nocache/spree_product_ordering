class AddPositionToProducts < ActiveRecord::Migration
  def self.up
    add_column Spree::Products.table_name, :position, :integer
  end

  def self.down
    remove_column Spree::Products.table_name, :position
  end
end
