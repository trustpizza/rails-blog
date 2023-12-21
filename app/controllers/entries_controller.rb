class EntriesController < ApplicationController
  layout 'entries'
  before_action :set_post, only: %i[ show ]

  def home
  end
  
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
