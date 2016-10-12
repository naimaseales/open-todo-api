require 'rails_helper'
require 'rspec_api_documentation/dsl'

RSpec.describe Api::ListsController, type: :controller do
  include AuthHelper

  describe "POST create" do

    it "list size to increase" do
      http_login
      @user = create(:user)
      # @list = create(:list, user: @user)
      @list = create(:list, user_id: @user.id)
      expect{post :create, user_id: @user.id, list: {title: "It's a title", permission: "viewable"}, format: :json}.to change(List, :count).by(1)
      expect(response).to have_http_status(200)
    end
  end

  describe "PUT update" do

    it "updates the list" do
      http_login
      @user = create(:user)
      @list = create(:list, user: @user)
      put :update, list: {permission: "viewable"}, user_id: @user.id, id: @list.id
      expect(response).to have_http_status(200)
    end
  end

  describe "DELETE destroy" do
    it "deletes the list" do
      http_login
      @user = create(:user)
      @list = create(:list, user: @user)
      delete :destroy, user_id: @user.id, id: @list.id
      count = List.where({id: @list.id}).size
      expect(count).to eq 0
    end
  end
end
