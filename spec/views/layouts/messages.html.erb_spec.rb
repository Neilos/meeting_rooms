require 'spec_helper'

describe "layouts/messages.html.erb" do
  it "should show any flash messages" do
    flash[:info] = 'info message'
    flash[:warning] = 'warning message'
    render :partial => 'layouts/messages'
    rendered.should include("info message")
    rendered.should include("warning message")
  end
end
