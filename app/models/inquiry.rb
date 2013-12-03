class Inquiry < ActiveRecord::Base
  attr_accessible :content, :email, :name

  validates :email, presence: true, email: true

end


