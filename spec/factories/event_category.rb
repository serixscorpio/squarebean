FactoryGirl.define do
  factory :wedding_category, class: EventCategory do
    id 1
    name "Wedding"
  end

  factory :birthday_category, class: EventCategory do
    id 2 
    name "Birthday"
  end

  factory :special_events_category, class: EventCategory do
    id 3 
    name "Special Events"
  end
end
