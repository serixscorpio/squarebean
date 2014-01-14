class CreateProductPictures < ActiveRecord::Migration
  def change
    create_table :product_pictures do |t|
      t.string :path
      t.integer :display_order
      t.references :product

      t.timestamps
    end
    add_index :product_pictures, :product_id
  end
end
