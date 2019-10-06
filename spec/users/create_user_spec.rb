require 'rails_helper'

RSpec.describe CreateItem do
    it "creates an user" do
        user = { email: 'usuerio@domain.com', password: 'gg123' }
        created = CreateUser.new(User).call(user)
        expect(created.persisted?).to be(true)
    end
end