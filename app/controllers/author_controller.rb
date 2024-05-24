class AuthorController < ApplicationController
    before_action :authenticate_author!

    def index
        @posts = Post.where(user_id: current_user.id)
    end

    def user_posts
        @posts = Post.where(user_id: current_user.id)
        render partial: "user_posts"
    end
end
