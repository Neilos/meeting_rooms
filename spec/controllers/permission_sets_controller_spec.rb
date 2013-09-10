require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe PermissionSetsController do

  # This should return the minimal set of attributes required to create a valid
  # PermissionSet. As you add validations to PermissionSet, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "create__organizations" => "false" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PermissionSetsController. Be sure to keep this updated too.
  let(:valid_session) { {} }


  context "user NOT logged in" do

    describe "GET index" do
      it "redirects to the home page" do
        get :index, {}, valid_session
        response.should redirect_to(new_user_session_path)
      end
    end

    describe "GET show" do
      it "redirects to the home page" do
        permission_set = PermissionSet.create! valid_attributes
        get :show, {:id => permission_set.to_param}, valid_session
        response.should redirect_to(new_user_session_path)
      end
    end

    describe "GET new" do
      it "redirects to the home page" do
        get :new, {}, valid_session
        response.should redirect_to(new_user_session_path)
      end
    end

    describe "GET edit" do
      it "redirects to the home page" do
        permission_set = PermissionSet.create! valid_attributes
        get :edit, {:id => permission_set.to_param}, valid_session
        response.should redirect_to(new_user_session_path)
      end
    end

    describe "PUT update" do
      it "does NOT update" do
        permission_set = PermissionSet.create! valid_attributes
        put :update, {:id => permission_set.to_param, :permission_set => valid_attributes}, valid_session
        PermissionSet.any_instance.should_not_receive(:update).with(valid_attributes)
      end

      it "redirects to the home page" do
        permission_set = PermissionSet.create! valid_attributes
        put :update, {:id => permission_set.to_param, :permission_set => valid_attributes}, valid_session
        response.should redirect_to(new_user_session_path)
      end
    end
    
  end


  context "user logged in" do

    before :each do
      @request.env["devise.mapping"]= Devise.mappings[:user]
      @user = FactoryGirl.create(:user)
      sign_in @user
    end

    describe "GET show" do
      it "assigns the requested permission_set as @permission_set" do
        permission_set = PermissionSet.create! valid_attributes
        get :show, {:id => permission_set.to_param}, valid_session
        assigns(:permission_set).should eq(permission_set)
      end
    end


    describe "GET edit" do
      it "assigns the requested permission_set as @permission_set" do
        permission_set = PermissionSet.create! valid_attributes
        get :edit, {:id => permission_set.to_param}, valid_session
        assigns(:permission_set).should eq(permission_set)
      end
    end


    describe "PUT update" do
      describe "with valid params" do
        it "updates the requested permission_set" do
          permission_set = PermissionSet.create! valid_attributes
          # Assuming there are no other permission_sets in the database, this
          # specifies that the PermissionSet created on the previous line
          # receives the :update_attributes message with whatever params are
          # submitted in the request.
          PermissionSet.any_instance.should_receive(:update).with({ "create__organizations" => "false" })
          put :update, {:id => permission_set.to_param, :permission_set => { "create__organizations" => "false" }}, valid_session
        end

        it "assigns the requested permission_set as @permission_set" do
          permission_set = PermissionSet.create! valid_attributes
          put :update, {:id => permission_set.to_param, :permission_set => valid_attributes}, valid_session
          assigns(:permission_set).should eq(permission_set)
        end

        it "redirects to the permission_set" do
          permission_set = PermissionSet.create! valid_attributes
          put :update, {:id => permission_set.to_param, :permission_set => valid_attributes}, valid_session
          response.should redirect_to(permission_set)
        end
      end

      describe "with invalid params" do
        it "assigns the permission_set as @permission_set" do
          permission_set = PermissionSet.create! valid_attributes
          # Trigger the behavior that occurs when invalid params are submitted
          PermissionSet.any_instance.stub(:save).and_return(false)
          put :update, {:id => permission_set.to_param, :permission_set => { "create__organizations" => "invalid value" }}, valid_session
          assigns(:permission_set).should eq(permission_set)
        end

        it "re-renders the 'edit' template" do
          permission_set = PermissionSet.create! valid_attributes
          # Trigger the behavior that occurs when invalid params are submitted
          PermissionSet.any_instance.stub(:save).and_return(false)
          put :update, {:id => permission_set.to_param, :permission_set => { "create__organizations" => "invalid value" }}, valid_session
          response.should render_template("edit")
        end
      end
    end
  end
end
