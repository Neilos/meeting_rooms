require 'spec_helper'

describe UsersController do

  # This should return the minimal set of attributes required to create a valid
  # Room. As you add validations to Room, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { {  name: "Mr Neil",
                              email: 'neil@example.com',
                              password: 'password',
                              password_confirmation: 'password' } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # RoomsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  context "user NOT logged in" do

    describe "GET search" do
      it "redirects to the home page" do
        get :search_by_email, {}, valid_session
        response.should redirect_to(new_user_session_path)
      end
    end

    describe "GET index" do
      it "redirects to the home page" do
        get :index, {}, valid_session
        response.should redirect_to(new_user_session_path)
      end
    end

    describe "GET show" do
      it "redirects to the home page" do
        user = User.create! valid_attributes
        get :show, {:id => user.to_param}, valid_session
        response.should redirect_to(new_user_session_path)
      end
    end

  end


  context "user logged in" do

    before (:each) do
      @user = FactoryGirl.create(:user)
      @signed_in_user = FactoryGirl.create(:user, :email => "dave@dave.com")
      sign_in @signed_in_user
    end

    describe "GET search" do
      it "assigns found users as @users" do
        user = User.create! valid_attributes
        get :search_by_email, {:email => user.email}, valid_session
        assigns(:users).should eq([user])
      end

      it "renders the search_results page" do
        user = User.create! valid_attributes
        get :search_by_email, {:email => user.email}, valid_session
        response.should render_template("search_results")
      end
    end

    describe "GET 'index'" do 
      before :each do 
        get :index
      end

      specify do
        response.should be_success
      end

      it "renders the user index page" do 
        response.should render_template(:index)
      end

      it "finds all the users" do
        assigns(:users).should == User.all
      end
    end

    describe "GET 'show'" do

      context "when a user id is specifed in the params" do

        before :each do 
          get :show, :id => @user.id
        end

        specify do
          response.should be_success
        end

        it "finds the right user" do 
          assigns(:user).should == @user 
        end

        it "renders the user show page" do 
          response.should render_template(:show) 
        end

      end

    end

  end

end
