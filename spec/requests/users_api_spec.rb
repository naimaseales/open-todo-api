require 'rails_helper'

RSpec.describe "Users API", type: :request do

  describe "GET /api/users" do
    it "denies access to unauthenticated users" do
      get '/api/users'
      expect(response).to have_http_status(:unauthorized)
      expect(response.body).to eq "HTTP Basic: Access denied.\n"
    end

    it "lists users to authenticated user"
  end
end
