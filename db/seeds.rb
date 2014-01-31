require 'faker'

# common seed data applicable to both development and production environments
product_categories = [
  ProductCategory.create(name: 'Cake'),
  ProductCategory.create(name: 'Special Item') ]
event_categories = [
  EventCategory.create(name: 'Birthday'),
  EventCategory.create(name: 'Wedding'),
  EventCategory.create(name: 'Special Events')
]

case Rails.env
when "development"
  # create products
  product_categories.each do |product_category|
    rand(4..8).times do |i|
      product = product_category.products.create(
        name: Faker::Lorem.word,
        description: Faker::Lorem.words(rand(1..2)).join(" "),
        is_gluten_free: [true, false].sample,
        is_dairy_free: [true, false].sample,
        is_vegan: [true, false].sample,
        price: rand(10..40),
        unit_quantity: ["a dozen", "\u00BD dozen", "8\"", ""].sample, # todo, enable unicode input
        display_order: i+1
      )
      3.times do |j|
        product.product_pictures.create(
          path: "http://placehold.it/500x500",
          display_order: j+1
        )
      end
    end
  end

  # create events
  event_categories.each do |event_category|
    rand(2..5).times do |i|
      event_category.events.create(
        name: Faker::Lorem.word,
        highlight: Faker::Lorem.words(rand(1..2)).join(" "),
        description: Faker::Lorem.words(rand(1..2)).join(" "),
        picture: File.open(Dir.glob(File.join(Rails.root, 'app/assets/images/events', '*')).sample),
        more_details: "https://www.facebook.com/pages/Square-Bean-%E6%96%B9%E8%87%89%E8%8D%B3%E8%8D%B3/229893950400037",
        display_order: i+1
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

  # create admin user
  User.create(
    email: ENV["ADMIN_EMAIL"].dup,
    password: ENV["ADMIN_PASSWORD"].dup,
    password_confirmation: ENV["ADMIN_PASSWORD"].dup
  )

when "production" # production only  seed data

  # create cake products
  cake = product_categories[0].products.create(
    name: "Muffin",
    description: "super awesome!",
    is_gluten_free: true,
    is_dairy_free: false,
    is_vegan: false,
    price: 25,
    unit_quantity: "a dozen",
    display_order: 1
  )
  3.times do |i|
    cake.product_pictures.create(
      path: File.open(Dir.glob(File.join(Rails.root, 'app/assets/images/products/cakes', '*')).sample),
      display_order: i+1
    )
  end

  # create special items
  special_item = product_categories[1].products.create(
    name: "Macaroon",
    description: "super delicious!",
    is_gluten_free: true,
    is_dairy_free: false,
    is_vegan: true,
    price: 30,
    unit_quantity: "\u00BD dozen",  # TODO: enable unicode input
    display_order: 1
  )
  3.times do |i|
    special_item.product_pictures.create(
      path: File.open(Dir.glob(File.join(Rails.root, 'app/assets/images/products/special_items', '*')).sample),
      display_order: i+1
    )
  end

  # create birthday events
  event_categories[0].events.create(
    name: "Emily's 66th day",
    highlight: "Tropical Baby Cake",
    description: "Pina coladas with toasted coconut",
    picture: File.open(Dir.glob(File.join(Rails.root, 'app/assets/images/events', '*')).sample),
    more_details: "https://www.facebook.com/pages/Square-Bean-%E6%96%B9%E8%87%89%E8%8D%B3%E8%8D%B3/229893950400037",
    display_order: 1
  )
  event_categories[0].events.create(
    name: "Vanessa's Birthday",
    highlight: "Chocolate Mint Cake",
    description: "Cravings for chocolate and mint",
    picture: File.open(Dir.glob(File.join(Rails.root, 'app/assets/images/events', '*')).sample),
    more_details: "https://www.facebook.com/pages/Square-Bean-%E6%96%B9%E8%87%89%E8%8D%B3%E8%8D%B3/229893950400037",
    display_order: 2
  )

  # create wedding events
  event_categories[1].events.create(
    name: "Amy's Wedding",
    highlight: "Multi Layer Lava Cake",
    description: "Passion fruit multi-layer lava cake",
    picture: File.open(Dir.glob(File.join(Rails.root, 'app/assets/images/events', '*')).sample),
    more_details: "https://www.facebook.com/pages/Square-Bean-%E6%96%B9%E8%87%89%E8%8D%B3%E8%8D%B3/229893950400037",
    display_order: 1
  )
  event_categories[1].events.create(
    name: "Hawaiian Beachside Wedding",
    highlight: "Snow white cake",
    description: "Snow white cake accented with cherries",
    picture: File.open(Dir.glob(File.join(Rails.root, 'app/assets/images/events', '*')).sample),
    more_details: "https://www.facebook.com/pages/Square-Bean-%E6%96%B9%E8%87%89%E8%8D%B3%E8%8D%B3/229893950400037",
    display_order: 2 
  )
  
  # create special events
  event_categories[2].events.create(
    name: "Charlie's full month celebration",
    highlight: "Variety goodies",
    description: "Belgian waffle and cake",
    picture: File.open(Dir.glob(File.join(Rails.root, 'app/assets/images/events', '*')).sample),
    more_details: "https://www.facebook.com/pages/Square-Bean-%E6%96%B9%E8%87%89%E8%8D%B3%E8%8D%B3/229893950400037",
    display_order: 1
  )
  event_categories[2].events.create(
    name: "Aaron's graduation",
    highlight: "Variety goodies",
    description: "Pecan pie and assorted cookies",
    picture: File.open(Dir.glob(File.join(Rails.root, 'app/assets/images/events', '*')).sample),
    more_details: "https://www.facebook.com/pages/Square-Bean-%E6%96%B9%E8%87%89%E8%8D%B3%E8%8D%B3/229893950400037",
    display_order: 2 
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
