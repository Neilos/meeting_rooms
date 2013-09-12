class RoomsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_room, only: [:show, :edit, :update, :destroy]

  # GET /rooms
  # GET /rooms.json
  def index
    @rooms = Room.all
  end

  # GET /rooms/1
  # GET /rooms/1.json
  def show
  end

  # GET /rooms/new
  def new
    @room = Room.new
    @organization = Organization.find(params[:organization_id])
  end

  # GET /rooms/1/edit
  def edit
    @room = Room.find(params[:id])
    @organization = @room.organization
  end

  # POST /rooms
  # POST /rooms.json
  def create
    @room = Room.new(room_params)
    @organization = @room.organization
    respond_to do |format|
      if @room.save
        format.html { redirect_to organization_path(@organization), notice: 'Room was successfully created.' }
        format.json { render action: 'show', status: :created, location: @room }
      else
        format.html { render action: 'new' }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rooms/1
  # PATCH/PUT /rooms/1.json
  def update
    @organization = @room.organization
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to organization_path(@organization), notice: 'Room was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1
  # DELETE /rooms/1.json
  def destroy
    @room.destroy
    respond_to do |format|
      format.html { redirect_to organization_path(@room.organization), notice: 'Room was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_params
      params.require(:room).permit(:name, :price_per_hour, :location_id, :organization_id, :people_capacity)
    end
end
