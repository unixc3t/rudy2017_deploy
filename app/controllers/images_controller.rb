class ImagesController < ApplicationController
  include Productable

  def new
    @image = @product.images.new
  end

  def create
    @product.images.create(file: params[:image][:file])

    redirect_to @product
  end

  private

  def image_params
    params.require(:image).permit(:file)
  end
end
