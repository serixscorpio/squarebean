class RemovePictureFromProduct < ActiveRecord::Migration
  def up
    remove_column :products, :picture
  end

  def down
    add_column :products, :picture, :string
  end
end
