FactoryGirl.define do
  factory :wedding_category, class: EventCategory do
    id 1
    name "Wedding"
  end

  factory :special_events_category, class: EventCategory do
    id 2
    name "Special Events"
  end

  factory :catering_category, class: EventCategory do
    id 3
    name "Catering"
  end
end
