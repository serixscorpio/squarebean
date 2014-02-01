class Faq < ActiveRecord::Base
  attr_accessible :answer, :display_order, :question
  default_scope order('display_order asc')
  validates :answer, presence: true
  validates :question, presence: true, uniqueness: true
  validates :display_order, numericality: { only_integer: true }
end
