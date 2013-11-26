class Product < ActiveRecord::Base
  attr_accessible :description, :name, :picture
  belongs_to :product_category
end
