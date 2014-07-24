require 'rails_helper'

RSpec.describe "Admin::TourOrders", :type => :request do
  describe "GET /admin_tour_orders" do
    it "works! (now write some real specs)" do
      get admin_tour_orders_path
      expect(response.status).to be(200)
    end
  end
end
