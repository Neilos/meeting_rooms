class CustomAttributesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_custom_attribute, only: [:show, :edit, :update, :destroy]

  # GET /custom_attributes
  # GET /custom_attributes.json
  def index
    @custom_attributes = CustomAttribute.all
  end

  # GET /custom_attributes/1
  # GET /custom_attributes/1.json
  def show
  end

  # GET /custom_attributes/new
  def new
    @custom_attribute = CustomAttribute.new
  end

  # GET /custom_attributes/1/edit
  def edit
  end

  # POST /custom_attributes
  # POST /custom_attributes.json
  def create
    @custom_attribute = CustomAttribute.new(custom_attribute_params)

    respond_to do |format|
      if @custom_attribute.save
        format.html { redirect_to @custom_attribute, notice: 'Custom attribute was successfully created.' }
        format.json { render action: 'show', status: :created, location: @custom_attribute }
      else
        format.html { render action: 'new' }
        format.json { render json: @custom_attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /custom_attributes/1
  # PATCH/PUT /custom_attributes/1.json
  def update
    respond_to do |format|
      if @custom_attribute.update(custom_attribute_params)
        format.html { redirect_to @custom_attribute, notice: 'Custom attribute was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @custom_attribute.errors, status: :unprocessable_entity }
      end
    end
  end

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
