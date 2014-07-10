require 'rails_helper'

RSpec.describe "admin/tours/index", :type => :view do
  before(:each) do
    assign(:admin_tours, [
      Admin::Tour.create!(),
      Admin::Tour.create!()
    ])
  end

  it "renders a list of admin/tours" do
    render
  end
end
