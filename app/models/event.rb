class Event < ActiveRecord::Base
  attr_accessible :description, :highlight, :more_details, :name, :picture, :event_category_id, :display_order
  belongs_to :event_category, inverse_of: :events
  mount_uploader :picture, PictureUploader
  validates :name, :description, :picture, :event_category_id, :display_order, presence: true
end
