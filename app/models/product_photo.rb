class ProductPhoto < ActiveRecord::Base
  belongs_to :product
  
  mount_uploader :photo, PhotoUploader
end
