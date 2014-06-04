class DisplayEvents
  def self.group_by_categories(category_names)
    event_groups = {}
    category_names.each do |category_name|
      category_sym = category_name.gsub(/\s+/, "_").downcase.to_sym
      event_groups[category_sym] = Event.joins(:event_category).where(event_categories: {name: category_name})
    end
    event_groups
  end
end
