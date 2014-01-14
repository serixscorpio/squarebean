class ProductPicture < ActiveRecord::Base
  belongs_to :product
  attr_accessible :display_order, :path
  mount_uploader :path,  PictureUploader
  default_scope order('display_order asc')
end
