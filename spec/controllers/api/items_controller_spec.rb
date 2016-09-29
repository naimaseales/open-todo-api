require 'rails_helper'

RSpec.describe Api::ItemsController, type: :controller do
  include AuthHelper
  describe "POST create" do

    it "increase items in list" do
      http_login
      @list = create(:list, user: @user)
      # @item = create(:item, list: @list)
      @item = create(:item, list_id: @list.id, completed: true)
      expect{post :create, item: {description: "Fancy Item", completed: true}, list_id: @list.id}.to change(Item, :count).by(1)
      expect(response).to have_http_status(200)
    end
  end
  describe "PUT update" do

    it "completes the item" do
      http_login
      # @user = create(:user)
      # @list = create(:list, user: @user)
      @list = create(:list, user: @user)
      # @item = create(:item, list: @list)
      @item = create(:item, list_id: @list.id, completed: true)
      put :update, item: {completed: true}, list_id: @list.id, id: @item.id
      expect(response).to have_http_status(200)
    end
  end

  describe "DELETE destroy" do
    it "deletes the list" do
      http_login
      # @user = create(:user)
      @list = create(:list)
      # @item = create(:item, list: @list)
      @item = create(:item, list_id: @list.id, completed: true)
      delete :destroy, list_id: @list.id, id: @item.id
      count = Item.where({id: @item.id}).size
      expect(count).to eq 0
    end
  end
end
