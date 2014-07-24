require 'rails_helper'

RSpec.describe "admin/tour_orders/new", :type => :view do
  before(:each) do
    assign(:admin_tour_order, Admin::TourOrder.new())
  end

  it "renders new admin_tour_order form" do
    render

    assert_select "form[action=?][method=?]", admin_tour_orders_path, "post" do
    end
  end
end
