class Admin::ProductsController < ApplicationController
  def index
  end

  def new
    @product = Product.new
    @product_categories = ProductCategory.all
  end

  def create
    @product = Product.new(params[:product])
    if @product.save
      redirect_to admin_product_path(@product.id), notice: "Added product '#{@product.name}'"
    else
      flash[:error] = "Error creating product.  Please try again."
      render :new
    end
  end

  def edit
  end

  def show
    @product = Product.find(params[:id])
  end
end
