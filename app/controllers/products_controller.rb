class ProductsController < ApplicationController
  def index
    @products = Product.all
    @cakes = Product.joins(:product_category).where(product_categories: {name: 'Cake'})
    @special_items = Product.joins(:product_category).where(product_categories: {name: 'Special Item'})
  end
end
