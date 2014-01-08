class Product < ActiveRecord::Base
  attr_accessible :description, :name, :picture, :product_category_id, :is_gluten_free, :is_dairy_free, :is_vegan, :display_order
  belongs_to :product_category
  mount_uploader :picture, PictureUploader
  default_scope order('display_order asc')
end
