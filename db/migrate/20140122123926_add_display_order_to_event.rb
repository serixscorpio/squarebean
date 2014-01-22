class AddDisplayOrderToEvent < ActiveRecord::Migration
  def change
    add_column :events, :display_order, :integer
  end
end
