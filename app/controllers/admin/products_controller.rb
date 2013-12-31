class Admin::ProductsController < ApplicationController
  def index
    @categories = ProductCategory.includes(:products)
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
    @product = Product.find(params[:id])
    @product_categories = ProductCategory.all
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(params[:product])
      redirect_to admin_product_path(@product.id), notice: "Updated product '#{@product.name}'"
    else
      flash[:error] = "Error updating product.  Please try again."
      render :edit
    end
  end

  def show
    @product = Product.find(params[:id])
    @product_category = @product.product_category
  end

  def destroy
    @product = Product.find(params[:id])
    if @product.destroy
      flash[:notice] = "Deleted product '#{@product.name}'"
    else
      flash[:error] = "Error deleting product. Please try again."
    end
    redirect_to admin_products_path
  end
end
