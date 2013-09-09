require "spec_helper"

describe PermissionSetsController do
  describe "routing" do

    it "routes to #index" do
      get("/permission_sets").should route_to("permission_sets#index")
    end

    it "routes to #new" do
      get("/permission_sets/new").should route_to("permission_sets#new")
    end

    it "routes to #show" do
      get("/permission_sets/1").should route_to("permission_sets#show", :id => "1")
    end

    it "routes to #edit" do
      get("/permission_sets/1/edit").should route_to("permission_sets#edit", :id => "1")
    end

    it "routes to #create" do
      post("/permission_sets").should route_to("permission_sets#create")
    end

    it "routes to #update" do
      put("/permission_sets/1").should route_to("permission_sets#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/permission_sets/1").should route_to("permission_sets#destroy", :id => "1")
    end

  end
end
