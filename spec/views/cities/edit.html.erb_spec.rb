require 'rails_helper'

RSpec.describe "cities/edit", :type => :view do
  before(:each) do
    @city = assign(:city, City.create!(
      :provice => "MyString",
      :name => "MyString",
      :desc => "MyText",
      :position => 1
    ))
  end

  it "renders the edit city form" do
    render

    assert_select "form[action=?][method=?]", city_path(@city), "post" do

      assert_select "input#city_provice[name=?]", "city[provice]"

      assert_select "input#city_name[name=?]", "city[name]"

      assert_select "textarea#city_desc[name=?]", "city[desc]"

      assert_select "input#city_position[name=?]", "city[position]"
    end
  end
end
