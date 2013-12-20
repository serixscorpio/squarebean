class MainController < ApplicationController
  def index
    @products = Product.all
    @event_categories = EventCategory.includes(:events)
  end
end
