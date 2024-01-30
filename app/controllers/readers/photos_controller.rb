module Readers 
  class PhotosController < ReadersController
    def index
      @posts = Post.all.sample(9)
    end

    private
  end
end