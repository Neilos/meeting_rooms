require "spec_helper"

describe RoomsController do
  describe "routing" do

    it "routes to #index" do
      get("/rooms").should route_to("rooms#index")
      get("/locations/1/rooms").should route_to("rooms#index", :location_id => "1")
      get("/organizations/1/rooms").should route_to("rooms#index", :organization_id => "1")
    end

    it "routes to #new" do
      get("/rooms/new").should route_to("rooms#new")
      get("/locations/1/rooms/new").should route_to("rooms#new", :location_id => "1")
      get("/organizations/1/rooms/new").should route_to("rooms#new", :organization_id => "1")
    end

    it "routes to #show" do
      get("/rooms/1").should route_to("rooms#show", :id => "1")
      get("/locations/1/rooms/1").should route_to("rooms#show", :id => "1", :location_id => "1")
      get("/organizations/1/rooms/1").should route_to("rooms#show", :id => "1", :organization_id => "1")
    end

    it "routes to #edit" do
      get("/rooms/1/edit").should route_to("rooms#edit", :id => "1")
      get("/locations/1/rooms/1/edit").should route_to("rooms#edit", :id => "1", :location_id => "1")
      get("/organizations/1/rooms/1/edit").should route_to("rooms#edit", :id => "1", :organization_id => "1")
    end

    it "routes to #create" do
      post("/rooms").should route_to("rooms#create")
      post("/locations/1/rooms").should route_to("rooms#create", :location_id => "1")
      post("/organizations/1/rooms").should route_to("rooms#create", :organization_id => "1")
    end

    it "routes to #update" do
      put("/rooms/1").should route_to("rooms#update", :id => "1")
      put("/locations/1/rooms/1").should route_to("rooms#update", :id => "1", :location_id => "1")
      put("/organizations/1/rooms/1").should route_to("rooms#update", :id => "1", :organization_id => "1")
    end

    it "routes to #destroy" do
      delete("/rooms/1").should route_to("rooms#destroy", :id => "1")
      delete("/locations/1/rooms/1").should route_to("rooms#destroy", :id => "1", :location_id => "1")
      delete("/organizations/1/rooms/1").should route_to("rooms#destroy", :id => "1", :organization_id => "1")
    end

  end
end
