require 'rails_helper'

RSpec.describe Api::UsersController, type: :controller do
  describe "POST create" do

    it "creates new user" do
      user = FactoryGirl.create(:user)
      serializer = UserSerializer.new(user)
      expect(serializer.serializable_hash[:email]).to eq "user@example.com"
      expect(user.password).to eq "my-password"
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "renders the json representation of the user record" do
      user = FactoryGirl.create(:user)
      @user_atttributes = FactoryGirl.attributes_for :user
      post :create, { user: @user_atttributes }, format: :json
      expect(user[:email]).to eql @user_atttributes[:email]
    end
  end
end
