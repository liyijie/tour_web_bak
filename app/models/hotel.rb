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

class Hotel < ActiveRecord::Base
  has_many :rooms
  has_many :images, as: :imageable

  belongs_to :city
  
  def image_thumb
    images.first.photo.url(:medium) if images.first
  end

end
