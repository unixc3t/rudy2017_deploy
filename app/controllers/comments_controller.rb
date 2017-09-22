class CommentsController < ApplicationController
  before_action :set_product

  def index
    @comments = @product.comments
  end

  def create
    @comment = @product.comments.build(set_comment)
    if @comment.save
      if request.xhr?
        render json: @comment
      else

        redirect_to product_comments_path(@product)
      end
    else
      if request.xhr?
        render json: { errors: @comment.errors.messages }
      else
        @product.comments.delete(@comment)
        @comments = @product.comments
        render :index
      end
    end
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def set_comment
    params.require(:comment).permit(:nick, :text)
  end
end
