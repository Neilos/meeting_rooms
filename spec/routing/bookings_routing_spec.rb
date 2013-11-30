require "spec_helper"

describe BookingsController do
  describe "routing" do

    it "routes to #index" do
      get("/rooms/1/bookings").should route_to("bookings#index", :room_id => "1")
    end

    it "routes to #new" do
      get("/rooms/1/bookings/new").should route_to("bookings#new", :room_id => "1")
    end

    it "routes to #show" do
      get("/bookings/1").should route_to("bookings#show", :id => "1")
    end

    it "routes to #edit" do
      get("/bookings/1/edit").should route_to("bookings#edit", :id => "1")
    end

    it "routes to #create" do
      post("/rooms/1/bookings").should route_to("bookings#create", :room_id => "1")
    end

    it "routes to #update" do
      put("/bookings/1").should route_to("bookings#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/bookings/1").should route_to("bookings#destroy", :id => "1")
    end

  end
end
