class Event < ActiveRecord::Base
  attr_accessible :description, :highlight, :more_details, :name, :picture, :event_category_id
  belongs_to :event_category
end
