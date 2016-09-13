require 'rails_helper'

RSpec.describe Api::ItemsController, type: :controller do
  include AuthHelper
  describe "POST create" do

    it "increase items in list" do
      http_login
      @list = create(:list)
      @item = create(:item, list: @list)
      expect{post :create, { list_id: @list.id, id: @item.id }, format: :json}.to   change(Item, :count).by(1)
      expect(response).to have_http_status(200)
    end

    it "returns http success" do
      http_login
      @list = create(:list)
      @item = create(:item, list: @list)
      expect(response).to have_http_status(:success)
    end
  end

  describe "DELETE destroy" do
    it "deletes the list" do
      http_login
      @list = create(:list)
      @item = create(:item, list: @list)
      delete :destroy, user_id: @list.id, id: @item.id
      count = Item.where({id: @item.id}).size
      expect(count).to eq 0
    end
  end
end
