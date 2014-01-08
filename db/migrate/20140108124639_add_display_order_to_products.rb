class AddDisplayOrderToProducts < ActiveRecord::Migration
  def change
    add_column :products, :display_order, :integer
  end
end
