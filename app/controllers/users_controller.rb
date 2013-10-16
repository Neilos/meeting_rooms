class UsersController < ApplicationController
	before_filter :authenticate_user!

	  def index
	    @users = User.all
	  end

	  def show
	  	user_id = params[:id] || current_user.id
	    @user = User.find(user_id)
	    @memberships = @user.memberships.sort_by{ |m| m.organization.name.upcase }
	  end

	  def search_by_email
	    @users = User.where('email like ?', "%#{params[:email]}%")
	    render 'search_results', :layout => false
  	end

end
