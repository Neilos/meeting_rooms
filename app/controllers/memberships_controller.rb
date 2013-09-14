class MembershipsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_membership, only: [:show, :edit, :update, :destroy]

  # GET /memberships/1
  # GET /memberships/1.json
  def show
  end

  # GET /memberships/new
  def new
    @membership = Membership.new(:user_id => params[:user_id], :organization_id => params[:organization_id])
    @permission_set = PermissionSet.get_admin_permission_set
    session[:previous_url] = request.referer
  end

  # GET /memberships/1/edit
  def edit
  end

  # POST /memberships
  # POST /memberships.json
  def create
    @permission_set = PermissionSet.where(params[:permission_set]).first_or_create
    mparams = membership_params.merge(permission_set_id: @permission_set.id)
    @membership = Membership.new(mparams)
    respond_to do |format|
      if @membership.save
        format.html { redirect_to session[:previous_url], notice: 'Membership was successfully created.' }
        format.json { render action: 'show', status: :created, location: @membership }
      else
        format.html { render action: 'new' }
        format.json { render json: @membership.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /memberships/1
  # PATCH/PUT /memberships/1.json
  def update
    respond_to do |format|
      if @membership.update(membership_params)
        format.html { redirect_to @membership, notice: 'Membership was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @membership.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /memberships/1
  # DELETE /memberships/1.json
  def destroy
    @membership.destroy
    respond_to do |format|
      format.html { redirect_to(:back) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_membership
      @membership = Membership.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def membership_params
      params.require(:membership).permit(:user_id, :organization_id, :permission_set_id)
    end
end
