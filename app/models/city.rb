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

class City < ActiveRecord::Base
  def to_s
    name
  end
end
