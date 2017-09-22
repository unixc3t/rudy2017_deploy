class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new
    @product.name = params[:product][:name]
    @product.price = params[:product][:price]

    @product.save

    redirect_to products_path
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    if request.xhr?
      head :no_content
    else
      redirect_to products_path
    end
  end
end
