class EntriesController < ApplicationController
  layout 'entries'

  def home
  end
  
  def index
    @posts = Post.published
  end

  def show
  end
end
