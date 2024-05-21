class PagesController < ApplicationController
  before_action :authenticate_admin!, only: %i[ admin ] 
  def home
    @display_post = Post.first
    @posts = Post.limit(3)
  end

  def about_us
  end

  def photos
    header_images = Post.includes(header_image_attachment: :blob).map { |post| post.header_image }
    element_images = Element.includes(image_attachment: :blob).map { |element| element.image if element.image.attached? }.compact
    @photos = header_images + element_images
  end

  def admin
    @users = User.all
    @posts = Post.all
  end

  private

  # def authenticate_admin!
  #   unless current_user && current_user.is_admin?
  #     redirect_to new_user_session_path
  #   end
  # end

end
