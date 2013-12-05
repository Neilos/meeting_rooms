require 'spec_helper'

describe Booking do

  let(:attributes) { FactoryGirl.build(:booking).attributes }
  [ "name", "calendar_id", "booker_id", "time_zone", "repeats" ].each do |attribute|
    it "should not be valid without #{attribute}" do
      attributes.delete(attribute)
      Booking.new(attributes).should_not be_valid
    end
  end

  context "when all day" do
    context "with missing dates" do
      let(:default_attrs) { ["from_date", "to_date"] }
      let(:with_attrs_missing) {
        FactoryGirl.build(:booking, :is_all_day => true).attributes.select!{|attribute| !default_attrs.include?(attribute)}
      }
      subject { Booking.create with_attrs_missing }
      specify { should be_valid }
      its(:from_date) { should == Date.today }
      its(:to_date) { should == Date.today }
      its(:from_time) { should == Time.now.beginning_of_day }
      its(:to_time) { should == Time.now.end_of_day }
    end
  end

  context "when NOT all day" do
    context "with missing dates" do
      let(:default_attrs) { ["from_date", "to_date"] }
      let(:with_attrs_missing) {
        FactoryGirl.build(:booking, :is_all_day => false).attributes.select!{|attribute| !default_attrs.include?(attribute)}
      }
      subject { Booking.create with_attrs_missing }
      specify { should be_valid }
      its(:from_date) { should == Date.today }
      its(:to_date) { should == Date.today }
    end

    context "with missing times" do
      let(:default_attrs) { ["from_time", "to_time"] }
      let(:with_attrs_missing) {
        FactoryGirl.build(:booking, :is_all_day => false).attributes.select!{|attribute| !default_attrs.include?(attribute)}
      }
      subject { Booking.create with_attrs_missing }
      specify { should be_valid }
      its(:from_time) { should be_within(2.second).of(Time.now) }
      its(:to_time) { should be_within(2.second).of(Time.now + 1.hour) }
    end
  end

end
