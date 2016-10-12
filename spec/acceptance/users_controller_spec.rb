require 'rails_helper'
require 'rspec_api_documentation/dsl'

RSpec.describe Api::UsersController, type: :controller do
  include AuthHelper

  describe "POST create" do

    it "creates a user and renders the json representation of the user record" do
      http_login
      @user_atttributes = FactoryGirl.attributes_for :user
      expect{post :create, { user: @user_atttributes }, format: :json}.to   change(User, :count).by(1)
      expect(response).to have_http_status(200)
    end
  end

  describe "DELETE destroy" do
    it "deletes the user" do
      # binding.pry
      http_login
      @user = create(:user)
      delete :destroy, id: @user.id
      count = User.where({id: @user.id}).size
      expect(count).to eq 0
    end
  end
end
