require 'rails_helper'

RSpec.describe "tour_orders/index", :type => :view do
  before(:each) do
    assign(:tour_orders, [
      TourOrder.create!(
        :total_price => 1.5,
        :number => 1,
        :state => "State",
        :user => nil,
      ),
      TourOrder.create!(
        :total_price => 1.5,
        :number => 1,
        :state => "State",
        :user => nil,
      )
    ])
  end

  it "renders a list of tour_orders" do
    render
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
