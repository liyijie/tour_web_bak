class Tour < ActiveRecord::Base
  has_many :tickets
  has_many :images, as: :imageable
end
