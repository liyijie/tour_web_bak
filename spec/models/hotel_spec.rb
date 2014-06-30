require "rails_helper"

describe Hotel do
  context "Relation" do
    it { should have_many(:rooms) } 
    it { should have_many(:images) } 
  end
end