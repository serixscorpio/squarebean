class EventCategory < ActiveRecord::Base
  attr_accessible :name
  has_many :events, inverse_of: :event_category
end
