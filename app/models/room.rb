# == Schema Information
#
# Table name: rooms
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  price      :float
#  desc       :text
#  created_at :datetime
#  updated_at :datetime
#  hotel_id   :integer
#

class Room < ActiveRecord::Base
  belongs_to :hotel
  has_many :images, as: :imageable
end
