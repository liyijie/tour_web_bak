require 'rails_helper'

RSpec.describe "admin/tours/edit", :type => :view do
  before(:each) do
    @admin_tour = assign(:admin_tour, Admin::Tour.create!())
  end

  it "renders the edit admin_tour form" do
    render

    assert_select "form[action=?][method=?]", admin_tour_path(@admin_tour), "post" do
    end
  end
end
