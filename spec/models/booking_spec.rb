require 'spec_helper'

describe Booking do

  let(:attributes) { FactoryGirl.build(:booking).attributes }

  [ "name", "calendar_id", "booker_id", "time_zone" ].each do |attribute|
    it "should not be valid without #{attribute}" do
      attributes.delete(attribute)
      Booking.create(attributes).should_not be_valid
    end
  end
  
end
