class ProductsController < ApplicationController
  def index
    @per_page = params[:per_page].present? ? params[:per_page].to_i : 2
    @page = params[:page].present? ? params[:page].to_i : 1

    @per = 5
    if @page - @per < 0
      @x = 1
      @y = 10
    end

    temp = @page - @per
    if temp >= 0
      @x = @page - 5
      @y = @page + 4
    end
    @y = Product.count / @per_page.ceil if @y > Product.count / @per_page.ceil

    @products = Product.limit(@per_page).offset(@per_page * (@page - 1))
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
