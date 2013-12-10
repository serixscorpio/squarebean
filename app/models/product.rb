class Product < ActiveRecord::Base
  attr_accessible :description, :name, :picture, :product_category_id, :is_gluten_free, :is_dairy_free, :is_vegan
  belongs_to :product_category
  mount_uploader :picture, PictureUploader
end
