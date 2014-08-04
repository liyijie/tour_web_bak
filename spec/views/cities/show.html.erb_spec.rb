require 'rails_helper'

RSpec.describe "cities/show", :type => :view do
  before(:each) do
    @city = assign(:city, City.create!(
      :provice => "Provice",
      :name => "Name",
      :desc => "MyText",
      :position => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Provice/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/1/)
  end
end
