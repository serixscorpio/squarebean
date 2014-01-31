class AddUnitQuantityToProduct < ActiveRecord::Migration
  def change
    add_column :products, :unit_quantity, :string
  end
end
