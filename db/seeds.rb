require 'faker'

# common seed data applicable to both development and production environments
product_categories = [
  ProductCategory.create(name: 'Cake'),
  ProductCategory.create(name: 'Special Item') ]
event_categories = [
  EventCategory.create(name: 'Wedding'),
  EventCategory.create(name: 'Birthday'),
  EventCategory.create(name: 'Special Events')
]

case Rails.env
when "development"
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

when "production" # production only  seed data

  # create cake products
  product_categories[0].products.create(
    name: "Muffin",
    description: "super awesome!",
    picture: "http://placehold.it/500x500",
    is_gluten_free: true,
    is_dairy_free: false,
    is_vegan: false
  )

  # create special items
  product_categories[1].products.create(
    name: "Macaroon",
    description: "super delicious!",
    picture: "http://placehold.it/500x500",
    is_gluten_free: true,
    is_dairy_free: false,
    is_vegan: true
  )


  # create faqs
  Faq.create(
    question: "How do I order your cakes and desserts as gifts?",
    answer: "Who wouldn't want to share food that taste this good? As much as we would love for your family and friends to taste our food, we are currently unable to ship any of our cakes since we use the freshest ingredients without any preservatives.",
    display_order: 1
  )
  Faq.create(
    question: "Do you deliver?",
    answer: "We are happy to deliver for free to locations that are within 10 miles from the city center of Cypress (90630) on orders that are more than 100 dollars. For orders that are within 100 dollars, we charge $1 for each addition mile beyond the first 10 miles. For orders that are more than 100 dollars to be delivered to a location more than 10 miles away, a fixed delivery charge can be negotiated prior to the delivery.",
    display_order: 2
  )
end
