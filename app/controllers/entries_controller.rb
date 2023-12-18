class EntriesController < ApplicationController
  layout 'entries'

  def home
  end
  
  def index
    @posts = Post.all
  end

  def show
  end
end
