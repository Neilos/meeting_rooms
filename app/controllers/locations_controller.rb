class LocationsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_location, only: [:show, :edit, :update, :destroy]

  # GET /locations/1
  # GET /locations/1.json
  def show
  end

  # GET /locations/new
  def new
    @location = Location.new
    @organization = Organization.find(params[:organization_id])
  end

  # GET /locations/1/edit
  def edit
    @location = Location.find(params[:id])
    @organization = @location.organization
  end

  # POST /locations
  # POST /locations.json
  def create
    @location = Location.new(location_params)
    @organization = @location.organization
    respond_to do |format|
      if @location.save
        format.html { redirect_to organization_path(@organization), success: 'Location was successfully created.' }
        format.json { render action: 'show', status: :created, location: @location }
      else
        format.html { render action: 'new' }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /locations/1
  # PATCH/PUT /locations/1.json
  def update
    @organization = @location.organization
    respond_to do |format|
      if @location.update(location_params)
        format.html { redirect_to organization_path(@organization), success: 'Location was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.json
  def destroy
    organization_id = @location.organization_id
    @location.destroy
    respond_to do |format|
      format.html { redirect_to organization_path(organization_id), success: 'Location was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @location = Location.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def location_params
      params.require(:location).permit(:name, :address_line_1, :address_line_2, :town_city, :county, :postcode, :country, :organization_id)
    end
end
