require 'rails_helper'

RSpec.describe "admin/tour_orders/index", :type => :view do
  before(:each) do
    assign(:admin_tour_orders, [
      Admin::TourOrder.create!(),
      Admin::TourOrder.create!()
    ])
  end

  it "renders a list of admin/tour_orders" do
    render
  end
end
