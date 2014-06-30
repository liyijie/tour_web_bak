require 'rails_helper'

RSpec.describe "TourOrders", :type => :request do
  describe "GET /tour_orders" do
    it "works! (now write some real specs)" do
      get tour_orders_path
      expect(response.status).to be(200)
    end
  end
end
