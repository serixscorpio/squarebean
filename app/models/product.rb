class Product < ActiveRecord::Base
  attr_accessible :description, :name, :product_category_id, :is_gluten_free, :is_dairy_free, :is_vegan, :unit_quantity, :price, :display_order, :product_pictures_attributes
  belongs_to :product_category
  default_scope order('display_order asc')
  has_many :product_pictures
  accepts_nested_attributes_for :product_pictures, allow_destroy: true
  validates :name, presence: true, uniqueness: true
  validates_associated :product_category
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :display_order, numericality: { only_integer: true }
end
