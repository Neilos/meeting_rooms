require "spec_helper"

describe ReservationsController do

  describe "routing" do

    it "routes to #index" do
      get("/reservations").should route_to("reservations#index")
    end

  end

end
