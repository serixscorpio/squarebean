class Product < ActiveRecord::Base
  attr_accessible :description, :name, :picture, :is_gluten_free
  belongs_to :product_category
end
