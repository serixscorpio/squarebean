class ProductPicture < ActiveRecord::Base
  belongs_to :product
  attr_accessible :display_order, :path, :remove_path
  mount_uploader :path,  PictureUploader
  default_scope order('display_order asc')
end
