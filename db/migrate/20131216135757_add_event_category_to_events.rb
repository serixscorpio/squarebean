class AddEventCategoryToEvents < ActiveRecord::Migration
  def change
    add_column :events, :event_category, :integer
    add_index :events, :event_category
  end
end
