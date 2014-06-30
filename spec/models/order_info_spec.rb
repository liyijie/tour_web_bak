require 'rails_helper'

describe OrderInfo do
  context "validation" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:tel) }
  end
end