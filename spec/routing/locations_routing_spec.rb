require "spec_helper"

describe LocationsController do
  describe "routing" do

    it "routes to #new" do
      get("/organizations/1/locations/new").should route_to("locations#new", :organization_id => "1")
    end

    it "routes to #show" do
      get("/organizations/1/locations/1").should route_to("locations#show", :id => "1", :organization_id => "1")
    end

    it "routes to #edit" do
      get("/organizations/1/locations/1/edit").should route_to("locations#edit", :id => "1", :organization_id => "1")
    end

    it "routes to #create" do
      post("/organizations/1/locations").should route_to("locations#create", :organization_id => "1")
    end

    it "routes to #update" do
      put("/organizations/1/locations/1").should route_to("locations#update", :id => "1", :organization_id => "1")
    end

    it "routes to #destroy" do
      delete("/organizations/1/locations/1").should route_to("locations#destroy", :id => "1", :organization_id => "1")
    end

  end
end
