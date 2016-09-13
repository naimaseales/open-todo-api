require 'rails_helper'

RSpec.describe Api::ListsController, type: :controller do
  include AuthHelper

  describe "POST create" do
    # before { post :create, user_id: my_user.id, list: { title: my_list.title } }
    it "list size to increase" do
      http_login
      @user = create(:user)
      @list = create(:list, user: @user)
      expect{post :create, { user_id: @user.id, id: @list.id }, format: :json}.to   change(List, :count).by(1)
      expect(response).to have_http_status(200)
    end

    it "returns http success" do
      http_login
      @user = create(:user)
      @list = create(:list, user: @user)
      expect(response).to have_http_status(:success)
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
