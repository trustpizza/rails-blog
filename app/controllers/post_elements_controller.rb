class PostElementsController < ApplicationController
  before_action :set_post_element, only: %i[ show edit update destroy ]

  # GET /post_elements or /post_elements.json
  def index
    @post_elements = PostElement.all
  end

  # GET /post_elements/1 or /post_elements/1.json
  def show
  end

  # GET /post_elements/new
  def new
    @post_element = PostElement.new
  end

  # GET /post_elements/1/edit
  def edit
  end

  # POST /post_elements or /post_elements.json
  def create
    @post_element = PostElement.new(post_element_params)

    respond_to do |format|
      if @post_element.save
        format.html { redirect_to post_element_url(@post_element), notice: "Post element was successfully created." }
        format.json { render :show, status: :created, location: @post_element }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post_element.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /post_elements/1 or /post_elements/1.json
  def update
    respond_to do |format|
      if @post_element.update(post_element_params)
        format.html { redirect_to post_element_url(@post_element), notice: "Post element was successfully updated." }
        format.json { render :show, status: :ok, location: @post_element }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post_element.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /post_elements/1 or /post_elements/1.json
  def destroy
    @post_element.destroy!

    respond_to do |format|
      format.html { redirect_to post_elements_url, notice: "Post element was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post_element
      @post_element = PostElement.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_element_params
      params.require(:post_element).permit(:element_type, :content, :post_id, :position)
    end
end
