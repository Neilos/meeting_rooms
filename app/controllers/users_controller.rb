class UsersController < ApplicationController
	before_filter :authenticate_user!

	  def index
	    @users = User.all
	  end

	  def show
	  	user_id = params[:id] || current_user.id
	    @user = User.find(user_id)
	  end
end
