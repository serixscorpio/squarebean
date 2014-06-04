class MainController < ApplicationController
  def index
    @products = Product.all # TODO: is this still needed?
    @event_categories = EventCategory.includes(:events) # TODO: is this still needed?
    @cakes = Product.joins(:product_category).where(product_categories: {name: 'Cake'})
    @special_items = Product.joins(:product_category).where(product_categories: {name: 'Special Item'})
    @event_groups = DisplayEvents.group_by_categories(['Wedding', 'Special Events', 'Catering'])
    @faqs = Faq.order(:display_order)
  end
end
