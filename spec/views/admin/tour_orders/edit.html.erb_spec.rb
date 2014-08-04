require 'rails_helper'

RSpec.describe "admin/tour_orders/edit", :type => :view do
  before(:each) do
    @admin_tour_order = assign(:admin_tour_order, Admin::TourOrder.create!())
  end

  it "renders the edit admin_tour_order form" do
    render

    assert_select "form[action=?][method=?]", admin_tour_order_path(@admin_tour_order), "post" do
    end
  end
end
