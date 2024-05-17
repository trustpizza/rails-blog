class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy publish unpublish ]
  before_action :authenticate_admin!, only: %i[ edit update destroy create new ]

  # GET /posts or /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1 or /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    @element = @post.elements.new
  end

  # POST /posts or /posts.json
  def create
    @post = current_user.posts.build(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy!

    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def publish
    respond_to do |format|
      if @post.update(published: true, published_at: Time.now)
        format.html { redirect_to edit_post_path(@post), notice: "Post was successfully published"}
      else
        notice = @post.errors.full_messages.join(". ") << "."
        format.html { redirect_to edit_post_path(@post), notice: notice}
      end
    end
  end
  
  def unpublish
    respond_to do |format|
      if @post.update(published: false,  published_at: nil)
        format.html { redirect_to edit_post_path(@post), notice: "Post was successfully published"}
      else
        notice = @post.errors.full_messages.join(". ") << "."
        format.html { redirect_to edit_post_path(@post), notice: notice}
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :body, :description, :header_image)
    end

    def authenticate_admin!
      unless current_user && current_user.is_admin?
        redirect_to root_path, alert: "You aren't an admin"
      end
    end
end