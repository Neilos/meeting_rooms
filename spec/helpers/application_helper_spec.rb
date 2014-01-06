require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the ApplicationHelper. For example:
#
# describe ApplicationHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end

describe ApplicationHelper do
  it "returns an array of two parameters for a new child element" do
    child = User.new
    parent = Object.new
    shallow_routing_args(parent, child) == [parent, child]
  end

  it "returns the child an existing child element" do
    child = Object.new
    parent = Object.new
    shallow_routing_args(parent, child).should == child
  end

end