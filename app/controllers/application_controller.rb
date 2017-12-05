class ApplicationController < ActionController::Base
  include Pundit


  before_action :set_locale
  before_action :authenticate_user!
  protect_from_forgery with: :exception
  rescue_from Pundit::NotAuthorizedError do
    redirect_to root_path
  end


  def set_locale
    params[:lang].try do |lang|
      if lang
        p lang
      else
        p 'lang is nil'
      end
    end
  end
end
