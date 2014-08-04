require 'rails_helper'

RSpec.describe "cities/new", :type => :view do
  before(:each) do
    assign(:city, City.new(
      :provice => "MyString",
      :name => "MyString",
      :desc => "MyText",
      :position => 1
    ))
  end

  it "renders new city form" do
    render

    assert_select "form[action=?][method=?]", cities_path, "post" do

      assert_select "input#city_provice[name=?]", "city[provice]"

      assert_select "input#city_name[name=?]", "city[name]"

      assert_select "textarea#city_desc[name=?]", "city[desc]"

      assert_select "input#city_position[name=?]", "city[position]"
    end
  end
end
