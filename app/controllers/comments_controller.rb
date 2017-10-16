class CommentsController < ApplicationController
  include Productable

  def index
    @comments = @product.comments
  end


  def destroy
    @comment = @product.comments.find_by(id: params[:id], user: current_user)
    @comment.destroy if @comment.present?
    head :no_content
  end

  def create
    @comment = @product.comments.build(set_comment)
    @comment.user= current_user
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

  def set_comment
    params.require(:comment).permit(:text)
  end
end
