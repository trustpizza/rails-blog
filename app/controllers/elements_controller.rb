  class ElementsController < ApplicationController
    before_action :set_post
    before_action :set_element, only: %i[ update destroy move ]

    # POST /elements or /elements.json
    def create
      @element = @post.elements.build(element_params)

      respond_to do |format|
        if @element.save
          format.html { redirect_to edit_post_path(@post), notice: "Element was successfully created." }
          format.json { render :show, status: :created, location: @element }
        else
          notice = "The following errors occured: #{@element.errors.full_messages}"
          format.html { redirect_to edit_post_path(@post), notice: notice}
          format.json { render json: @element.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /elements/1 or /elements/1.json
    def update
      respond_to do |format|
        if @element.update(element_params)
          format.html { redirect_to edit_post_path(@post), notice: "Element was successfully updated." }
          format.json { render :show, status: :ok, location: @element }
        else
          notice = "The following errors occured: #{@element.errors.full_messages}"
          format.html { redirect_to edit_post_path(@post), status: :unprocessable_entity, notice: notice }
          format.json { render json: @element.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /elements/1 or /elements/1.json
    def destroy
      @element.destroy!

      respond_to do |format|
        format.html { redirect_to edit_post_path(@post), notice: "Element was successfully destroyed." }
        format.json { head :no_content }
      end
    end

    def move
      system('clear')
      puts(@element.position)
      @element.insert_at(params[:position].to_i)
      head :ok

      puts(@element.position)
    end
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_element
        @element = @post.elements.find(params[:id])
      end

      def set_post
        @post = Post.find(params[:post_id])
      end

      # Only allow a list of trusted parameters through.
      def element_params
        params.require(:element).permit(:element_type, :content, :image)
      end
  end
