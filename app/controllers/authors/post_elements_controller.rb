module Authors
  class PostElementsController < AuthorsController
    before_action :set_post 
    before_action :set_post_element, only: %i[ update destroy ]

    # POST /post_elements or /post_elements.json
    def create
      @post_element = @post.post_elements.build(post_element_params)

      respond_to do |format|
        if @post_element.save
          notice = nil
        else
          notice = @post_element.errors.full_messages.join(". ") << "."
        end

        format.html {redirect_to edit_post_path(@post), notice: notice}
      end
    end

    # PATCH/PUT /post_elements/1 or /post_elements/1.json
    def update
      respond_to do |format|
        if @post_element.update(post_element_params)
          format.html { redirect_to post_element_url(@post_element), notice: "Post element was successfully updated." }
        else
          format.html { render :edit, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /post_elements/1 or /post_elements/1.json
    def destroy
      @post_element.destroy!

      respond_to do |format|
        format.html { redirect_to post_elements_url, notice: "Post element was successfully destroyed." }
      end
    end

    private
      # sets posts
      def set_post
        @post = current_author.posts.find(params[:post_id])
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_post_element
        @post_element = @post.post_elements.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def post_element_params 
        params.require(:post_element).permit(:element_type, :content )
      end
  end
end