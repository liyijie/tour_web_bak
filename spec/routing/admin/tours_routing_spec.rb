require "rails_helper"

RSpec.describe Admin::ToursController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/admin/tours").to route_to("admin/tours#index")
    end

    it "routes to #new" do
      expect(:get => "/admin/tours/new").to route_to("admin/tours#new")
    end

    it "routes to #show" do
      expect(:get => "/admin/tours/1").to route_to("admin/tours#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/admin/tours/1/edit").to route_to("admin/tours#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/admin/tours").to route_to("admin/tours#create")
    end

    it "routes to #update" do
      expect(:put => "/admin/tours/1").to route_to("admin/tours#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/admin/tours/1").to route_to("admin/tours#destroy", :id => "1")
    end

  end
end
