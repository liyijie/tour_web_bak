class Image < ActiveRecord::Base
  belongs_to :imageable, :polymorphic => true

  # paperclip gem
  has_attached_file :photo, :styles => { :mini => '48x48>', :small => '100x100>', :medium => '200x200>', :product => '320x320>', :large => '600x600>' }

  validates_attachment_presence :photo
  validates_attachment_size     :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/jpg', 'image/png', 'image/gif']

  validates :imageable_type,  :presence => true
  validates :imageable_id,    :presence => true

  default_scope -> { order('position') }
end
