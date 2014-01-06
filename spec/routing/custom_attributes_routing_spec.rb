require "spec_helper"

describe CustomAttributesController do
  
  describe "routing" do

    it "routes to #destroy" do
      delete("/custom_attributes/1").should route_to("custom_attributes#destroy", :id => "1")
    end

  end

end
