require 'rails_helper'

RSpec.describe "Admin::Tours", :type => :request do
  describe "GET /admin_tours" do
    it "works! (now write some real specs)" do
      get admin_tours_path
      expect(response.status).to be(200)
    end
  end
end
