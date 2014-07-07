require 'rails_helper'

RSpec.describe "cities/index", :type => :view do
  before(:each) do
    assign(:cities, [
      City.create!(
        :provice => "Provice",
        :name => "Name",
        :desc => "MyText",
        :position => 1
      ),
      City.create!(
        :provice => "Provice",
        :name => "Name",
        :desc => "MyText",
        :position => 1
      )
    ])
  end

  it "renders a list of cities" do
    render
    assert_select "tr>td", :text => "Provice".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
