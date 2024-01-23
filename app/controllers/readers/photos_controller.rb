module Readers 
  class PhotosController < ReadersController
    def index
      @photos = get_photos(Post.all)
      puts @photos
    end

    private

    def get_photos(posts)
      photos = []

      posts.each do |post|
        photos << post.header_image
      end
      
      photos
    end
  end
end