module Readers 
  class PhotosController < ReadersController
    def index
      @posts = Post.all.sample(12)
    end

    private
  end
end