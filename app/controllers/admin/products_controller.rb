class Admin::ProductsController < ApplicationController
  def index
  end

  def new
    @product = Product.new
    @product_categories = ProductCategory.all
  end

  def edit
  end

  def show
  end
end
