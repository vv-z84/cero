require 'rails_helper'

RSpec.describe "Authentication and Register endpoints", type: :request do
  describe "POST /register" do
      it "registers a new user" do
        params = {
            email: 'usuario@test.com',
            password: 'gg123'
        }

        post "/register", { params: params, as: :json }
        expect(response).to have_http_status(201)
      end
  end
end
