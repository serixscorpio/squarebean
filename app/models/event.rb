class Event < ActiveRecord::Base
  attr_accessible :description, :highlight, :more_details, :name, :picture
  belongs_to :event_category
end
