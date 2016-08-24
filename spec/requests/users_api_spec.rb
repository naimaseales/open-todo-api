require 'rails_helper'

RSpec.describe "Users API", type: :request do

  describe "GET /api/users" do
    it "denies access to unauthenticated users" do
      get '/api/users'
      expect(response).to have_http_status(:unauthorized)
      expect(response.body).to eq "HTTP Basic: Access denied.\n"
    end

    it "lists users to authenticated user" do
      current_user = create(:user, email: 'me@example.com', password: 'my-password')
      other_user = create(:user, email: 'someone@example.com')

      params = {}
      headers = { 'HTTP_AUTHORIZATION' => "Basic " + Base64::encode64("me@example.com:my-password") }

      get '/api/users', params, headers

      expect(response).to have_http_status(:ok)

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json).to eq([
        {
          id: current_user.id,
          created_at: current_user.created_at.iso8601,
          email: "me@example.com",
          lists: []
        },
        {
          id: other_user.id,
          created_at: other_user.created_at.iso8601, email: "someone@example.com",
          lists: []
        }
      ])
    end
  end
end
