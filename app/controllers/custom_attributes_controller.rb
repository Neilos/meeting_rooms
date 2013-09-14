class CustomAttributesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_custom_attribute, only: [:destroy]

  # DELETE /custom_attributes/1
  # DELETE /custom_attributes/1.json
  def destroy
    @custom_attribute.destroy
    render :text => 'Deleted successfully'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_custom_attribute
      @custom_attribute = CustomAttribute.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def custom_attribute_params
      params.require(:custom_attribute).permit(:name, :value, :room_id)
    end
end
