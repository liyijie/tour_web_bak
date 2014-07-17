require 'rails_helper'

RSpec.describe "Admin::Tickets", :type => :request do
  describe "GET /admin_tickets" do
    it "works! (now write some real specs)" do
      get admin_tickets_path
      expect(response.status).to be(200)
    end
  end
end
