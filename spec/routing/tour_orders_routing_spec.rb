require "rails_helper"

RSpec.describe TourOrdersController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/tour_orders").to route_to("tour_orders#index")
    end

    it "routes to #new" do
      expect(:get => "/tour_orders/new").to route_to("tour_orders#new")
    end

    it "routes to #show" do
      expect(:get => "/tour_orders/1").to route_to("tour_orders#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/tour_orders/1/edit").to route_to("tour_orders#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/tour_orders").to route_to("tour_orders#create")
    end

    it "routes to #update" do
      expect(:put => "/tour_orders/1").to route_to("tour_orders#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/tour_orders/1").to route_to("tour_orders#destroy", :id => "1")
    end

  end
end
