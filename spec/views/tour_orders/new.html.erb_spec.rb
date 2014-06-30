require 'rails_helper'

RSpec.describe "tour_orders/new", :type => :view do
  before(:each) do
    assign(:tour_order, TourOrder.new(
      :total_price => 1.5,
      :number => 1,
      :state => "MyString",
      :user => nil,
    ))
  end

  it "renders new tour_order form" do
    render

    assert_select "form[action=?][method=?]", tour_orders_path, "post" do

      assert_select "input#tour_order_total_price[name=?]", "tour_order[total_price]"

      assert_select "input#tour_order_number[name=?]", "tour_order[number]"

      assert_select "input#tour_order_state[name=?]", "tour_order[state]"

      assert_select "input#tour_order_user_id[name=?]", "tour_order[user_id]"
    end
  end
end
