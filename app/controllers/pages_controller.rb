class PagesController < ApplicationController
    def home
    end

    def entries
        @posts = Post.published.most_recently_published
    end
end
