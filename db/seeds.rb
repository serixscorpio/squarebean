require 'faker'

product_categories = [
  ProductCategory.create(name: 'Cake'),
  ProductCategory.create(name: 'Special Item') ]
event_categories = [
  EventCategory.create(name: 'Wedding'),
  EventCategory.create(name: 'Birthday'),
  EventCategory.create(name: 'Special Events')
]

# create products
product_categories.each do |product_category|
  rand(4..8).times do
    product_category.products.create(
      name: Faker::Lorem.word,
      description: Faker::Lorem.words(rand(1..2)).join(" "),
      picture: "http://placehold.it/500x500",
      is_gluten_free: [true, false].sample,
      is_dairy_free: [true, false].sample,
      is_vegan: [true, false].sample
    )
  end
end

# create events
event_categories.each do |event_category|
  rand(2..5).times do
    event_category.events.create(
      name: Faker::Lorem.word,
      highlight: Faker::Lorem.words(rand(1..2)).join(" "),
      description: Faker::Lorem.words(rand(1..2)).join(" "),
      picture: File.open(Dir.glob(File.join(Rails.root, 'app/assets/images/events', '*')).sample),
      more_details: "https://www.facebook.com/pages/Square-Bean-%E6%96%B9%E8%87%89%E8%8D%B3%E8%8D%B3/229893950400037"
    )
  end
end

# create faqs
rand(2..5).times do |order|
  Faq.create(
    question: Faker::Lorem.sentence(rand(4..8)),
    answer: Faker::Lorem.sentence(rand(4..8)),
    display_order: order+1
  )
end
