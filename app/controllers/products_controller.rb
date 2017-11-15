class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, raise: false, only: [:index]
  before_action :set_product, only: [:edit, :show, :update, :destroy]
  before_action :incr_view, only: [:show]

  def index
    @per_page = params[:per_page].present? ? params[:per_page].to_i : 3
    @page = params[:page].present? ? params[:page].to_i : 1


    @products = Product.page(@page).per(@per_page).order('view_count DESC')
    respond_to do |format|
      format.html
      format.json {
        render json: @products
      }
    end
  end


  def show
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def update
    @product.update(product_params)
    redirect_to @product
  end

  def create
    Product.create(product_params)
    redirect_to products_path
  end

  def destroy
    if @product.user =current_user
      @product.destroy
      if request.xhr?
        head :no_content
      else
        redirect_to products_path
      end
    end
  end

  private

  def incr_view
    @product.view.increment
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :price, images_attributes: [:id, :file, :_destroy])
  end

end
