class MainController < ApplicationController
  def index
    @products = Product.all # TODO: is this still needed?
    @event_categories = EventCategory.includes(:events) # TODO: is this still needed?
    @cakes = Product.joins(:product_category).where(product_categories: {name: 'Cake'})
    @special_items = Product.joins(:product_category).where(product_categories: {name: 'Special Item'})
    @birthdays = Event.joins(:event_category).where(event_categories: {name: 'Birthday'})
    @weddings= Event.joins(:event_category).where(event_categories: {name: 'Wedding'})
    @special_events= Event.joins(:event_category).where(event_categories: {name: 'Special Events'})
  end
end
