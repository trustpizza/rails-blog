class PagesController < ApplicationController
  before_action :authenticate_admin!, except: %i[ home ] 
  def home
    @posts = Post.all
  end

  def admin
    @users = User.all
    @posts = Post.all
  end

  private

  def authenticate_admin!
    unless current_user && current_user.is_admin?
      redirect_to new_user_session_path
    end
  end

end
