require "rails_helper"

RSpec.describe Admin::TourOrdersController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/admin/tour_orders").to route_to("admin/tour_orders#index")
    end

    it "routes to #new" do
      expect(:get => "/admin/tour_orders/new").to route_to("admin/tour_orders#new")
    end

    it "routes to #show" do
      expect(:get => "/admin/tour_orders/1").to route_to("admin/tour_orders#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/admin/tour_orders/1/edit").to route_to("admin/tour_orders#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/admin/tour_orders").to route_to("admin/tour_orders#create")
    end

    it "routes to #update" do
      expect(:put => "/admin/tour_orders/1").to route_to("admin/tour_orders#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/admin/tour_orders/1").to route_to("admin/tour_orders#destroy", :id => "1")
    end

  end
end
