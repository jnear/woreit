class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :edit, :update, :destroy]

  # POST /tags
  # POST /tags.json
  def create
    # @tag = Tag.new(tag_params)
    @tag = Tag.new(:name => params[:name], :image_id => params[:image_id])
    @image = @tag.image

    respond_to do |format|
      if @tag.save
        format.js { render :layout => false }
      else
        format.js { render :layout => false }
      end
    end
  end

  # DELETE /tags/1
  # DELETE /tags/1.json
  def destroy
    @image = @tag.image
    @tag.destroy
    respond_to do |format|
      format.js { render :layout => false }      
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = Tag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tag_params
      params.require(:name).permit(:image_id)
    end
end
