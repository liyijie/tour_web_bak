# == Schema Information
#
# Table name: hotels
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  addr       :string(255)
#  tel        :string(255)
#  desc       :text
#  traffic    :text
#  created_at :datetime
#  updated_at :datetime
#  city_id    :integer
#

require "rails_helper"

describe Hotel do
  context "Relation" do
    it { should have_many(:rooms) } 
    it { should have_many(:images) } 
  end
end
