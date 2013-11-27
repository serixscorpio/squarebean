class AddIsDairyFreeToProducts < ActiveRecord::Migration
  def change
    add_column :products, :is_dairy_free, :boolean
  end
end
