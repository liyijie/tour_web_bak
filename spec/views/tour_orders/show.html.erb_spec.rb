require 'rails_helper'

RSpec.describe "tour_orders/show", :type => :view do
  before(:each) do
    @tour_order = assign(:tour_order, TourOrder.create!(
      :total_price => 1.5,
      :number => 1,
      :user => nil,
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(//)
  end
end
