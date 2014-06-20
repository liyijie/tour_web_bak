class Tour < ActiveRecord::Base
  has_many :tickets
  has_many :images, as: :imageable

  accepts_nested_attributes_for :tickets, :images

  def image_thumb
    images.first.photo.url if images.first
  end
end
