class LikesController < ApplicationController

  before_action :set_resource


  def like
    @result= @resource.add_like! current_user
  end


  def unlike
    @result= @resource.unlike!(current_user)
  end

  private

  def set_resource
    @resource = Product.find params[:product_id] if params[:product_id].present?
  end
end