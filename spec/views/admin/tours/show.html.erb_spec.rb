require 'rails_helper'

RSpec.describe "admin/tours/show", :type => :view do
  before(:each) do
    @admin_tour = assign(:admin_tour, Admin::Tour.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
