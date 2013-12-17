class ChangeEventCategoryInEvent < ActiveRecord::Migration
  def change 
    rename_column :events, :event_category, :event_category_id
  end
end
