require 'spec_helper'
require 'rspec_api_documentation/dsl'

resource "Users" do
  get "/api/users" do
    example "Listing users" do
      do_request
      status.should == 401
    end
  end
end
