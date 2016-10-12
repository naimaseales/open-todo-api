require 'spec_helper'
require 'rspec_api_documentation/dsl'

resource "Orders" do
  get "/orders" do
    example "Listing orders" do
      do_request
      render :json => Order.all
      status.should == 200
    end
  end
end
