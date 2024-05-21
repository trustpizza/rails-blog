class AdminController < ApplicationController
    def index
        @users = User.filtered_users(current_user)
        @posts = Post.all
    end

    def posts
    end

    def users
    end
end
