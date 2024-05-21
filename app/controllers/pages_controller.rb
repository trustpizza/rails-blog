class PagesController < ApplicationController

  def index
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
end
