require 'rails_helper'

RSpec.describe "admin/tours/new", :type => :view do
  before(:each) do
    assign(:admin_tour, Admin::Tour.new())
  end

  it "renders new admin_tour form" do
    render

    assert_select "form[action=?][method=?]", admin_tours_path, "post" do
    end
  end
end
