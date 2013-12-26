class FaqController < ApplicationController
  def index
    @faqs = Faq.order(:display_order)
  end
end
