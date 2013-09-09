require "spec_helper"

describe CustomAttributesController do
  describe "routing" do

    it "routes to #index" do
      get("/custom_attributes").should route_to("custom_attributes#index")
    end

    it "routes to #new" do
      get("/custom_attributes/new").should route_to("custom_attributes#new")
    end

    it "routes to #show" do
      get("/custom_attributes/1").should route_to("custom_attributes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/custom_attributes/1/edit").should route_to("custom_attributes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/custom_attributes").should route_to("custom_attributes#create")
    end

    it "routes to #update" do
      put("/custom_attributes/1").should route_to("custom_attributes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/custom_attributes/1").should route_to("custom_attributes#destroy", :id => "1")
    end

  end
end
