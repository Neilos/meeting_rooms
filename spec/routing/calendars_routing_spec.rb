require "spec_helper"

describe CalendarsController do

  describe "routing" do

    it "routes to #index" do
      get("/calendars").should route_to("calendars#index")
    end

  end

end
