class Faq < ActiveRecord::Base
  attr_accessible :answer, :display_order, :question
end
