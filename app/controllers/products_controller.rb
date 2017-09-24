class ProductsController < ApplicationController
  def index
    @per_page = params[:per_page].present? ? params[:per_page].to_i : 3
    @page = params[:page].present? ? params[:page].to_i : 1


    @products = Product.page(@page).per(@per_page)
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
