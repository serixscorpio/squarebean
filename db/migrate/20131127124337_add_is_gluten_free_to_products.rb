class AddIsGlutenFreeToProducts < ActiveRecord::Migration
  def change
    add_column :products, :is_gluten_free, :boolean
  end
end
