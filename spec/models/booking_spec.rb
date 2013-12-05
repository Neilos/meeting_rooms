require 'spec_helper'

describe Booking do

  let(:attributes) { FactoryGirl.build(:booking).attributes }
  [ "name", "calendar_id", "booker_id", "time_zone", "repeats" ].each do |attribute|
    it "should not be valid without #{attribute}" do
      attributes.delete(attribute)
      Booking.create(attributes).should_not be_valid
    end
  end

  context "with missing attributes that are set by default" do
    let(:default_attrs){ ["from_date", "to_date", "from_time", "to_time"] }
    let(:default_attrs_missing) { attributes.select{|attribute| !default_attrs.include?(attribute)} }
    subject { Booking.create(default_attrs_missing) }
    specify { should be_valid }
    its(:from_date) { should == Date.today }
    its(:to_date) { should == Date.today }

    context "when all day" do
      its(:from_time) { should == Time.now.beginning_of_day }
      its(:to_time) { should == Time.now.end_of_day }
    end
  end

end
