module Readers
    class PostsController < ReadersController
      before_action :set_post, only: %i[ show ]
  
      def index
        @posts = Post.published
      end
    
      def show
      end
    
      private
    
      def set_post
        @post = Post.friendly.find(params[:id])
      end
    end
  end
  