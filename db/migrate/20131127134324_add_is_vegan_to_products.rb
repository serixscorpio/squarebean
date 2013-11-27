class AddIsVeganToProducts < ActiveRecord::Migration
  def change
    add_column :products, :is_vegan, :boolean
  end
end
