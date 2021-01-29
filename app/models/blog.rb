class Blog < ApplicationRecord
  belongs_to :category
  belongs_to :member
  #mount_uploader :image, PictureUploader
  mount_uploader :image, ImageUploader
end
