class LikesController < ApplicationController

  before_action :set_production


  def like
    @product.add_like! current_user.id
  end


  def unlike

  end

  private

  def set_prodcution
    @product = Product.find params[:product_id]
  end
end