require 'rails_helper'

RSpec.describe "Admin::Users", :type => :request do
  describe "GET /admin_users" do
    it "works! (now write some real specs)" do
      get admin_users_path
      expect(response.status).to be(200)
    end
  end
end
