require 'rails_helper'

RSpec.describe "admin/tour_orders/show", :type => :view do
  before(:each) do
    @admin_tour_order = assign(:admin_tour_order, Admin::TourOrder.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
