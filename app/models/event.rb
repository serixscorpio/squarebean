class Event < ActiveRecord::Base
  attr_accessible :description, :highlight, :more_details, :name, :picture
end
