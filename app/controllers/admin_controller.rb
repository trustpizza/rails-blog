class AdminController < ApplicationController
    before_action :authenticate_admin!

    def index
        @users = User.filtered_users(current_user)
        @posts = Post.all
    end

    def posts
        @posts = Post.all
        render partial: "posts"
    end

    def users
        @users = User.filtered_users(current_user)
        render partial: "users"
    end
end
