module Authors
  class PostsController < AuthorsController
    before_action :set_post, only: %i[ edit update destroy ]

    # GET /posts or /posts.json
    def index
      @posts = current_author.posts
    end

    # GET /posts/new
    def new
      @post = current_author.posts.build
    end

    # GET /posts/1/edit
    def edit
      @element = @post.post_elements.build
    end

    # POST /posts or /posts.json
    def create
      @post = current_author.posts.build(post_params)

      respond_to do |format|
        if @post.save
          format.html { redirect_to edit_post_path(@post), notice: "Post was successfully created." }
        else
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /posts/1 or /posts/1.json
    def update
      respond_to do |format|
        if @post.update(post_params)
          format.html { redirect_to edit_post_path(@post), notice: "Post was successfully updated." }
        else
          format.html { render :edit, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /posts/1 or /posts/1.json
    def destroy
      @post.destroy!

      respond_to do |format|
        format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      end
    end

    def publish
      @post = Post.find(params[:id])
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
      @post = Post.find(params[:id])
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
        @post = current_author.posts.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def post_params
        params.require(:post).permit(:title, :description, :content, :header_image)
      end
  end
end