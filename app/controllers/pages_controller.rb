class PagesController < ApplicationController

  def index
    @display_post = Post.published.first
    @posts = Post.published.limit(3)

    if @display_post.blank? && @posts.blank?
      redirect_to about_us_path
    end
  end

  def about_us
    @photos = Image.all
  end
  
  def photos
    header_images = Post.published.includes(header_image_attachment: :blob).map { |post| post.header_image }
    element_images = Element.joins(:post).where(posts: { published: true }).includes(image_attachment: :blob).map { |element| element.image if element.image.attached? }.compact  
    @photos = header_images + element_images
  end
end