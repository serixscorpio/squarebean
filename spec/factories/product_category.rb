FactoryGirl.define do
  factory :cake_category, class: ProductCategory do
    id 1
    name "Cake"
  end

  factory :special_item_category, class: ProductCategory do
    id 2 
    name "Special Item"
  end
end
