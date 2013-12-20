class OrganizationsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_organization, only: [:show, :edit, :update, :destroy]

  # GET /organizations
  # GET /organizations.json
  def index
    @organizations = Organization.all
  end

  def search_by_name
    @organizations = Organization.where('name like ?', "%#{params[:name]}%")
    render 'search_results', :layout => false
  end

  # GET /organizations/1
  # GET /organizations/1.json
  def show
    @organization = Organization.find(params[:id])
    @locations = @organization.locations.sort_by{ |l| l.name.upcase }
    @memberships = @organization.memberships.sort_by{ |m| m.user.name.upcase }
    @rooms = @organization.rooms.sort_by{ |r| r.name.upcase }
  end

  # GET /organizations/new
  def new
    @organization = Organization.new
  end

  # GET /organizations/1/edit
  def edit
  end

  # POST /organizations
  # POST /organizations.json
  def create
    @organization = Organization.new(organization_params)
    respond_to do |format|
      if @organization.save
        permission_set = PermissionSet.get_admin_permission_set
        permission_set.save
        membership = Membership.create(permission_set_id: permission_set.id, 
                                        user_id: current_user.id, 
                                        organization_id: @organization.id)
        format.html { redirect_to user_memberships_path(current_user), success: 'Organization was successfully created.' }
        format.json { render action: 'show', status: :created, location: @organization }
      else
        format.html { render action: 'new' }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /organizations/1
  # PATCH/PUT /organizations/1.json
  def update
    respond_to do |format|
      if @organization.update(organization_params)
        format.html { redirect_to @organization, success: 'Organization was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organizations/1
  # DELETE /organizations/1.json
  def destroy
    @organization.destroy
    respond_to do |format|
      format.html { redirect_to user_memberships_path(current_user) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organization
      @organization = Organization.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def organization_params
      params.require(:organization).permit(:name)
    end
end
