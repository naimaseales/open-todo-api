require 'rails_helper'

RSpec.describe Api::ItemsController, type: :controller do
  describe "POST create" do

    it "creates new list" do
      # user = FactoryGirl.create(:user)
      # user.list = FactoryGirl.create(:list)
      item = FactoryGirl.create(:item)
      expect(item.description).to eq "This is a to do item"
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
  end
end
