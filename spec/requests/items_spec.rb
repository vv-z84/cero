require 'rails_helper'

RSpec.describe "Items endpoints", type: :request do
  describe "GET /items" do
    context "when user is not logged in" do
      it "gives unauthorized response" do
        get "/items"
        expect(response).to have_http_status(401)
      end
    end

    context "when user is logged in" do
      it "should give all items recorded" do
        token = create_and_login("test@user.com", "pk123")
        headers = { 'Authorization' => "Bearer #{token}" } 
        get "/items", headers: headers
        expect(response).to have_http_status(200)
      end
    end
  end
end
