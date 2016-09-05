require 'rails_helper'

RSpec.describe Api::ListsController, type: :controller do
  describe "POST create" do

    it "creates new list" do
      # user = FactoryGirl.create(:user)
      # user.list = FactoryGirl.create(:list)
      list = FactoryGirl.create(:list)
      expect(list.title).to eq "This list is my list"
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
  end
end
