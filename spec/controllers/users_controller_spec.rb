require 'spec_helper'

describe UsersController do

  before (:each) do
    @user = FactoryGirl.create(:user)
    @signed_in_user = FactoryGirl.create(:user, :email => "dave@dave.com")
    sign_in @signed_in_user
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

    context "when no user id supplied in the params" do
      before :each do 
        get :show
      end

      specify do
        response.should be_success
      end

      it "renders the user show page" do 
        response.should render_template(:show) 
      end

      it "should find the right user" do 
        assigns(:user).should == @signed_in_user 
      end
    end
  end




end
