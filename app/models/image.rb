# == Schema Information
#
# Table name: images
#
#  id                 :integer          not null, primary key
#  imageable_id       :integer
#  imageable_type     :string(255)
#  image_height       :integer
#  image_width        :integer
#  position           :integer
#  caption            :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  photo_file_name    :string(255)
#  photo_content_type :string(255)
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#

class Image < ActiveRecord::Base
  belongs_to :imageable, :polymorphic => true

  # paperclip gem
  has_attached_file :photo, :styles => { :mini => '48x48>', :small => '100x100>', :medium => '200x200>', :product => '320x320>', :large => '600x600>' }

  validates_attachment_presence :photo
  validates_attachment_size     :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/jpg', 'image/png', 'image/gif']

  # validates :imageable,  :presence => true
  # validates :imageable_id,    :presence => true

  default_scope -> { order('position') }
end
