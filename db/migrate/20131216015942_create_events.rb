class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :highlight
      t.text :description
      t.text :more_details
      t.string :picture

      t.timestamps
    end
  end
end
