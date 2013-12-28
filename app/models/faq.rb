class Faq < ActiveRecord::Base
  attr_accessible :answer, :display_order, :question
  default_scope order('display_order asc')
end
