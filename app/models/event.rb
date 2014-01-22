class Event < ActiveRecord::Base
  attr_accessible :description, :highlight, :more_details, :name, :picture, :event_category_id, :display_order
  belongs_to :event_category
  mount_uploader :picture, PictureUploader
end
