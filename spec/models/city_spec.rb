# == Schema Information
#
# Table name: cities
#
#  id         :integer          not null, primary key
#  provice    :string(255)
#  name       :string(255)
#  desc       :text
#  position   :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe City, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
