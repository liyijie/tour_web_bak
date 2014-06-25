class Hotel < ActiveRecord::Base
  has_many :rooms
  has_many :images, as: :imageable

  def image_thumb
    images.first.photo.url(:medium) if images.first
  end

end
