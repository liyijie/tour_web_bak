class Room < ActiveRecord::Base
  belongs_to :hotel
  has_many :images, as: :imageable
end
