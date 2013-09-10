class PermissionSetsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_permission_set, only: [:show, :edit, :update, :destroy]


  # GET /permission_sets/1
  # GET /permission_sets/1.json
  def show
  end


  # GET /permission_sets/1/edit
  def edit
  end

  # PATCH/PUT /permission_sets/1
  # PATCH/PUT /permission_sets/1.json
  def update
    respond_to do |format|
      if @permission_set.update(permission_set_params)
        format.html { redirect_to @permission_set, notice: 'Permission set was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @permission_set.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_permission_set
      @permission_set = PermissionSet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def permission_set_params
      params.require(:permission_set).permit(:create__organizations, :create__memberships)
    end
end
